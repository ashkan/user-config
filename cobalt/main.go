package main

import (
	"bufio"
	"encoding/json"
	"errors"
	git "gopkg.in/libgit2/git2go.v22"
	"log"
	"os"
	"os/exec"
	"os/user"
	"path/filepath"
	"regexp"
	"strings"
)

type Options struct {
	Postinstall string `json:"postinstall"`
	Postupdate  string `json:"postupdate"`
	LazyLoad    string `json:"lazy"`
	Branch      string `json:"branch"`
}

var commentPattern = regexp.MustCompile(`^\s*//.*`)

func LoadPlugins(path string) (map[string]*Options, error) {
	file, err := os.Open(path)
	if err != nil {
		return nil, err
	}
	defer file.Close()

	contents := make([]byte, 0)
	scanner := bufio.NewScanner(file)

	for scanner.Scan() {
		if !commentPattern.MatchString(scanner.Text()) {
			contents = append(contents, scanner.Text()...)
		}
	}
	if err := scanner.Err(); err != nil {
		return nil, err
	}

	plugins := make(map[string]*Options)

	if json.Unmarshal(contents, &plugins); err != nil {
		return nil, err
	}
	return plugins, nil
}

type Plugin struct {
	Name string
	// User string
	// Repo string
	// repo *git.Repository
}

func LoadPlugin(name string) (p *Plugin, err error) {
	p = &Plugin{name}
	// p = &Plugin{name, nil}
	// p.repo, err = git.OpenRepositoryExtended(p.LocalPath())
	// if err != nil {
	// 	return nil, err
	// }
	return
}

func (p *Plugin) LocalPath() string {
	return filepath.Join(CobaltPath, strings.Replace(p.Name, "/", ".", -1))
}

func (p *Plugin) Url() string {
	return "https://github.com/" + p.Name
}

func (p *Plugin) Install() error {
	return gitClone(p.Url(), p.LocalPath())
}

var usr, _ = user.Current()

var CobaltPath = usr.HomeDir + "/.vim/cobalt/"

var SHELL = os.Getenv("SHELL")

func Execute(command string) ([]byte, error) {
	return exec.Command(SHELL, "-c", command).Output()
}

func output(cmd *exec.Cmd, path string) string {
	if path != "" {
		cmd.Dir = path
	}
	output, err := cmd.Output()
	if err != nil {
		return ""
	}
	return string(output)
}

type VersionInfo struct {
	Tag      string
	Revision string
	Branch   string
}

func LoadVersionInfo(path string) *VersionInfo {
	info := &VersionInfo{}
	info.Tag = output(exec.Command("git", "describe", "--tags"), path)
	info.Revision = output(exec.Command("git", "rev-parse", "HEAD"), path)
	info.Branch = output(exec.Command("git", "symbolic-ref", "-q", "HEAD"), path)
	t := strings.Split(info.Branch, "/")
	if s := strings.TrimSpace(t[len(t)-1]); s == "" {
		info.Branch = s
	} else {
		info.Branch = s
	}
	return info
}

func gitClone(url, path string) error {
	output, err := exec.Command("git", "clone", "--depth", "1", url, path).CombinedOutput()
	if err != nil {
		return errors.New(string(output))
	}
	return nil
}

func main() {
	CobaltPath = "test"
	plugins, err := LoadPlugins("plugins.json")
	fatal(err)

	installs := make(map[string]chan error)

	for pluginName, options := range plugins {
		plugin := &Plugin{pluginName}
		if repo, err := git.OpenRepository(plugin.LocalPath()); err != nil {
			// TODO: Validate plugin name
			// plugin, err := LoadPlugin(pluginName)
			tx := make(chan error)
			go func() {
				tx <- gitClone(plugin.Url(), plugin.LocalPath())
			}()
			installs[pluginName] = tx
		} else {
			if options.Branch != "" {
				head, _ := repo.Head()
				revision := head.Target().String()
				branch, _ := head.Branch().Name()
				iter, _ := repo.NewReferenceIterator()
				tag := ""
				ref, err := iter.Next()
				for err == nil {
					if ref.IsTag() {
						// log.Println(ref.Name())
						tag = ref.Name()
					}
					ref, err = iter.Next()
				}

				branch, err := repo.LookupBranch(options.Branch, git.BranchLocal)
				if err != nil {
					log.Printf("branch: %s doesn't exist\n", options.Branch)
				} else {
				}
				tag, _ := repo.LookupTag(head.Target())
				log.Println(pluginName, *options, revision, branch, tag)
			}
		}
		// log.Println("error:", <-gitCloneAsync(plugin.Url(), plugin.LocalPath()))
		// log.Println(plugin.Install())
	}
	for pluginName, err := range installs {
		log.Println("Status:", pluginName, ":", <-err)
		// log.Println(plugin.Install())
	}

	// 	git.OpenRepository()
}

func fatal(err error) {
	if err != nil {
		log.Fatal(err)
	}
}
