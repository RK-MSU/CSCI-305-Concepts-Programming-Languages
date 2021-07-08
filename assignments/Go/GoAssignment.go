package main

import (
    "bufio"
    "fmt"
//    "io"
    "io/ioutil"
    "os"
    "strings"
    "strconv"
)


func check(e error) {
  if e != nil {
    //fmt.Println(e)
    //os.Exit(1)
    panic(e)
  }
}




func openAndReadFile(file_name string) string {
  f_buffer, err := ioutil.ReadFile(file_name)
  check(err)
  file_data := string(f_buffer)
  return file_data
}



func writeOutput(filename string, content string) {
  f, err1 := os.Create(filename)
  check(err1)
  defer f.Close()
  _, err2 := f.WriteString(content)
  check(err2)
}



func IsNumeric(s string) bool {
   _, err := strconv.ParseFloat(s, 64)
   return err == nil
}



func parseOutNums(content string) string {
  
  result := ""
  content_data := bufio.NewScanner(strings.NewReader(content))
  content_data.Split(bufio.ScanRunes)

  for content_data.Scan() {
    char := content_data.Text()
    if(IsNumeric(char) == false) {
      result = result + char
    }
  }
  
  return result
}








func main() {

  sep := "--------------------------------------------------"
  fmt.Println()
  fmt.Println(sep)
  fmt.Println("Go Programming Assignment")
  fmt.Println(sep)

  reader := bufio.NewReader(os.Stdin)
  file_name := ""
  newfile_name := ""
	argsWithoutProg := os.Args[1:]

  if(len(argsWithoutProg) > 0) {
    file_name = argsWithoutProg[0]

    if(len(argsWithoutProg) > 1) {
      newfile_name = argsWithoutProg[1]
    }

  } else {
    fmt.Print("Please provide the name of the input file:\n-> ")
    file_name, _ = reader.ReadString('\n')
    file_name = strings.Replace(file_name, "\n", "", -1)
  }

  if(len(newfile_name) == 0) {
    fmt.Print("Please provide the name of the output file:\n-> ")
    newfile_name, _ = reader.ReadString('\n')
    newfile_name = strings.Replace(newfile_name, "\n", "", -1)
  }


  content := openAndReadFile(file_name)
  out_content := parseOutNums(content)


  writeOutput(newfile_name, out_content)


  fmt.Printf("\n%-20s'%s'\n%-20s'%s'\n\n", "Input File Name:", file_name, "New File Name:", newfile_name) //, content, out_content)
  fmt.Printf("\n%s\n%s\n%s\n\n%s\n%s\n%s\n\n", "Input File Content:", "-------------------", content, "New File Content:", "-----------------", out_content)

  fmt.Printf("%s\nDONE\n%s\n\n", sep,sep)



  // reader := bufio.NewReader(os.Stdin)


  //fmt.Println("---------------------")
  //fmt.Println("Go Assignment")
  //fmt.Println("---------------------")
  //fmt.Println("Please provide the name of the text file.")
  //fmt.Print("-> ")
  	


  //filename, _ := reader.ReadString('\n')
  // convert CRLF to LF
  //filename = strings.Replace(filename, "\n", "", -1)


  //file_data, err := ioutil.ReadFile(filename)
  //check(err)

  //fmt.Printf("\nFile Contents:\n%s\n", file_data)


//	filename := "data"

	// Perhaps the most basic file reading task is slurping 
	// a file’s entire contents into memory.
//	dat, err := ioutil.ReadFile(filename)
//    check(err)

	// You’ll often want more control over how and what parts 
	// of a file are read. For these tasks, start by Opening 
	// a file to obtain an os.File value.
//	f, err := os.Open(filename)
//	check(err)


	// Close the file when you’re done (usually this would be 
	// scheduled immediately after Opening with defer).
//	f.Close()

}