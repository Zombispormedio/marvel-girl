before_install:
	curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
	sudo apt-get install -y nodejs
install:
	npm install now -g
build:
	CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o marvel-girl .
pre_deploy:
	mkdir build
	cp Dockerfile build
	mv marvel-girl build
clean:
	rm build
before_install_go: 
	wget https://dl.google.com/go/go1.9.3.linux-amd64.tar.gz
	sudo tar -C /usr/local -xzf go1.9.3.linux-amd64.tar.gz
	export PATH=$PATH:/usr/local/go/bin
	export GOROOT=$HOME
	export PATH=$PATH:$GOROOT/bin
install_go: 
	go get github.com/tools/godep
	godep restore
docker-build:
	docker build -t marvel-girl .
docker-run:
	docker run -it marvel-girl
