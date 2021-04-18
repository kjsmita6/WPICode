package main

import (
    "fmt"
    "time"
    "project-go-warmup/cs4513_go_impl"
)

func main() {
	//TODO: implement me
	// HINT: need to import the cs4513_go_impl package
	// HINT: use the time package for measurement
    Test("q2_test1.txt")
    Test("q2_test2.txt")
    Test("q2_test3.txt")
    Test("q2_test4.txt")
    Test("q2_test5.txt")

}

func Test(file string) {
    dir := "./cs4513_go_test/"
    file = fmt.Sprintf("%s%s", dir, file)
    fmt.Printf("Running workload file: %s\n", file)
    for i := 1; i <= 100000; i *= 10 {
        start := time.Now()
        result := cs4513_go_impl.Sum(i, file)
        elapsed := time.Now().Sub(start)
        if result == 0 {
            break
        }
        fmt.Printf("result: %d, num of workers: %d, time: %v\n", result, i, elapsed)
    }
}
