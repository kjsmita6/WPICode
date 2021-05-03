CS4513: Project 3 The MapReduce Library
=======================================

Note, this document includes a number of design questions that can help your implementation. We highly recommend that you answer each design question **before** attempting the corresponding implementation.
These questions will help you design and plan your implementation and guide you towards the resources you need.
Finally, if you are unsure how to start the project, we recommend you visit office hours for some guidance on these questions before attempting to implement this project.


Team members
-----------------

1. Kyle Smith (kjsmith@wpi.edu)

Design Questions
------------------

(2 point) 1. If there are n input files, and nReduce number of reduce tasks , how does the the MapReduce Library uniquely name the intermediate files?

f0-0, ... f0-[nReduce-1]
f1-0, ... f1-[nReduce-1]
...
f[n-1]-0 ... f[n-1][nReduce-1]


(1 point) 2. Following the previous question, for the reduce task r, what are the names of files will it work on?

f0-r,
f1-r,
...
f[n-1]-r


(1 point) 3. If the submitted mapreduce job name is "test", what will be the final output file's name?

mrtmp.test


(2 point) 4. Based on `mapreduce/test_test.go`, when you run the `TestBasic()` function, how many master and workers will be started? And what are their respective addresses and their naming schemes?


1 master, 2 workers.
Addresses should look similar to:

/var/tmp/824-UID/mrPID-master
/var/tmp/824-UID/mrPID-worker0
/var/tmp/824-UID/mrPID-worker1

UID and PID can be any integers.


(4 point) 5. In real-world deployments, when giving a mapreduce job, we often start master and workers on different machines (physical or virtual). Describe briefly the protocol that allows master and workers be aware of each other's existence, and subsequently start working together on completing the mapreduce job. Your description should be grounded on the RPC communications.


(Most students probably will be able to answer this question correctly---as the process is summarized in the project description. The purpose of this question is to get students to read and understand the protocol.)

Just give submission full points for this question.

- The machines would use TCP to communicate between eachother. This allows a master to start workers on multiple machines, and TCP also maintains a "handshake" so the worker and the master know about eachother.


(2 point) 6. The current design and implementation uses a number of RPC methods. Can you find out all the RPCs and list their signatures? Briefly describe the criteria
a method needs to satisfy to be considered a RPC method. (Hint: you can look up at: https://golang.org/pkg/net/rpc/)

- Each RPC method needs to look similar to this:
    func (t *T) MethodName(argType T1, replyType *T2) error

- Two functions that are RPCs are Worker.DoTask and Worker.Shutdown.



7. We provide a bash script called `main/test-wc-distributed.sh` that allows testing the distributed MapReduce implementation.

Is this a question? Or just a statement.


Errata
------

Describe any known errors, bugs, or deviations from the requirements.

- For my checkpoint, the grader said that go couldn't find the mr/mapreduce package and said to make sure that all my tests pass. Before submitting the checkpoint, I ran and passed all the tests, so there was no problem running the code on my computer. I did it exactly as it said in the project document.

---
