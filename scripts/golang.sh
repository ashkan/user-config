tee -a ~/.zshrc <<EOF
export GOPATH=~/Workspace/golang
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
EOF
go get github.com/githubnemo/CompileDaemon

