package cs4513_go_impl

import (
	"fmt"
	"sort"
    "strings"
    "io/ioutil"
    "regexp"
)

/*
Find the top K most common words in a text document.
What is a word?
	A word here only consists of alphanumeric characters, e.g., catch21
	All punctuations and other characters should be removed, e.g. "don't" becomes "dont" or "end." becomes "end"; done before the charThreshold
	A word has to satifies the charThreshold, e.g., if charThreshold = 5  "apple" is a word, but neither "new" or "york" are words
Matching condition
	Matching is case insensitive
Parameters:
- path: file path
- numWords: number of words to return (i.e. k)
- charThreshold: threshold for whether a token qualifies as a word
You should use `checkError` to handle potential errors.
*/
func TopWords(path string, numWords int, charThreshold int) []WordCount {
	// TODO: implement me
	// HINT: You may find the `strings.Fields` and `strings.ToLower` functions helpful
	// HINT: the regex "[^0-9a-zA-Z]+" can be used to spot any non-alphanumeric characters
    content, err := ioutil.ReadFile(path)

    if err != nil {
        return nil;
    }

    words := make(map[string]WordCount)
    fields := strings.Fields(string(content))

    for i := 0; i < len(fields); i++ {
        word := strings.ToLower(fields[i])
        word = regexp.MustCompile(`[^0-9a-zA-Z]+`).ReplaceAllString(word, "")
        if len(word) < charThreshold {
            continue
        }
        if val, exists := words[word]; exists {
            count := WordCount{Word: word, Count: val.Count + 1}
            words[word] = count
        } else {
            count := WordCount{Word: word, Count: 1}
            words[word] = count
        }
    }

    values := make([]WordCount, 0, len(words))
    for _, v := range words {
        values = append(values, v)
    }

    sortWordCounts(values)
	return values[0:numWords]
}

/*
Do NOT modify this struct!
A struct that represents how many times a word is observed in a document
*/
type WordCount struct {
	Word  string
	Count int
}

/*
Do NOT modify this function!
*/
func (wc WordCount) String() string {
	return fmt.Sprintf("%v: %v", wc.Word, wc.Count)
}

/*
Do NOT modify this function!
Helper function to sort a list of word counts in place.
This sorts by the count in decreasing order, breaking ties using the word.
*/
func sortWordCounts(wordCounts []WordCount) {
	sort.Slice(wordCounts, func(i, j int) bool {
		wc1 := wordCounts[i]
		wc2 := wordCounts[j]
		if wc1.Count == wc2.Count {
			return wc1.Word < wc2.Word
		}
		return wc1.Count > wc2.Count
	})
}
