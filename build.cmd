@echo off
set CGO_ENABLED=0 
set GOOS=windows

go build -a -installsuffix cgo -o marvel-girl.exe .