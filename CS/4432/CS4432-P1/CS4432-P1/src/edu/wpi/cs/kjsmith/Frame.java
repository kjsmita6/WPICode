package edu.wpi.cs.kjsmith;

import java.util.Date;

/**
 * Class which represents a single memory frame (buffer)
 */
public class Frame {
	String content;
	Boolean dirty;
	Boolean pinned;
	Date lastUsed;
	int blockId;

	public final int FILE_SIZE = 40;

	/**
	 * Default constructor. Sets all values to default.
	 */
	public Frame() {
		content = "";
		dirty = false;
		pinned = false;
		blockId = -1;
		lastUsed = new Date();
	}

	/**
	 * Parameterized constructor
	 * @param content The content of the file, always 4 KiB
	 * @param dirty Whether the content of the file has changed and needs to be written to disk
	 * @param pinned Request to keep this block in memory
	 * @param blockId ID of the block, -1 means frame is empty
	 */
	public Frame(String content, Boolean dirty, Boolean pinned, int blockId) {
		this.content = content;
		this.dirty = dirty;
		this.pinned = pinned;
		this.blockId = blockId;
		lastUsed = new Date();
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Boolean getDirty() {
		return dirty;
	}

	public void setDirty(Boolean dirty) {
		this.dirty = dirty;
	}

	public Boolean getPinned() {
		return pinned;
	}

	public void setPinned(Boolean pinned) {
		this.pinned = pinned;
	}

	public int getBlockId() {
		return blockId;
	}

	public void setBlockId(int blockId) {
		this.blockId = blockId;
	}

	/**
	 * Gets the starting index of the record within the file
	 * @param num The record number
	 * @return The starting index of the record
	 */
	private int fileOffset(int num) {
		return FILE_SIZE * (num - 1); // get the starting index of the record
	}

	/**
	 * Gets the specified record from the file
	 * @param num The record number
	 * @return The 40 byte record
	 * @see Frame#fileOffset(int)
	 */
	public String getRecord(int num) {
		int nthRecord = num;
		if(num > 100) { // need to calculate offset if the record is not located in the first file since the records will be in the #100s even though
						// there aren't really that many records in that file
			nthRecord = num - ((blockId - 1) * 100);
		}
		updateLastUsed();
		return content.substring(fileOffset(nthRecord), fileOffset(nthRecord) + FILE_SIZE); // return the specified record
	}

	/**
	 * Updates a specific record
	 * @param num The record number to update
	 * @param record The new record content
	 * @return True if the record was updated, false otherwise
	 * @see Frame#getRecord(int)
	 */
	public Boolean updateRecord(int num, String record) {
		/*if(record.equals(getRecord(num))) {
			return false; // do not update the record if it is the same
		}*/
		int nthRecord = num;
		if(num > 100) { // see above
			nthRecord = num - ((blockId - 1) * 100);
		}
		StringBuilder sb = new StringBuilder(this.content);
		int offset = fileOffset(nthRecord);
		sb.replace(offset, FILE_SIZE + offset, record); // starting at the record offset and length 40, replace the old record with the new one
		this.content = sb.toString();
		setDirty(true); // set dirty bit so system knows to update the file
		updateLastUsed();
		return true;
	}

	/**
	 * Updates the last used time to the current time, should be called whenever a Frame is updated or accessed
	 */
	private void updateLastUsed() {
		lastUsed = new Date();
	}
}
