package edu.wpi.cs.kjsmith;

import javafx.util.Pair;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Objects;
import java.util.Scanner;

/**
 * A class for representing the available dataset.
 */
class Dataset {
	/**
	 * Current working directory, used to find paths for A and B dataset.
	 */
	private final String USER_DIR = System.getProperty("user.dir");
	/**
	 * The location for Dataset A (relative to USER_DIR)
	 */
	private final String DATA_A = USER_DIR + "/Project3Dataset-A";
	/**
	 * The location for Dataset B (relative to USER_DIR)
	 */
	private final String DATA_B = USER_DIR + "/Project3Dataset-B";

	// Contains the CONTENTS of each file
	private String[] aFiles;
	private String[] bFiles;

	// <filenum, <recordnum, [Record]>>
	Hashtable<Integer, Hashtable<Integer, Record>> aRecords;
	Hashtable<Integer, Hashtable<Integer, Record>> bRecords;

	/**
	 * Default constructor, initializes all arrays and Hashtables to empty
	 */
	Dataset() {
		aFiles = new String[99];
		bFiles = new String[99];
		aRecords = new Hashtable<>();
		bRecords = new Hashtable<>();
	}

	/**
	 * Reads all data from files, adds their content to aFiles and bFiles, and creates Record objects for each Record
	 * @return True if initialization was successful, false otherwise
	 */
	Boolean initialize() {
		return initializePath(DATA_A, aFiles) && initializePath(DATA_B, bFiles) &&
			initializeRecords(aFiles, DatasetIdent.A) && initializeRecords(bFiles, DatasetIdent.B);
	}

	/**
	 * Reads the contents of each file in the datapath and adds it to the global file array
	 * @param datapath Which datapath to read from, either PATH_A or PATH_B
	 * @param files Which file array to add it to, either aFiles or bFiles
	 * @return True if arrays were initialized successfully, false otherwise
	 */
	private Boolean initializePath(String datapath, String[] files) {
		Scanner sc = null;
		int acc = 0;
		for(File f : Objects.requireNonNull(new File(datapath).listFiles())) {
			try {
				sc = new Scanner(f);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				return false;
			}
			StringBuilder contents = new StringBuilder();
			while(sc.hasNextLine()) {
				contents.append(sc.nextLine());
			}
			files[acc] = contents.toString();
			acc++;
		}
		return true;
	}

	/**
	 * Parses each record string and creates Record objects from the fields
	 * @param files Which files to read, either aFiles or bFiles
	 * @param di DatasetIdent to identify which dataset to use, either DatasetIdent.A or DatasetIdent.B
	 * @return True if the records were initialized successfully, false otherwise
	 */
	private Boolean initializeRecords(String[] files, DatasetIdent di) {
		int acc = 0;
		for(String f : files) {
			String fileNum = String.format("%d", Integer.parseInt(f.substring(1, 3)));
			for (String r : f.split("\\.\\.\\.")) {
				String recordNum = String.format("%d", Integer.parseInt(r.substring(r.indexOf("Rec") + 3, 10)));
				String randomV = getRandomV(r, false);

				String[] fields = r.split(",");
				String name = fields[1];
				String address = fields[2];
				Record rec = new Record(fileNum, recordNum, name, address, randomV);
				int key = Integer.parseInt(fileNum);
				if(di == DatasetIdent.A) {
					if(aRecords.containsKey(key)) {
						Hashtable<Integer, Record> records = aRecords.get(key);
						records.put(Integer.parseInt(recordNum), rec);
						aRecords.replace(key, records);
					}
					else {
						Hashtable<Integer, Record> records = new Hashtable<>();
						records.put(Integer.parseInt(recordNum), rec);
						aRecords.put(key, records);
					}
				}
				else {
					if(bRecords.containsKey(key)) {
						Hashtable<Integer, Record> records = bRecords.get(key);
						records.put(Integer.parseInt(recordNum), rec);
						bRecords.replace(key, records);
					}
					else {
						Hashtable<Integer, Record> records = new Hashtable<>();
						records.put(Integer.parseInt(recordNum), rec);
						bRecords.put(key, records);
					}
				}
				acc++;
			}
		}
		return true;
	}

	/**
	 * Gets a specific record from the specific dataset
	 * @param file The file where the record is located
	 * @param record The record number to retrieve
	 * @param di The dataset to use, either DatasetIdent.A or DatasetIdent.B
	 * @return The specific Record object if it is found, otherwise null
	 */
	Record getRecord(String file, String record, DatasetIdent di) {
		if(di == DatasetIdent.A) {
			return aRecords.get(Integer.parseInt(file)).get(Integer.parseInt(record));
		}
		else {
			return bRecords.get(Integer.parseInt(file)).get(Integer.parseInt(record));
		}
	}

	/**
	 * Returns the Records array of the specific dataset.
	 * This method only exists to make coding easier and more readable in Program.main
	 * @param di The dataset to return, either DatasetIdent.A or DatasetIdent.B
	 * @return All the Records in dataset A or B
	 */
	Hashtable<Integer, Hashtable<Integer, Record>> getRecords(DatasetIdent di) {
		return (di == DatasetIdent.A ? aRecords : bRecords);
	}

	/**
	 * Extracts a randomV field from a record string
	 * @param record The record string to parse
	 * @param dots Whether the three dots (..., ellipsis) are at the end of the record or not
	 * @return The 4-digit randomV field of the record
	 */
	private String getRandomV(String record, Boolean dots) {
		if (dots) {
			return record.substring(record.indexOf("...") - 4, record.indexOf("...")); // if the file has dots, need to ignore them
		} else {
			return record.substring(record.length() - 4); // otherwise can just get the last 4 characters in the record
		}
	}
}
