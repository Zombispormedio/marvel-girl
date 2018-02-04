build:
	CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o marvel-girl .
clean:
	rm build
before_install: 
	wget https://dl.google.com/go/go1.9.3.linux-amd64.tar.gz
	sudo tar -C /usr/local -xzf go1.9.3.linux-amd64.tar.gz
	export PATH=$PATH:/usr/local/go/bin
	export GOROOT=$HOME
	export PATH=$PATH:$GOROOT/bin
install: 
	go get github.com/tools/godep
	godep restore
docker-build:
	docker build -t marvel-girl .
docker-run:
	docker run -it marvel-girl
