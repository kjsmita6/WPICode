package edu.wpi.cs.kjsmith;


import javafx.util.Pair;

import java.util.ArrayList;
import java.util.Hashtable;

/**
 * A class representing both indexes: hashtable-based and array-based
 */
class Index {
	// Format for records: file1:record1_file2:record2_file3:record3 etc
	private Hashtable<String, String> table;
	private String[] array;
	private Dataset ds;
	Boolean initialized = false; // whether the indexes were build yet or not

	/**
	 * Constructor with dataset containing all the files to build the index on
	 * @param ds Blank or initialized dataset form which to build the index
	 */
	Index(Dataset ds) {
		table = new Hashtable<>();
		array = new String[5000];
		this.ds = ds;
	}

	/**
	 * Creates both indexes from the dataset passed through the constructor
	 * @return True if both indexes were build, false otherwise
	 */
	Boolean initialize() {
		if(!ds.initialized) {
			ds.initialize(); // if the data files have not been read yet, must read them
		}
		Boolean hash = buildHashIndex();
		Boolean arr = buildArrayIndex();
		ds.clearFiles();

		initialized = true;
		return hash && arr;

		// would do this line for efficiency but need to set initialized to true
		//return buildHashIndex() && buildArrayIndex();
	}

	/**
	 * Creates the hash-based index using the dataset
	 * @return True if the index was build successfully, false otherwise
	 */
	private Boolean buildHashIndex() {
		String[] files = ds.files;
		int acc = 1;
		for(String file : files) {
			String[] records = ds.getRecords(file); // gets all record contents for the specifid file
			int offset = 1;
			for (String record : records) {
				String randomV = ds.getRandomV(record, true);
				// format the record locator in the hash table
				if (table.containsKey(randomV)) {
					table.replace(randomV, table.get(randomV) + "_" + acc + ":" + offset);
				}
				else {
					table.put(randomV, acc + ":" + offset);
				}
				offset++;
			}
			acc++;
		}
		return true;
	}

	/**
	 * Creates the array-based index using the dataset
	 * @return True if the index was build successfully, false otherwise
	 */
	private Boolean buildArrayIndex() {
		String[] files = ds.files;
		int acc = 1;
		for(String file : files) {
			String[] records = ds.getRecords(file);
			int offset = 1;
			for (String record : records) {
				String randomV = ds.getRandomV(record, true);
				int randomV_num = Integer.parseInt(randomV) - 1; // records start from one
				// format the record in the array
				if (array[randomV_num] != null) {
					array[randomV_num] += "_" + acc + ":" + offset;
				} else {
					array[randomV_num] = acc + ":" + offset;
				}
				offset++;
			}
			acc++;
		}
		return true;
	}

	/**
	 * Returns a record locator (in the form file1:record1_file2:record2_file3:record3 etc)
	 * @param randomV The randomV to search the index for
	 * @param match Whether to match the randomV or not
	 * @param type Whether to use hash-based or array-based
	 * @return A list of record locator pairs, the first element is the file and the second element is the record number
	 */
	ArrayList<Pair<String, String>> getRecordLocator(String randomV, Boolean match, IndexType type) {
		ArrayList<Pair<String, String>> ret = new ArrayList<>();
		if(match) {
			String locator = null;
			if (type == IndexType.Hash) {
				if (table.containsKey(randomV)) {
					locator = table.get(randomV);
				}
			}
			else {
				locator = array[Integer.parseInt(randomV) - 1];
			}
			if(locator != null) {
				String[] locations = locator.split("\\_"); // need to escape the _ and : in case they are special characters in regex
				for (String location : locations) {
					String[] l = location.split("\\:");
					ret.add(new Pair<>(l[0], l[1])); // for each file, separate the record from the file and create the pair to be returned
				}
				return ret;
			}
		}
		else { // this code is almost identical to the top portion except that we need to check if the randomV we are on IS NOT the same as randomV parameter
			String not = String.format("%04d", Integer.parseInt(randomV)); // format the number for 0s in front (e.g. 0003 instead of 3, 0503 instead of 503)
			for(int i = 1; i <= 5000; i++) {
				String test = String.format("%04d", i);
				if(test.equals(not)) { // skip the one we aren't looking for
					continue;
				}
				else {
					String locator = null;
					if(type == IndexType.Hash) {
						if (table.containsKey(test)) {
							locator = table.get(test);
						}
					}
					else {
						locator = array[i - 1];
					}
					if(locator != null) {
						String[] locations = locator.split("\\_");
						for (String location : locations) {
							String[] l = location.split("\\:");
							ret.add(new Pair<>(l[0], l[1]));
						}
					}
				}
			}
			return ret;
		}
		return null;
	}
}
