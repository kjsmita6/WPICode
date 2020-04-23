package edu.wpi.cs.kjsmith;

import javafx.util.Pair;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Objects;
import java.util.Scanner;

/**
 * Class which represents all available files in the dataset
 */
class Dataset {
	String[] files;
	Boolean initialized = false;

	/**
	 * Constructor, initializes the files array
	 */
	Dataset() {
		files = new String[99];
	}

	final String DATA_PATH = System.getProperty("user.dir") + "/Project2Dataset/";

	/**
	 * Clears the files array from memory
	 */
	void clearFiles() {
		files = null;
	}

	/**
	 * Reads in all file contents to the Files array
	 * @return True if read is successful, false otherwise
	 */
	Boolean initialize() {
		Scanner sc = null;
		int acc = 0;
		for (File f : Objects.requireNonNull(new File(DATA_PATH).listFiles())) {
			String fileName = f.getName().substring(1, f.getName().indexOf(".txt"));
			int fileName_num = Integer.parseInt(fileName);
			try {
				sc = new Scanner(f);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				return false;
			}
			StringBuilder contents = new StringBuilder();
			while (sc.hasNextLine()) {
				contents.append(sc.nextLine());
			}
			files[fileName_num - 1] = contents.toString(); // read every file and add its content to the files array
			// files start at 1 so need to subtract for array idx
		}
		initialized = true;
		return true;
	}

	/**
	 * Performs a table scan for a randomV in each file
	 * @param randomV The variable to search for
	 * @param match True to find matches, false to find all which don't match
	 * @return A pair: a list of records, and a count of how many files were scanned
	 */
	Pair<ArrayList<String>, Integer> scanForRecords(String randomV, Boolean match) {
		int cnt = 0;
		ArrayList<String> records = new ArrayList<>();
		Pair<ArrayList<String>, Integer> ret = null;
		Scanner sc = null;

		for (File f : Objects.requireNonNull(new File(DATA_PATH).listFiles())) {
			String fileName = f.getName().substring(1, f.getName().indexOf(".txt"));
			int fileName_num = Integer.parseInt(fileName);
			try {
				sc = new Scanner(f);
			}
			catch (FileNotFoundException e) {
				e.printStackTrace();
				return null;
			}
			StringBuilder contents = new StringBuilder();
			while (sc.hasNextLine()) {
				contents.append(sc.nextLine());
			}

			for(String record : contents.toString().split("\\.\\.\\.")) { // each record can be separated by the three dots, again escape for regex purposes
				if(!match) {
					if (!getRandomV(record, false).equals(randomV)) {
						records.add(record);
					}
				}
				else {
					if (getRandomV(record, false).equals(randomV)) {
						records.add(record);
					}
				}
			}
			cnt++;
		}
		ret = new Pair<>(records, cnt);
		return ret;
	}

	/**
	 * Gets a specified record from a specified file
	 * @param file The file number to read
	 * @param record The record number to get
	 * @return The 40-byte record, or null if cannot read from the file
	 */
	String getRecord(String file, String record) {
		int fileIdx = Integer.parseInt(file) - 1;
		int recordInt = Integer.parseInt(record);
		int recordStart = 40 * (recordInt - 1);


		//String f = files[fileIdx];
		Scanner sc = null;
		try {
			sc = new Scanner(new File(DATA_PATH + "/F" + file + ".txt"));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return null;
		}
		String f = "";
		while(sc.hasNextLine()) {
			f += sc.nextLine();
		}

		String recordStr = f.substring(recordStart, Math.min(recordStart + 40, f.length())); // since each record is 40 characters, can just use substring to get the record
		// using this trick to emulate C#'s String.substring(start, length) instead of Java's String.substring(start, end)
		return recordStr;
	}

	/**
	 * Gets all the records from a specified file
	 * @param file The file contents to search
	 * @return An array of all records in that file
	 */
	String[] getRecords(String file) {
		String[] ret = new String[100];
		int index = 0;
		int start = 0;
		for (int i = 40; i < file.length() + 40; i += 40) {
			ret[index] = file.substring(start, i); // could prob do String.split("...") to get each record, but didn't do it here for some reason
			// should have the same effect
			start += 40;
			index++;
		}
		return ret;
	}

	/**
	 * Separates the randomV from the record
	 * @param record The 40-byte record to read
	 * @param dots Whether or not there are 3 dots at the end of the record (...)
	 * @return The 40-byte record
	 */
	String getRandomV(String record, Boolean dots) {
		if (dots) {
			return record.substring(record.indexOf("...") - 4, record.indexOf("...")); // if the file has dots, need to ignore them
		}
		else {
			return record.substring(record.length() - 4); // otherwise can just get the last 4 characters in the record
		}
	}
}
