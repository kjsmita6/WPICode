// Kyle Smith (kjsmith@wpi.edu)
// Akshaj Balasubramanian (abalasubramanian@wpi.edu)
#include "cachelab.h"
#include <stdio.h> 	// printf
#include <unistd.h> // getopt
#include <getopt.h> // getopt
#include <stdlib.h> // getopt
#include <math.h> 	// pow

typedef struct {
	int last_used; // keep track of when it was used, needed to evict
	char isValid; //uint8_t?
	int tag; // uint64_t?
	// would include data but for the purposes of this lab we don't care about the contents
	// we only care whether it is in the cache, not what it is
} cacheline_t;

typedef struct {
	cacheline_t *lines;
} cacheset_t;

typedef struct {
	cacheset_t *sets;
} cache_t;

typedef struct {
	int s; // pow(2,s) sets
	int E; // E lines per set
	int b; // pow(2,b) bytes per block

	int hits;
	int misses;
	int evictions;
} cachestats_t;

/**
 * @author Akshaj Balasubramanian (abalasubramanian@wpi.edu)
 * Initializes an empty cache using the specified parameters
 * @param sets Number of sets in the cache
 * @param lines Number of lines in the cache
 * @return A newly initialized cache
 */
cache_t create_cache(int sets, int lines) {
	cache_t cache;
	cacheset_t temp_set;
	cacheline_t temp_line;
	cache.sets = (cacheset_t *)calloc(sets, sizeof(cacheset_t));
	for(int i = 0; i < sets; i++) {
		temp_set.lines = (cacheline_t *)calloc(lines, sizeof(cacheline_t));
		cache.sets[i] = temp_set;
		for(int j = 0; j < lines; j++) {
			temp_line.isValid = 0;
			temp_line.tag = 0;
			temp_set.lines[j] = temp_line;
		}
	}
	return cache;
}

/**
 * @author Kyle Smith (kjsmith@wpi.edu)
 * Frees all memory occupied by the cache
 * @param cache Pointer to the cache to delete
 * @param sets Number of sets
 */
void delete_cache(cache_t *cache, int sets) {
	for(int i = 0; i < sets; i++) {
		cacheset_t current_set = cache->sets[i];
		if(current_set.lines) {
			free(current_set.lines);
		}
	}
	if(cache->sets) {
		free(cache->sets);
	}
}

/**
 * @author Kyle Smith (kjsmith@wpi.edu)
 * Finds the first empty line in the given set
 * @param set The set to search
 * @param num_lines Number of lines per set
 * @return Index of first empty line, or -1 if no lines are empty
 */
int find_empty(cacheset_t set, int num_lines) {
	for(int i = 0; i < num_lines; i++) {
		if(!set.lines[i].isValid) { // find first empty line and return its index
			return i;
		}
	}
	return -1; // only gets here if all lines are being used i.e. set is full
}

/**
 * @author Akshaj Balasubramanian (abalasubramanian@wpi.edu)
 * Determines what line to evict by searching for the line in the set that was used most recently
 * @param set the Set being searched
 * @param num_lines Number of lines in the set
 * @return Index of the oldest line
 */
int find_oldest(cacheset_t set, int num_lines) {
	int oldest = set.lines[0].last_used;
	int idxOldest = 0;
	for(int i = 1; i < num_lines; i++) {
		if(set.lines[i].last_used > oldest) {
			oldest = set.lines[i].last_used;
			idxOldest = i;
		}
	}
	return idxOldest;
}

/**
 * @author Akshaj Balasubramanian (abalasubramanian@wpi.edu)
 * Updates every line to 1 more age except not
 * @param set The set to update
 * @param num_lines Number of lines in the set
 * @param not The index not to update (but to set to 0)
 */
void update_lines(cacheset_t set, int num_lines, int not) {
	for(int i = 0; i < num_lines; i++) {
		set.lines[i].last_used++;
		if(i == not){
			set.lines[i].last_used = 0;
		}
	}
}

/**
 * @author Kyle Smith
 * @author Akshaj Balasubramanian
 * Runs 1 round of the simulation
 * @param cache The simulated cache
 * @param verbose 1 if program is in "verbose mode" (i.e. print after every inst) or 0 if not
 * @param inst Instruction to perform (one of 'L', 'S', 'I', or 'M')
 * @param addr Address of memory
 * @param size Size (in bytes) of the data
 * @param stats Current cachestats_t object
 * @param second If its the first time the function has been run (to make printing correct if Verbose=true)
 * @return A newly updated cachestats_t object, containing an updated number of hits, misses, and evictions
 */
