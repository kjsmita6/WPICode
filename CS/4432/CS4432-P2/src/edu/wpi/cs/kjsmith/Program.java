package edu.wpi.cs.kjsmith;

import com.sun.tools.javac.util.Pair;

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
						ArrayList<Pair<String, String>> records = idx.getRecordLocator(v);
						if(records != null) {
							for (Pair<String, String> locator : records) {
								toPrint.append(ds.getRecord(locator.fst, locator.snd)).append("\n");
							}
							cnt = records.size();
						}
					}
					else {
						Pair<ArrayList<String>, Integer> results = ds.scanForRecords(v);
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
					int v1 = Integer.parseInt(query[7]);
					int v2 = Integer.parseInt(query[11]);
				}
				else if (query[6].equals("!=")) {
					int v = Integer.parseInt(query[7]);

					String indexType = "None";
					if(idx.initialized) {
						indexType = "Hash-Based";
					}
					int cnt = 0;
					StringBuilder toPrint = new StringBuilder();

					long start = System.currentTimeMillis();
					if(idx.initialized) {
						for(int i = 1; i < 5000; i++) {
							String not = String.format("%04d", i);
							if(!not.equals(v)) {
								ArrayList<Pair<String, String>> records = idx.getRecordLocator(not);
								if(records != null) {
									for (Pair<String, String> locator : records) {
										toPrint.append(ds.getRecord(locator.fst, locator.snd)).append("\n");
									}
									cnt += records.size();
								}
							}
						}
					}
					else {
						for(int i = 1; i < 5000; i++) {
							String not = String.format("%04d", i);
							Pair<ArrayList<String>, Integer> results = ds.scanForRecords(not);
							if (results.fst != null) {
								for (String record : results.fst) {
									toPrint.append(record).append("\n");
								}
							}
							cnt += results.fst.size();
						}
					}
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
