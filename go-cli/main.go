package main
import (
	"flag"
	"errors"
	"encoding/json"
	"fmt"
)

type listing struct {
	title	string,
	price	int,
	desc	string,
	gpg_pub	string,
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
	req.Header.Set("Content-Type", "application/json; charset=utf-8") //TODO Set content type
}

func listingstring(input string){
	wordlist := strings.FieldsFunc(s, func(r rune) bool {
		if r == ‘,’ {
	 		return true
		}
		return false
	})

	if (len(wordlist) < 5){
		errors.new("Format error")
	}
	createlisting(
		wordlist[0],
		wordlist[1],
		wordlist[2],
		wordlist[3],
		//TODO range 4 to end
	)
}
func main() {
	interactive := flag.Bool("i", false, "Create a listing in interactive mode")
	oneshot := flag.Bool("1" false, "Create a listing in oneshot mode")
	pipe := flag.Bool("p" false, "Create listings in pipe mode")
	flag.Parse()

	if(pipe){

	}
	else if(interactive){

	}
	else if(oneshot){

	}
	else if(orderbook){

	}
	errors.new("No action given. see README.org for operation instructions")
}
