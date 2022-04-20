package main
import (
	"flag"
	"errors"
	"encoding/json"
	"fmt"
)

type listing {
	title	string
	price	int
	desc	string
	gpg_pub	string
	images	[]string
}

var ipfsendpoint = "http://localhost:5001/"

func createlisting(title string, price int, desc string,
	gpg_pub string, images []string){
	listing := listing{
		title:	title
		price:	price
		desc:	desc
		gpg_pub:gpg_pub
		images:	images
	}
	jsonlisting, _ := json.Marshal(listing)
	req, err := http.NewRequest(http.MethodPut,
		ipfsendpoint + "/ipfs/v0/add", bytes.NewBuffer(json))
	req.Header.Set("Content-Type", "application/json; charset=utf-8")



}
func main() {
	interactive := flag.Bool("i", false, "Create a listing in interactive mode")
	oneshot := flag.Bool("1" false, "Create a listing in oneshot mode")
	pipe := flag.Bool("p" false, "Create listings in pipe mode")
	flag.Parse()

	errors.new("No action given. see README.org for operation instructions")
}
