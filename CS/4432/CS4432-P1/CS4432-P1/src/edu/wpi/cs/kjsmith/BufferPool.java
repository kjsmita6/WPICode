package edu.wpi.cs.kjsmith;

import java.io.*;
import java.math.BigInteger;
import java.util.ArrayList;
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
		emptyFrames = -1; // -1 in twos complement = 11111111111... so all frames are empty
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
		frames = new HashMap<>();
		emptyFrames = -1;
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
		File f = new File(System.getProperty("user.dir") + "/F" + id + ".txt"); // System.getProperty("user.dir") is the directory where the program is running
		if(!f.exists()) {
			return false; // should never happen?
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
			String record = sc.nextLine(); // read the entire file at once into the StringBuilder
			sb.append(record);
		}

		// create new frame with file content and add it to the buffer pool
		buffers[frame] = new Frame(sb.toString(), false, false, id);

		// link block ID with frame ID in the hash table
		frames.put(id, frame);

		// update list of empty frames
		emptyFrames ^= (long)Math.pow(2, frame); // 2^frame will be a 1 where the frame is in the bitmap, XOR will make it 0 meaning it is in use
		return true;
	}

	/**
	 * Reads a block into the specific frame from disk
	 * @param id Block ID to load
	 * @param frameID the frame ID to place the block in
	 * @return True if block was successfully loaded, false otherwise
	 */
	public Boolean loadFrame(int id, int frameID) {
		File f = new File(System.getProperty("user.dir") + "/F" + id + ".txt");
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
		buffers[frameID] = new Frame(sb.toString(), false, false, id);

		// link block ID with frame ID in the hash table
		frames.put(id, frameID);

		// update list of empty frames
		emptyFrames ^= (long)Math.pow(2, frameID); // see above
		return true;
	}

	/**
	 * Checks if the BufferPool has any empty frames
	 * @return True if there are empty frames, false otherwise
	 */
	public Boolean hasEmptyFrames() {
		return Math.pow(2, buffers.length) - 1 != ~emptyFrames;
	}

	/**
	 * Finds the first empty frame in memory
	 * @return The index for an empty frame if one is found, -1 if no empty frames exist
	 */
	public int getEmptyFrame() {
		if(!hasEmptyFrames()) {
			return -1;
		}
		return (int)(Math.log(emptyFrames & -emptyFrames) / Math.log(2)); // this gets the first (least significant) 1 in the bitmap
	}

	/**
	 * Removes a specific block from memory. If the dirty bit is set, write the block to memory.
	 * @param blockID The block to evict
	 * @return True if the block was evicted, false otherwise
	 */
	public Boolean evictBlock(int blockID) {
		Frame fr =  buffers[frames.get(blockID)];
		if(fr.pinned) {
			return false; // do not evict a pinned block
		}
		if (fr.getDirty()) {
			writeBlock(fr.blockId); // if the dirty bit is set, then write the block before evicting
		}
		emptyFrames |= (long)Math.pow(2, frames.get(blockID)); // 2^frame will be a 1 in that location in the bitmap, OR will make it 1 meaning it is empty
		frames.remove(blockID);
		return true;
	}

	/**
	 * Removes the LRU block from memory
	 * @return The block number that was evicted, -1 if no blocks could be removed
	 */
	public Integer evictBlock() {
		ArrayList<Frame> candidates = new ArrayList<>();
		for(Frame f : buffers) {
			if(!f.pinned) {
				candidates.add(f); // can only evict blocks that are not pinned
			}
		}
		if(candidates.size() == 0) {
			return -1; // if there are no unpinned blocks, then unable to evict
		}

		Frame fr = candidates.get(0);
		// TODO: Implement lastUsed
		for(Frame f : candidates) {
			if(f.lastUsed.before(fr.lastUsed) && f.blockId != -1) {
				fr = f; // evict the block that is least recently used (LRU)
			}
		}

		evictBlock(fr.blockId);
		return fr.blockId;
	}

	/**
	 * Returns a specified block to disk
	 * @param block The block to write
	 * @return True if block is written successfully, false otherwise
	 */
	public boolean writeBlock(int block) {
		try {
			Frame fr = buffers[frames.get(block)];
			FileWriter fw = new FileWriter(System.getProperty("user.dir") + "/F" + block + ".txt");
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(fr.content);
			bw.close();
			fr.setDirty(false);
			return true;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
	}
}
