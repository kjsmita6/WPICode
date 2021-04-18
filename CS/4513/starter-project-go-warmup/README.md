CS4513: Project 2 Go Basic
==========================

Team members
-----------------

1. Kyle Smith (kjsmith@wpi.edu)

Two Problems
------------------

1. What is the difference between unbuffered and buffered channels? And why do you choose one over the other for this assignment?

    In an unbuffered channel, the channel can only accept data if there is a channel that is
    waiting to receive the data. In a buffered channel, you can send data even if there is no
    receiving channel. In this project, we needed to do buffered channels so that all the numbers
    can be sent to the channel before the sum function is called, otherwise some values may not
    be summed properly.

2. Briefly explain how you approached the two problems.

    The first problem was a pretty straightforward and classic computer science problem. Using
    the map structure, I was able to use the word as the key and the WordCount struct as the
    value. Going through each word in the line, I check if it already exists in the map. If not,
    I add it with a count of one. If it exists, I get the struct, add one to the count, and add
    it back. Finally, I got a list of all the map values (i.e. the WordCount structs) and sorted
    them.

    The second problem was more difficult. Creating the sumWorker class was pretty easy, I just
    needed to loop through the nums channel, sum the values, and send them to the out channel
    (outside the loop). The Sum function was much more difficult, mainly because I didn't know
    how channels worked that well. After reading the file, I calculated how many "groups" of
    numbers I needed based on the amount of workers (e.g., if I have 3 workers, I will need
    to split the nums array into 3 equally sized groups to sum the array at the same time).
    Once I had this, I calculated the start and end positions in the array for each group and
    added them to a buffered channel. After all numbers in the group were added, create the
    out channel and call the sumWorked routine. Finally, add the value of the out channel to
    the sum variable and return once all workers are done.


Measurement Part
------------------

Your Reference output:

Running workload file: ./cs4513_go_test/q2_test1.txt
 2 result: 499500, num of workers: 1, time: 131.46µs
 3 result: 499500, num of workers: 10, time: 115.86µs
 4 result: 499500, num of workers: 100, time: 2.280821ms
 5 result: 499500, num of workers: 1000, time: 666.68µs
 6 Running workload file: ./cs4513_go_test/q2_test2.txt
 7 result: 117652, num of workers: 1, time: 1.676741ms
 8 result: 117652, num of workers: 10, time: 102.27µs
 9 result: 117652, num of workers: 100, time: 139.99µs
10 result: 117652, num of workers: 1000, time: 536.46µs
11 Running workload file: ./cs4513_go_test/q2_test3.txt
12 result: 617152, num of workers: 1, time: 206.871µs
13 result: 617152, num of workers: 10, time: 193.56µs
14 result: 617152, num of workers: 100, time: 1.89902ms
15 result: 617152, num of workers: 1000, time: 6.397201ms
16 Running workload file: ./cs4513_go_test/q2_test4.txt
17 result: 4995000, num of workers: 1, time: 1.04233ms
18 result: 4995000, num of workers: 10, time: 850.42µs
19 result: 4995000, num of workers: 100, time: 3.837251ms
20 result: 4995000, num of workers: 1000, time: 1.25033ms
21 result: 4995000, num of workers: 10000, time: 12.141163ms
22 Running workload file: ./cs4513_go_test/q2_test5.txt
23 result: 49950000, num of workers: 1, time: 8.654102ms
24 result: 49950000, num of workers: 10, time: 8.115811ms
25 result: 49950000, num of workers: 100, time: 8.334352ms
26 result: 49950000, num of workers: 1000, time: 8.420212ms
27 result: 49950000, num of workers: 10000, time: 12.130202ms
28 result: 49950000, num of workers: 100000, time: 48.419711ms


Observations and Explanation:

    The main thing I notice is that the times seem to increase a lot with more workers, whereas
    I expected the opposite since they would be working in parallel. This could be caused by
    some overhead when creating routines, or simply the fact that I don't know how to make
    channels and goroutines very well since it is my first time. Overall, summing the numbers
    is extremely fast. By design, the result should be the same no matter the amount of workers,
    which it was.



Errata
------

Describe any known errors, bugs, or deviations from the requirements.
