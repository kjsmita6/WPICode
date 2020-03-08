Kyle Smith (kjsmith@wpi.edu)
Nathan Walzer (nwalzer@wpi.edu)

In this project, we are implementing a virtual memory system using pages and page tables. Part 1 of the assignment is the main part,
where we implement 3 instructions: map, store, and load. Map creates a page in memory and the associated page table if neccessary, store stores a value in the page, and load will return the value in the page. The program takes 0 arguments but will act as a prompt once run: 

$ ./problem1
Instruction?

After instruction, it will take 4 arguments: the PID of the process, the instruction type (map, store, or load), the virtual address,
and the value. It will then run the specified instruction with the parameters and print out the result, whether a success message
or a failure message.

Part 1 of the assignment deals only with memory. It has 4 possible pages to allocate and once filled it will not longer be able to allocate more pages.

Part 2 of the assignment deals with memory and swapspace, or a simulated harddrive/cache. When the 4-page memory is filled the program will begin swapping pages into swapspace. Data within each page is retained when sent to and retrieved from swapspace in order to virtualize memory. The program evicts pages on a pseudo round-robin policy. There is a global pointer (0-3) that determines the next page to be evicted, however there are two exceptions to this rule. The first exception is that a page CANNOT evict its own page table, as said page table would then need to be dragged back into memory and cause a lot of unneccessary overhead. This also helps to avoid an infinite loop discovered in our code (as swap and evict are mutually recursive). The second rule is that a page table cannot evict one of its pages as this would again lead to an infinite loop and a lot of weird edge-case overhead. 

In each folder are our test case inputs and outputs, called input.txt and output.txt, respectively. They are the same inputs and outputs
as given in the project description.

FILE PIPING:
For the purposes of allowing file piping we have implemented a fourth instruction command "quit." When prompted for an instruction it is possible to have the input be X,quit,X,X where the X's follow the appropriate argument input as mentioned above. If a call to quit is NOT included then the program will segfault and no output to the file will be included. This is expected behavior and something we have chosen to leave in. The easiest way to call quit is to just do 0,quit,0,0
