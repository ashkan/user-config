// vim: fdm=marker
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
	PostInstall string `json:"postinstall,omitempty"`
	Postupdate  string `json:"postupdate,omitempty"`
	LazyLoad    string `json:"lazy,omitempty"`
	Branch      string `json:"branch,omitempty"`
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
	Name     string `json:"-"`
	*Options `json:"-"`
	Version  *VersionInfo `json:"version"`
	// User string
	// Repo string
	// repo *git.Repository
}

func LoadPlugin(name string, opt *Options) (*Plugin, error) {
	if opt.Branch == "" {
		opt.Branch = "master"
	}
	p := &Plugin{name, opt, nil}
	if err := p.ReloadVersion(); err != nil {
		return nil, err
	}
	return p, nil
}

func (plugin *Plugin) ReloadVersion() error {
	if repo, err := git.OpenRepository(plugin.LocalPath()); err != nil {
		return err
	} else {
		if plugin.Version, err = VersionInfoFromRepo(repo); err != nil {
			return err
		} else {
			return nil
		}
	}
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

func shell(command, path string) (string, error) {
	cmd := exec.Command(SHELL, "-c", command)
	if path != "" {
		cmd.Dir = path
	}
	out, err := cmd.CombinedOutput()
	return string(out), err
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
	Tag      string `json:"tag,omitempty"`
	Revision string `json:"revision"`
	Branch   string `json:"branch"`
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

func VersionInfoFromRepo(repo *git.Repository) (*VersionInfo, error) {
	v := new(VersionInfo)
	var err error
	var head *git.Reference
	head, err = repo.Head()
	if err != nil {
		return nil, err
	}
	v.Revision = head.Target().String()
	v.Branch, err = head.Branch().Name()
	if err != nil {
		return nil, err
	}
	// iter, err := repo.NewReferenceIterator()
	// if err != nil {
	// 	return nil, err
	// }
	// v.Tag := ""
	// ref, err := iter.Next()
	// for err == nil {
	// 	if ref.IsTag() {
	// 		v.Tag = ref.Name()
	// 	}
	// 	ref, err = iter.Next()
	// }
	return v, nil
}

func gitClone(url, path string) error {
	output, err := exec.Command("git", "clone", "--depth", "1", url, path).CombinedOutput()
	if err != nil {
		return errors.New(string(output))
	}
	return nil
}

func (plugin *Plugin) Check() error {
	if repo, err := git.OpenRepository(plugin.LocalPath()); err != nil {
		return err
	} else if info, err := VersionInfoFromRepo(repo); err != nil {
		return err
	} else {
		if info.Branch != plugin.Options.Branch {
			if _, err := repo.LookupBranch("origin/"+plugin.Options.Branch, git.BranchRemote); err != nil {
				log.Printf("branch: %s doesn't exist\n", plugin.Options.Branch)
			} else {
				cmd := exec.Command("git", "checkout", plugin.Options.Branch)
				cmd.Dir = plugin.LocalPath()
				return cmd.Run()
			}
		}
		plugin.Version = info
	}
	return nil
}

func InstallAll(plugins map[string]*Options) map[string]*Plugin {
	installs := make(map[string]chan error)
	installed := make(map[string]*Plugin)

	for pluginName, options := range plugins {
		// TODO: Validate plugin name
		if plugin, err := LoadPlugin(pluginName, options); err != nil {
			tx := make(chan error)
			go func() {
				tx <- plugin.Install()
			}()
			installs[pluginName] = tx
		} else {
			installed[pluginName] = plugin
			log.Println(plugin.Check())
		}
		// plugin := &Plugin{pluginName}
		// if repo, err := git.OpenRepository(plugin.LocalPath()); err != nil {
		// 	tx := make(chan error)
		// 	go func() {
		// 		tx <- plugin.Install()
		// 	}()
		// 	installs[pluginName] = tx
		// } else {
		// 	info, _ := VersionInfoFromRepo(repo)
		// 	if options.Branch == "" {
		// 		options.Branch = "master"
		// 	}
		// 	if info.Branch != options.Branch {
		// 		// if !(options.Branch == "" && branch == "master") || branch != options.Branch {
		// 		if _, err := repo.LookupBranch("origin/"+options.Branch, git.BranchRemote); err != nil {
		// 			log.Printf("branch: %s doesn't exist\n", options.Branch)
		// 		} else {
		// 			cmd := exec.Command("git", "checkout", options.Branch)
		// 			cmd.Dir = plugin.LocalPath()
		// 			cmd.Run()
		// 		}
		// 	}

		// 	log.Println(pluginName, *options, info.Revision, info.Branch)
		// }
	}
	for pluginName, errRx := range installs {
		if err := <-errRx; err != nil {
			log.Println("Failed:", pluginName, ":", err.Error())
			continue
		}
		if plugin, err := LoadPlugin(pluginName, plugins[pluginName]); err != nil {
			log.Println("Failed to load plugin:", err.Error())
		} else {
			installed[pluginName] = plugin
			cmd := exec.Command(SHELL, "-c", plugin.Options.PostInstall)
			cmd.Dir = plugin.LocalPath()
			cmd.Stdout = os.Stdout
			cmd.Stderr = os.Stderr
			if err := cmd.Run(); err != nil {
				log.Println("Failed to postinstall:", err.Error())
			}
		}
	}
	return installed
}

type Lock struct {
	*Options `json:"options"`
	Version  *VersionInfo `json:"version"`
}

func LoadLock(path string) (map[string]*Lock, error) {
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
	locks := make(map[string]*Lock)

	if json.Unmarshal(contents, &locks); err != nil {
		return nil, err
	}
	return locks, nil
}

// func LoadLock(path string) (map[string]*Lock, error) {
// 	file, err := os.Open(path)
// 	if err != nil {
// 		return nil, err
// 	}
// 	defer file.Close()

// 	locks := make(map[string]*Lock)
// 	if err := json.NewDecoder(file).Decode(&locks); err != nil {
// 		return nil, err
// 	}
// 	return locks, nil
// }

func main() {
	CobaltPath = "test"
	plugins, err := LoadPlugins("plugins.json")
	fatal(err)
	// locks, err := LoadLock("./cobalt.vimlock")
	// locks, err := LoadLock("plugins.json")
	// fatal(err)

	// for name, lock := range locks {
	// 	log.Println(name, *lock)
	// }
	lock := InstallAll(plugins)
	file, err := os.OpenFile("lock.cobalt", os.O_WRONLY|os.O_CREATE|os.O_TRUNC, 0666)
	fatal(err)
	defer file.Close()
	json.NewEncoder(file).Encode(lock)
}

func fatal(err error) {
	if err != nil {
		log.Fatal(err)
	}
}
