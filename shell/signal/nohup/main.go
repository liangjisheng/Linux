package main

import (
	"fmt"
	"time"
)

func main() {
	fmt.Print("input name:")
	var name string
	fmt.Scanln(&name)

	for {
		fmt.Println("name:", name)
		time.Sleep(time.Second)
	}
}
