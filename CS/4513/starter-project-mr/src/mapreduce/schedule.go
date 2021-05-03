package mapreduce

import (
    "sync"
)

// schedule starts and waits for all tasks in the given phase (Map or Reduce).
func (mr *Master) schedule(phase jobPhase) {
	var ntasks int
	var nios int // number of inputs (for reduce) or outputs (for map)
	switch phase {
	case mapPhase:
		ntasks = len(mr.files)
		nios = mr.nReduce
	case reducePhase:
		ntasks = mr.nReduce
		nios = len(mr.files)
	}

	debug("Schedule: %v %v tasks (%d I/Os)\n", ntasks, phase, nios)

	// All ntasks tasks have to be scheduled on workers, and only once all of
	// them have been completed successfully should the function return.
	// Remember that workers may fail, and that any given worker may finish
	// multiple tasks.
	//
	// TODO:
    var wg sync.WaitGroup
    for i := 0; i < ntasks; i++ {
        wg.Add(1)
        go func(file int) {
            defer wg.Done()
            args := DoTaskArgs{mr.jobName, mr.files[file], phase, file, nios}
            var name string
            finished := false
            for finished != true {
                name = <- mr.registerChannel
                finished = call(name, "Worker.DoTask", args, nil)
            }
            // Discussions on Canvas: "worker must reregister itself with master". Not
            // really sure why it does, but I remove this function then the program
            // never finishes.
            go func() {
                mr.registerChannel <- name
            }()
        }(i)
    }

    wg.Wait()

	debug("Schedule: %v phase done\n", phase)
}
