package edu.wpi.cs.kjsmith;

import com.sun.tools.javac.util.Pair;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Objects;
import java.util.Scanner;

class Dataset {
	String[] files;
	Boolean initialized = false;

	Dataset() {
		files = new String[99];
	}

	final String DATA_PATH = System.getProperty("user.dir") + "/Project2Dataset/";

	void clearFiles() {
		files = null;
	}

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
			files[fileName_num - 1] = contents.toString();
		}
		initialized = true;
		return true;
	}

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
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				return null;
			}
			StringBuilder contents = new StringBuilder();
			while (sc.hasNextLine()) {
				contents.append(sc.nextLine());
			}

			for(String record : contents.toString().split("\\.\\.\\.")) {
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

		String recordStr = f.substring(recordStart, Math.min(recordStart + 40, f.length()));
		return recordStr;
	}

	String[] getRecords(String file) {
		String[] ret = new String[100];
		int index = 0;
		int start = 0;
		for (int i = 40; i < file.length() + 40; i += 40) {
			ret[index] = file.substring(start, i);
			start += 40;
			index++;
		}
		return ret;
	}

	String getRandomV(String record, Boolean dots) {
		if (dots) {
			return record.substring(record.indexOf("...") - 4, record.indexOf("..."));
		}
		else {
			return record.substring(record.length() - 4);
		}
	}
}
