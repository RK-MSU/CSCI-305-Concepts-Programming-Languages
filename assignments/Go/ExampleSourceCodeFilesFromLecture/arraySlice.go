package main

import "fmt"

func main() {
    s := make([]string, 3)
    fmt.Println("emp:", s)
    s[0] = "a"
    s[1] = "b"
    s[2] = "c"
    fmt.Println("set:", s)
    fmt.Println("get:", s[2])


//len returns the length of the slice as expected.
    fmt.Println("len:", len(s))


//In addition to these basic operations, slices support several more that make them richer than arrays. One is the builtin append, which returns a slice containing one or more new values. Note that we need to accept a return value from append as we may get a new slice value.
    s = append(s, "d")
    s = append(s, "e", "f")
    fmt.Println("apd:", s)
  

//Slices can also be copy’d. Here we create an empty slice c of the same length as s and copy into c from s.
    c := make([]string, len(s))
    copy(c, s)
    fmt.Println("cpy:", c)



}
