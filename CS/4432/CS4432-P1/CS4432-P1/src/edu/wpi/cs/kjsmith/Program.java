package edu.wpi.cs.kjsmith;

import java.util.Scanner;

/**
 * Main class for the program, contains program entry point
 */
public class Program {

	/**
	 * Program entry point
	 * @param args Array of command line arguments
	 */
	public static void main(String[] args) {
		BufferPool pool = new BufferPool(Integer.parseInt(args[0]));

		System.out.print("The program is ready for a command: > ");
		Scanner sc = new Scanner(System.in);
		while (sc.hasNextLine()) {
			String line = sc.nextLine();
			String[] query = line.split(" ");
			if (query[0].equals("GET")) {
				int record = Integer.parseInt(query[1]);
				int file = (int)Math.ceil(record / 100.0);
				if(pool.frames.containsKey(file)) { // frame already in memory, case 1
					int frameID = pool.frames.get(file);
					String content = pool.buffers[frameID].getRecord(record);
					System.out.println(content + "; File " + file + " already in memory; Located in frame " + (frameID + 1));
				}
				else {
					if (pool.hasEmptyFrames()) { // there are empty frames, case 2
						pool.loadFrame(file);
						int frameID = pool.frames.get(file);
						String content = pool.buffers[frameID].getRecord(record);
						System.out.println(content + "; Brought file " + file + " from disk; Placed in frame " + (frameID + 1));
					}
					else { // no empty frames, check if frame can be taken out, case 3
						int evicted = pool.evictBlock();

						if (evicted == -1) { // no frames can be taken out, case 4
							System.out.println("The corresponding block " + file + " cannot be accessed from disk because the memory buffers are full");
						}
						else {
							pool.loadFrame(file);
							int frame = pool.frames.get(file);
							String content = pool.buffers[frame].getRecord(record);
							System.out.println(content + "; Brought file " + file + " from disk; Placed in frame " + (frame + 1) +
								"; Evicted file " + evicted + " from frame " + (frame + 1));
						}
					}
				}
			}
			else if (query[0].equals("SET")) {
				int record = Integer.parseInt(query[1]);
				String content = line.substring(line.indexOf('"') + 1, line.length() - 1);
				int file = (int)Math.ceil(record / 100.0);

				if(pool.frames.containsKey(file)) { // frame already in memory, case 1
					int frameID = pool.frames.get(file);
					pool.buffers[frameID].updateRecord(record, content);
					System.out.println("Write was successful; File " + file + " already in memory; Located in frame " + (frameID + 1));
				}
				else {
					if (pool.hasEmptyFrames()) { // there are empty frames, case 2
						pool.loadFrame(file);
						int frameID = pool.frames.get(file);
						pool.buffers[frameID].updateRecord(record, content);
						System.out.println("Write was successful; Brought file " + file + " from disk; Placed in frame " + (frameID + 1));
					}
					else { // no empty frames, check if frame can be taken out, case 3
						int evicted = pool.evictBlock();

						if (evicted == -1) { // no frames can be taken out, case 4
							System.out.println("The corresponding block " + file + " cannot be accessed from disk because the memory buffers are full; Write was unsuccessful");
						}
						else {
							pool.loadFrame(file);
							int frameID = pool.frames.get(file);
							pool.buffers[frameID].updateRecord(record, content);
							System.out.println("Write was successful; Brought file " + file + " from disk; Placed in frame " + (frameID + 1) +
								"; Evicted file " + evicted + " from frame " + (frameID + 1));
						}
					}
				}
			}
			else if (query[0].equals("PIN")) {
				int block = Integer.parseInt(query[1]);
				if(pool.frames.containsKey(block)) { // case 1
					int frameID = pool.frames.get(block);
					Frame fr = pool.buffers[frameID];
					if(fr.pinned) {
						System.out.println("File " + block + " pinned in frame " + (frameID + 1) + "; Already pinned");
					}
					else {
						fr.setPinned(true);
						System.out.println("File " + block + " pinned in frame " + (frameID + 1) + "; Not already pinned");
					}
				}
				else {
					if (pool.hasEmptyFrames()) { // there are empty frames, case 2
						pool.loadFrame(block);
						int frameID = pool.frames.get(block);
						pool.buffers[frameID].setPinned(true);
						System.out.println("File " + block + " pinned in frame " + (frameID + 1) + "; Not already pinned; Brought in from disk to an empty frame");
					}
					else { // no empty frames, check if frame can be taken out, case 3
						int evicted = pool.evictBlock();

						if (evicted == -1) { // no frames can be taken out, case 4
							System.out.println("The corresponding block " + block + " cannot be accessed from disk because the memory buffers are full");
						}
						else {
							pool.loadFrame(block);
							int frameID = pool.frames.get(block);
							pool.buffers[frameID].setPinned(true);
							System.out.println("File " + block + " pinned in frame " + (frameID + 1) + "; Not already pinned; Evicted file " + evicted + " from frame " + (frameID + 1));
						}
					}
				}
			}
			else if (query[0].equals("UNPIN")) {
				int block = Integer.parseInt(query[1]);
				if(pool.frames.containsKey(block)) { // case 1
					int frameID = pool.frames.get(block);
					Frame fr = pool.buffers[frameID];
					if(!fr.pinned) {
						System.out.println("File " + block + " in frame " + (frameID + 1) + " is unpinned; Frame was already unpinned");
					}
					else {
						fr.setPinned(false);

						System.out.println("File " + block + " in frame " + (frameID + 1) + " is unpinned; Frame was not already unpinned");
					}
				}
				else { // case 2
					System.out.println("The corresponding block " + block + " cannot be unpinned because it is not in memory");
				}
			}
			else {
				System.out.println("UNKNOWN COMMAND. PLEASE TRY AGAIN.");
			}
			System.out.print("The program is ready for the next command: > ");
		}
	}
}
