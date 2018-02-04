package main

import (
	"fmt"
	"log"

	"github.com/buaazp/fasthttprouter"
	"github.com/valyala/fasthttp"
)

func index(ctx *fasthttp.RequestCtx) {
	fmt.Fprint(ctx, "Hello World")
}

func main() {
	router := fasthttprouter.New()
	router.GET("/", index)

	err := fasthttp.ListenAndServe(":80", router.Handler)
	log.Fatal(err)
}
