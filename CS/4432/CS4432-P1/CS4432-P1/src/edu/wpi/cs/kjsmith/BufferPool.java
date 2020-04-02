package edu.wpi.cs.kjsmith;

import java.io.*;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

/**
 * A class representing the entire available buffer of memory
 */
public class BufferPool {
	Frame[] buffers;
	HashMap<Integer, Integer> frames; // <block id, frame #>
	long emptyFrames; // empty buffers (1 = empty, 0 = in use)

	/**
	 * Default constructor, initializes the buffers array to be empty
	 */
	public BufferPool() {
		buffers = new Frame[0];
		frames = new HashMap<>();
		emptyFrames = 0;
	}

	/**
	 * Parameterized constructor
	 * @param num The number of frames to create
	 * @see Program#main(String[])
	 */
	public BufferPool(int num) {
		buffers = new Frame[num];
		for(Frame f : buffers) {
			f = new Frame();
		}
	}

	/**
	 * Gets the specified block ID from the buffer pool
	 * @param id The block ID to retrieve
	 * @return The frame number that contains this block, or -1 if unavailable
	 */
	public int getFrameID(int id) {
		if(frames.containsKey(id)) {
			return frames.get(id);
		}
		return -1;
	}

	/**
	 * Gets the content of a specified frame
	 * @param id Block ID to retrieve
	 * @return The content of the specified block
	 * @see BufferPool#getFrameID
	 */
	public String getFrame(int id) {
		int frame = getFrameID(id);
		return buffers[frame + 1].content;
	}

	/**
	 * Reads a block into memory from disk
	 * @param id Block ID to load
	 * @return True if block was successfully loaded, false otherwise
	 */
	public Boolean loadFrame(int id) {
		int frame = getEmptyFrame();
		if(frame == -1) {
			return false;
		}
		File f = new File("F" + id);
		if(!f.exists()) {
			return false;
		}

		Scanner sc = null;
		try {
			sc = new Scanner(f);
		} catch (FileNotFoundException e) {
			// Should NEVER reach this point because above we return if the file doesn't exist
			e.printStackTrace();
			return false;
		}

		StringBuilder sb = new StringBuilder();
		while(sc.hasNextLine()) {
			String record = sc.nextLine();
			sb.append(record);
		}

		// create new frame with file content and add it to the buffer pool
		buffers[frame] = new Frame(sb.toString(), false, false, id);

		// link block ID with frame ID in the hash table
		frames.put(id, frame);

		// update list of empty frames
		emptyFrames ^= (long)Math.pow(frame, 2);
		return true;
	}

	/**
	 * Finds the first empty frame in memory
	 * @return The index for an empty frame if one is found, -1 if no empty frames exist
	 */
	public int getEmptyFrame() {
		if(emptyFrames == 0) {
			return -1;
		}
		return (int)(Math.log(emptyFrames & -emptyFrames) / Math.log(2));
	}

	/**
	 * Returns a block to disk
	 * @param id Block to write to disk
	 * @return True if block is written successfully, false otherwise
	 */
	public boolean writeBlock(int id) {
		Frame lastUsed = buffers[0];
		for(Frame f : buffers) {
			if(f.lastUsed.before(lastUsed.lastUsed) && f.blockId != -1) {
				lastUsed = f;
			}
		}

		try {
			FileWriter fw = new FileWriter("F" + lastUsed.blockId);
			fw.write(lastUsed.content);
			lastUsed.setDirty(false);
			return true;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}

	}
}
