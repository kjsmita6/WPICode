package edu.wpi.cs.kjsmith;

import javafx.util.Pair;

import java.util.ArrayList;
import java.util.Hashtable;

/**
 * DBMS util class, contains utilities to limit the amount of backend code in Program
 */
class Util {

	/**
	 * Generates a Hashtable indexed by randomV which contains a list of all records which have this randomV.
	 * Used in Section 2.
	 * @param ds The initialized Dataset
	 * @return A Hashtable with the values: RandomV, [File number, record number]
	 */
	static Hashtable<Integer, ArrayList<Pair<String, String>>> generateHashA(Dataset ds) {
		Hashtable<Integer, ArrayList<Pair<String, String>>> ret = new Hashtable<>();
		for(Integer file : ds.aRecords.keySet()) {
			Hashtable<Integer, Record> records = ds.aRecords.get(file);
			for(Integer r : records.keySet()) {
				Record rec = records.get(r);
				Integer randomV = Integer.parseInt(rec.randomV);
				if(ret.containsKey(randomV)) {
					ArrayList<Pair<String, String>> list = ret.get(randomV);
					list.add(new Pair<>(rec.file, rec.num));
					ret.replace(randomV, list);
				}
				else {
					Pair<String, String> firstPair = new Pair<>(rec.file, rec.num);
					ArrayList<Pair<String, String>> first = new ArrayList<>();
					first.add(firstPair);
					ret.put(randomV, first);
				}
			}
		}
		return ret;
	}

	/**
	 * Performs a nested-loop join over A and B and returns the count(*) function.
	 * Used in Section 3.
	 * @param ds The initialized dataset
	 * @return The count of the join
	 */
	static int loopJoin(Dataset ds) {
		int acc = 0;
		for(Integer file : ds.aRecords.keySet()) {
			Hashtable<Integer, Record> aRecords = ds.aRecords.get(file);
			for(Integer record : aRecords.keySet()) {
				Record aRec = aRecords.get(record);
				for(Integer file1 : ds.bRecords.keySet()) {
					Hashtable<Integer, Record> bRecords = ds.bRecords.get(file1);
					for(Integer record1 : bRecords.keySet()) {
						Record bRec = bRecords.get(record1);
						int aRandomV = Integer.parseInt(aRec.randomV);
						int bRandomV = Integer.parseInt(bRec.randomV);
						if(aRandomV > bRandomV) {
							acc++;
						}
					}
				}
			}
		}
		return acc;
	}

	/**
	 * Performs a hash-based index generation, used for aggregation later.
	 * Used in Section 4.
	 * @param ds The initialized dataset
	 * @param di The dataset to use
	 * @return A Hashtable with the form: Col2, [Record]
	 */
	static Hashtable<String, ArrayList<Record>> group(Dataset ds, DatasetIdent di) {
		Hashtable<String, ArrayList<Record>> table = new Hashtable<>();
		Hashtable<Integer, Hashtable<Integer, Record>> files = ds.getRecords(di);
		for(Integer f : files.keySet()) {
			Hashtable<Integer, Record> records = files.get(f);
			for(Integer r : records.keySet()) {
				Record record = records.get(r);
				ArrayList<Record> recs;
				if(table.containsKey(record.name)) {
					recs = table.get(record.name);
					recs.add(record);
					table.replace(record.name, recs);
				}
				else {
					recs = new ArrayList<Record>();
					recs.add(record);
					table.put(record.name, recs);
				}
			}
		}
		return table;
	}
}
