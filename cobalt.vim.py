import json
import collections
import re
import os.path
import subprocess

gitPattern = '([^/]+)/([^/]+)'
gitPattern = re.compile(gitPattern)
cleanComment = re.compile('^\s*//.*|^\s*$', re.MULTILINE)

def testGit(x):
    try:
        return gitPattern.findall(x)[0]
    except:
        return False

def gitAsyncClone(username, repo, path):
    url = 'https://github.com/%s/%s.git' % (username, repo)
    print url
    subprocess.Popen(['git', 'clone', '--depth', '1', url, path])

def installGit(username, repo):
    # url = 'https://github.com/%s/%s.git' % (username, repo)
    path = '~/.vim/cobalt/%s_%s' % (username, repo)
    path = os.path.expanduser(path)
    gitAsyncClone(username, repo, path)
    print path

with open('plugins.json') as file:
    data = file.read()
    data = cleanComment.sub('', data)
    print data
    data = json.loads(data, object_pairs_hook=collections.OrderedDict)

    for plugin, options in data.items():
        print plugin, options
        match = testGit(plugin)
        if match:
            print match
            installGit(*match)
            print
