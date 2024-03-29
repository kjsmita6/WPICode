package cs4513_go_impl

import (
    "os"
	"bufio"
	"io"
	"strconv"
)

/*
Do NOT modify function signature.

Sum numbers from channel `nums` and output sum to `out`.
You should only output to `out` once.
*/
func sumWorker(nums chan int, out chan int) {
	// TODO: implement me
	// HINT: use for loop over `nums`
    sum := 0
    for num := range nums {
        sum += num
    }
    out <- sum
    close(out)
}

/*
Do NOT modify function signature.

Read integers from the file `fileName` and return sum of all values.
This function must launch `num` go routines running `sumWorker` to find the sum of the values concurrently.

You should use `checkError` to handle potential errors.
*/
func Sum(num int, fileName string) int {
	// TODO: implement me
	// HINT: use `readInts` and `sumWorkers`
	// HINT: used buffered channels for splitting numbers between workers
	file, _ := os.Open(fileName)
    nums, _ := readInts(file)
    sum := 0
    for i := 0; i < num; i++ {
        elements := len(nums) / num
        start := i * elements
        end := start + elements
        channel := make(chan int, elements)
        for j := start; j < end; j++ {
            channel <- nums[j]
        }
        out := make(chan int, 1)
        go sumWorker(channel, out)
        close(channel)
        sum += <-out
    }
    return sum
}

/*
Do NOT modify this function.
Read a list of integers separated by whitespace from `r`.
Return the integers successfully read with no error, or
an empty slice of integers and the error that occurred.
*/
func readInts(r io.Reader) ([]int, error) {
	scanner := bufio.NewScanner(r)
	scanner.Split(bufio.ScanWords)
	var elems []int
	for scanner.Scan() {
		val, err := strconv.Atoi(scanner.Text())
		if err != nil {
			return elems, err
		}
		elems = append(elems, val)
	}
	return elems, nil
}
