import re

def wordset(fname):
    """Returns the set of words corresponding to the given file"""
    # Create regexp for character filtering
    regex = re.compile('[^a-zA-Z ]')
    # Your code here
    words = set()
    file = open(fname, 'r')
    for line in file:
        subbed = regex.sub('', line)
        subbed = subbed.lower()
        for word in subbed.split(' '):
            words.add(word)
    file.close()
    return words

def jaccard(fname1, fname2):
    """Calculate Jaccard index"""
    # Your code here - call wordset()
    set1 = wordset(fname1)
    set2 = wordset(fname2)
    return len(set1.intersection(set2)) / len(set1.union(set2))
