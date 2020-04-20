package edu.wpi.cs.kjsmith;

import com.sun.tools.javac.util.Pair;

import java.util.ArrayList;
import java.util.Hashtable;


class Index {
	private Hashtable<String, String> table;
	private String[] array;
	private Dataset ds;
	Boolean initialized = false;

	Index(Dataset ds) {
		table = new Hashtable<>();
		array = new String[5000];
		this.ds = ds;
	}

	Boolean initialize() {
		if(!ds.initialized) {
			ds.initialize();
		}
		// for debugging only, uncomment bottom line for production
		Boolean hash = buildHashIndex();
		Boolean arr = buildArrayIndex();
		ds.clearFiles();

		initialized = true;
		return hash && arr;

		//return buildHashIndex() && buildArrayIndex();
	}

	private Boolean buildHashIndex() {
		String[] files = ds.files;
		int acc = 1;
		for(String file : files) {
			String[] records = ds.getRecords(file);
			int offset = 1;
			for (String record : records) {
				String randomV = ds.getRandomV(record, true);
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

	private Boolean buildArrayIndex() {
		String[] files = ds.files;
		int acc = 1;
		for(String file : files) {
			String[] records = ds.getRecords(file);
			int offset = 1;
			for (String record : records) {
				String randomV = ds.getRandomV(record, true);
				int randomV_num = Integer.parseInt(randomV) - 1;
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

	ArrayList<Pair<String, String>> getRecordLocator(String randomV, Boolean match) {
		ArrayList<Pair<String, String>> ret = new ArrayList<>();
		if(match) {
			if (table.containsKey(randomV)) {
				String locator = table.get(randomV);

				String[] locations = locator.split("\\_");
				for (String location : locations) {
					String[] l = location.split("\\:");
					ret.add(new Pair<>(l[0], l[1]));
				}
				return ret;
			}
		}
		else {
			String not = String.format("%04d", Integer.parseInt(randomV));
			for(int i = 1; i <= 5000; i++) {
				String test = String.format("%04d", i);
				if(test.equals(not)) {
					continue;
				}
				else {
					if(table.containsKey(test)) {
						String locator = table.get(test);
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
