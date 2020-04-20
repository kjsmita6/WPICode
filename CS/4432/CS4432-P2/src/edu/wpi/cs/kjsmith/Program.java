package edu.wpi.cs.kjsmith;

import com.sun.tools.javac.util.Pair;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class Program {
	public static void main(String[] args) {
		Dataset ds = new Dataset();
		Index idx = new Index(ds);

		System.out.print("The program is ready for a command: > ");
		Scanner sc = new Scanner(System.in);

		while (sc.hasNextLine()) {
			String line = sc.nextLine();
			String[] query = line.split(" ");
			if (line.trim().equals("CREATE INDEX ON RandomV")) {
				if (idx.initialize()) {
					System.out.println("The hash-based and array-based indexes are build.");
				}
			}
			else if (line.contains("SELECT * FROM Project2Dataset WHERE RandomV")) {
				if (query[6].equals("=")) {
					String v = query[7];

					String indexType = "None";
					if(idx.initialized) {
						indexType = "Hash-Based";
					}
					int cnt = 0;
					StringBuilder toPrint = new StringBuilder();

					long start = System.currentTimeMillis();
					if(idx.initialized) {
						ArrayList<Pair<String, String>> records = idx.getRecordLocator(v, true);
						if(records != null) {
							for (Pair<String, String> locator : records) {
								toPrint.append(ds.getRecord(locator.fst, locator.snd)).append("\n");
							}
							cnt = records.size();
						}
					}
					else {
						Pair<ArrayList<String>, Integer> results = ds.scanForRecords(v, true);
						if(results.fst != null) {
							for (String record : results.fst) {
								toPrint.append(record).append("\n");
							}
						}
						cnt = results.snd;
					}
					long stop = System.currentTimeMillis();

					System.out.println(toPrint.toString().trim());
					System.out.println("\nIndex used: " + indexType);
					System.out.println("Time taken: " + (stop - start) + " ms");
					System.out.println("Blocks read: " + cnt + "\n");
				}
				else if (query[6].equals(">") && query[8].equals("AND") && query[10].equals("<")) {
					int v1 = Integer.parseInt(query[7]); // RandomV > v1
					int v2 = Integer.parseInt(query[11]); // RandomV < v2

					StringBuilder toPrint = new StringBuilder();
					int cnt = 0;
					String indexType = "None";

					long start = System.currentTimeMillis();
					for(int i = 1; i < 100; i++) {
						Scanner sc1 = null;
						try {
							sc1 = new Scanner(new File(ds.DATA_PATH + "/F" + String.format("%d", i) + ".txt"));
						} catch (FileNotFoundException e) {
							e.printStackTrace();
						}
						String f = "";
						while(sc1.hasNextLine()) {
							f += sc1.nextLine();
						}

						String[] records = ds.getRecords(f);
						for(String record : records) {
							int randomV = Integer.parseInt(ds.getRandomV(record, true));
							if(randomV > v1 || randomV < v2) {
								toPrint.append(record).append("\n");
							}
						}
						cnt++;
					}
					long stop = System.currentTimeMillis();

					System.out.println(toPrint.toString().trim());
					System.out.println("\nIndex used: " + indexType);
					System.out.println("Time taken: " + (stop - start) + " ms");
					System.out.println("Blocks read: " + cnt + "\n");
				}
				else if (query[6].equals("!=")) {
					int v = Integer.parseInt(query[7]);

					String indexType = "None";
					//if(idx.initialized) {
					//	indexType = "Hash-Based";
					//}
					int cnt = 0;
					StringBuilder toPrint = new StringBuilder();

					long start = System.currentTimeMillis();

					// Index is slower than without
					/*if(idx.initialized) {
						ArrayList<Pair<String, String>> records = idx.getRecordLocator(query[7], false);
						if (records != null) {
							for(int i = 1; i < 100; i++) {
								String[] recordsInFile = ds.getRecords(String.format("%d", i));
								for (Pair<String, String> locator : records) {
									if (Integer.parseInt(locator.fst) == i) {
										toPrint.append(ds.getRecord(locator.fst, locator.snd)).append("\n");
										cnt++;
									}
								}
							}
						}
					}
					else {*/
						String not = String.format("%04d", v);
						Pair<ArrayList<String>, Integer> results = ds.scanForRecords(not, false );
						if (results.fst != null) {
							for (String record : results.fst) {
								toPrint.append(record).append("\n");
							}
						}
						cnt = results.snd;
					//}
					long stop = System.currentTimeMillis();

					System.out.println(toPrint.toString().trim());
					System.out.println("\nIndex used: " + indexType);
					System.out.println("Time taken: " + (stop - start) + " ms");
					System.out.println("Blocks read: " + cnt + "\n");

				}
			}
			else {
				System.out.println("UNKNOWN COMMAND. Please try again.");
			}
			System.out.print("The program is ready for the next command: > ");
		}
	}
}
