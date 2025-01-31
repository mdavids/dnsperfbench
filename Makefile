VERSION=v0.1.7
GOVERSION=$(shell go version)
LDFLAGS='-X main.versionString=${VERSION} -X "main.goVersionString=${GOVERSION}"'

release:
	#Make release assets
	#echo ${LDFLAGS}
	CGO_ENABLED=0 go build -ldflags ${LDFLAGS} -o bin/dnsperfbench-linux main.go
	CGO_ENABLED=0 GOOS=darwin go build -ldflags ${LDFLAGS} -o bin/dnsperfbench-osx main.go
	CGO_ENABLED=0 GOOS=windows go build -ldflags ${LDFLAGS} -o bin/dnsperfbench.exe main.go
