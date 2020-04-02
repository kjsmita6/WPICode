package edu.wpi.cs.kjsmith;

import java.util.Scanner;

public class Program {

	/**
	 * Program entry point
	 *
	 * @param args Array of command line arguments
	 */
	public static void main(String[] args) {
		BufferPool pool = new BufferPool(Integer.parseInt(args[0]));

		System.out.print("The program is ready for a command: > ");
		Scanner sc = new Scanner(System.in);
		while (sc.hasNextLine()) {
			String[] query = sc.nextLine().split(" ");
			if (query[0].equals("GET")) {

			} else if (query[0].equals("SET")) {

			} else if (query[0].equals("PIN")) {

			} else if (query[0].equals("UNPIN")) {

			} else {
				System.out.println("UNKNOWN COMMAND. PLEASE TRY AGAIN.");
			}
			System.out.print("The program is ready for the next command: > ");
		}
	}
}
