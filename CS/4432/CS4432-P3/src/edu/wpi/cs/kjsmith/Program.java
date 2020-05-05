package edu.wpi.cs.kjsmith;

import javafx.util.Pair;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Scanner;

/**
 * Main program class, contains main().
 */
public class Program {

	/**
	 * Program entry function.
	 * @param args Command line arguments, unused in this program.
	 */
	public static void main(String[] args) {
		Dataset ds = new Dataset();

		if(!ds.initialize()) {
			System.out.println("Error initializing data. The program will now exit.");
			return;
		}

		System.out.print("The program is ready for a command: > ");
		Scanner sc = new Scanner(System.in);

		while (sc.hasNextLine()) {
			String line = sc.nextLine();
			String[] query = line.split(" ");
			if (line.trim().equals("SELECT A.Col1, A.Col2, B.Col1, B.Col2 FROM A, B WHERE A.RandomV = B.RandomV")) {
				long start = System.currentTimeMillis();
				Hashtable<Integer, ArrayList<Pair<String, String>>> hashTable = Util.generateHashA(ds);
				StringBuilder sb = new StringBuilder();
				sb.append("A.Col1 |   A.Col2 | B.Col1 |   B.Col2\n").append("-------------------------------------\n");
				int acc = 0;
				for(Integer file : ds.bRecords.keySet()) {
					Hashtable<Integer, Record> records = ds.bRecords.get(file);
					for(Integer rec : records.keySet()) {
						Record r = records.get(rec);
						Integer randomV = Integer.parseInt(r.randomV);
						if(hashTable.containsKey(randomV)) {
							ArrayList<Pair<String, String>> a = hashTable.get(randomV);
							for(Pair<String, String> locator : a) {
								Record aRec = ds.getRecord(locator.getKey(), locator.getValue(), DatasetIdent.A);
								sb.append(String.format("%6d", Integer.parseInt(aRec.num))).append(" | ")
									.append(aRec.name).append(" | ")
									.append(String.format("%6d", Integer.parseInt(r.num))).append(" | ")
									.append(r.name).append("\n");
								acc++;
							}
						}
					}
				}
				long stop = System.currentTimeMillis();

				sb.append("\nReturned ").append(acc).append(" rows\nExecution time: ").append((stop - start)).append(" ms\n");
				System.out.println("\n\n" + sb.toString());
			}
			else if(line.trim().equals("SELECT count(*) FROM A, B WHERE A.RandomV > B.RandomV")) {
				long start = System.currentTimeMillis();
				int runs = Util.loopJoin(ds);
				long stop = System.currentTimeMillis();
				StringBuilder sb = new StringBuilder();
				sb.append("\n\ncount(*)\n").append("--------\n").append(runs).append("\n\n").append("Execution time: ").append((stop - start)).append(" ms");
				System.out.println(sb.toString());
			}
			else if(line.trim().matches("SELECT Col2, (SUM\\(RandomV\\)|AVG\\(RandomV\\)) FROM (A|B) GROUP BY Col2")) {
				long start = System.currentTimeMillis();
				DatasetIdent di = (query[4].equals("A") ? DatasetIdent.A : DatasetIdent.B);
				Hashtable<String, ArrayList<Record>> groups = Util.group(ds, di);
				StringBuilder sb = new StringBuilder();
				sb.append("    Col2").append(" | ").append(query[2]).append("\n").append("-----------------------").append("\n");
				for(String name : groups.keySet()) {
					int sum = 0;
					ArrayList<Record> group = groups.get(name);
					for(Record r : group) {
						sum += Integer.parseInt(r.randomV);
					}
					if(query[2].equals("SUM(RandomV)")) {
						sb.append(name).append(" | ").append(String.format("%12d", sum)).append("\n");
					}
					else {
						sb.append(name).append(" | ").append(String.format("%12d", (sum / group.size()))).append("\n");
					}
				}
				long stop = System.currentTimeMillis();
				System.out.println("\n\n" + sb.toString());
				System.out.println("Execution time: " + (stop - start) + " ms");
			}
			else {
				System.out.println("UNKNOWN COMMAND. Please try again.");
			}
			System.out.print("The program is ready for the next command: > ");
		}
	}
}