cachestats_t run(cache_t *cache, int verbose, char inst, unsigned long int addr, int size, cachestats_t stats, int second) {
	int tag_size = 64 - (stats.s + stats.b); // tag size = m - (s + b) per cache definition
	int full = 1; // assume cache is full in the beginning, will check later
	int tag = addr >> (stats.s + stats.b); // tag = addr >> set offset per cache definition
	int set_number = (addr << tag_size) >> (tag_size + stats.b); // get index of current set
	cacheset_t current_set = cache->sets[set_number];

	if(verbose && (!second || inst != 'M')) {
		printf("%c %lx,%d", inst, addr, size);
	}
	int temp_hits = stats.hits;
	for(int i = 0; i < stats.E; i++) {
		cacheline_t current_line = current_set.lines[i];
		if(current_line.isValid) {
			if(current_line.tag == tag) { // data is in the cache, HIT
				stats.hits++;
				current_set.lines[i] = current_line; // update cache with new values for last_used and hits
				update_lines(current_set, stats.E, i);
				if(verbose) {
					printf(" hit");
				}
			}
		}
		else { // line is empty, cache is not full
			full = 0;
		}
	}

	if(temp_hits == stats.hits) { // number of hits stayed the same, above loop must have had a MISS
		stats.misses++;
		if(verbose) {
			printf(" miss");
		}
	}
	else {
		if(verbose && second) {
			printf("\n");
		}
		return stats; // otherwise data is in the cache, return updated cachestats_t object
	}

	int last_used_index = find_oldest(current_set, stats.E);
	if(full) { // If ever get to this point, cache is full so must EVICT
		stats.evictions++;
		current_set.lines[last_used_index].tag = tag;
		update_lines(current_set, stats.E, last_used_index);
		if(verbose) {
			printf(" eviction");
		}
	}
	else { // or data is not there and cache is not full, so cache is empty
		int empty_index = find_empty(current_set, stats.E); // find first empty line
		current_set.lines[empty_index].tag = tag;
		current_set.lines[empty_index].isValid = 1;
		update_lines(current_set, stats.E, last_used_index);
	}
	if(verbose && second) {
		printf("\n");
	}
	return stats;
}

/**
 * @author Akshaj Balasubramanian (abalasubramanian@wpi.edu)
 * Prints the usage of the program to stdout
 */
void printUsage() {
	printf("Usage: ./csim [-hv] -s <num> -E <num> -b <num> -t <file>\n");
	printf("\tOptions:\n");
 	printf("\t\t-h\t\tPrint this help message.\n");
  	printf("\t\t-v\t\tOptional verbose flag.\n");
  	printf("\t\t-s <num>\t\tNumber of set index bits.\n");
  	printf("\t\t-E <num>\t\tNumber of lines per set.\n");
  	printf("\t\t-b <num>\t\tNumber of block offset bits.\n");
  	printf("\t\t-t <file>\t\tTrace file. \n\n");
	printf("\tExamples:\n");
  	printf("\t\tlinux>  ./csim -s 4 -E 1 -b 4 -t traces/yi.trace\n");
  	printf("\t\tlinux>  ./csim -v -s 8 -E 2 -b 4 -t traces/yi.trace\n");

}

/**
 * @author Kyle Smith (kjsmith@wpi.edu)
 * Program entry function
 * @param argc Number of command line arguments
 * @param argv Array of command line arguments
 * @return 0 if no errors, 1 otherwise
 */
int main(int argc, char **argv) {
	int h = 0;
	int verbose = 0;
	char *t = NULL;

	cachestats_t stats = { 0, 0, 0, 0, 0, 0 }; // create struct cachestats_t with default values 0
	int opt = 0;
	if(argc == 1) {
		printUsage();
		return 1;
	}
	while((opt = getopt(argc, argv, "hvs:E:b:t:")) != -1) {
		switch(opt) {
			case 'h':
				h = 1;
				printUsage();
				break;
			case 'v':
				verbose = 1;
				break;
			case 's':
				stats.s = atoi(optarg);
				break;
			case 'E':
				stats.E = atoi(optarg);
				break;
			case 'b':
				stats.b = atoi(optarg);
				break;
			case 't':
				t = optarg;
				break;
			case '?': { // i don't think this code ever gets reached but here just in case ¯\_(ツ)_/¯
					if(optopt == 's' || optopt == 'E' || optopt == 'b' || optopt == 't') {
						printf("Option -%c requires an argument.\n", optopt);
						if(!h) {
							printUsage();
							return 1;
						}
					}
					else {
						printf("Unknown option -%c\n", optopt);
						if(!h) {
							printUsage();
							return 1;
						}
					}
				}
				break;
			default:
				printUsage();
				return 1;
		}
	}
	if(stats.s == 0 || stats.E == 0 || stats.b == 0 || t == NULL) {
		printUsage();
		return 1;
	}
	cache_t cache = create_cache(pow(2, stats.s), stats.E);

	FILE *trace = fopen(t, "r");
	char command;
	unsigned long int addr;
	int size;
	if(trace) {
		while(fscanf(trace, " %c %lx,%d", &command, &addr, &size) == 3) { // fscanf returns # of conversion, check if 3 params
			switch(command) { // each run(...) call returns a newly updated stats object per function definition
				case 'I': // in case you saw the above comment, I also don't think this will ever be reached because of the space in the formatting
						  // I never has space in front of it per docs, and format does ¯\_(ツ)_/¯ again here just in case
					break; // ignore I per docs
				case 'M': // Data modify = Data load followed by data store per docs
					stats = run(&cache, verbose, command, addr, size, stats, 0);
					stats = run(&cache, verbose, command, addr, size, stats, 1);
					break;
				case 'L':
					stats = run(&cache, verbose, command, addr, size, stats, 1);
					break;
				case 'S':
					stats = run(&cache, verbose, command, addr, size, stats, 1);
					break;
			}
		}
	}
	printSummary(stats.hits, stats.misses, stats.evictions);
    // Clean up memory at the end
	fclose(trace);
	delete_cache(&cache, pow(2, stats.s));
	return 0;
}
