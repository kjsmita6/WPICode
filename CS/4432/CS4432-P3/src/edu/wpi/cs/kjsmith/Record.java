package edu.wpi.cs.kjsmith;

/**
 * A class to represent a Record as exists in the dataset.
 * This class exists to remove the need for string parsing to get each field.
 */
class Record {
	String file;
	String num;
	String name;
	String address;
	String randomV;

	/**
	 * Constructor, initializes all fields to the parameter values
	 * @param file
	 * @param num
	 * @param name
	 * @param address
	 * @param randomV
	 */
	Record(String file, String num, String name, String address, String randomV) {
		this.file = file;
		this.num = num;
		this.name = name;
		this.address = address;
		this.randomV = randomV;
	}
}
