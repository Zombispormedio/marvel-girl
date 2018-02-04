package main

import (
	"fmt"
	"log"
	"os"

	"github.com/buaazp/fasthttprouter"
	"github.com/valyala/fasthttp"
)

func index(ctx *fasthttp.RequestCtx) {
	fmt.Fprint(ctx, "Hello World")
}

func main() {
	port := os.Getenv("PORT")

	if port == "" {
		log.Fatal("$PORT must be set")
	}

	router := fasthttprouter.New()
	router.GET("/", index)

	err := fasthttp.ListenAndServe(":"+port, router.Handler)
	log.Fatal(err)
}
