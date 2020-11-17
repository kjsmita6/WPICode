console.log(JSON.stringify(sortObj(getLetterFrequency(process.argv[2]), null, 4)));
console.log(translate(process.argv[2]));

function getLetterFrequency(str) {
    let freq = {};
    for (let i = 0; i < str.length; i++) {
        let c = str.charAt(i);
        if (c === ' ' || c === '-' || c === ';') {
            continue;
        }
        if (freq[c]) {
            freq[c]++;
        } else {
            freq[c] = 1;
        }
    }
    return freq;
}

function sortObj(obj) {
    let sorted = [];
    for (let char in obj) {
        sorted.push([char, obj[char]]);
    }
    sorted.sort((a, b) => {
        return b[1] - a[1];
    });
    return sorted;
}

function translate(str) {
    let key = { 'C' : 'E',
'B' : 'T',
'D' : 'A',
'G' : 'O',
'F' : 'N',
'A' : 'I',
'I' : 'S',
'E' : 'h',
'L' : 'r',
'K': 'L',
'H': 'D',
'J': 'c',
'M': 'u',
'N': 'm',
'S': 'w',
'Q': 'f',
'O': 'g',
'P': 'y',
'U': 'p' ,
'R': 'b',
'V': 'v' ,
'T': 'k',
'Y': 'j' };
    let res = '';
    for (let i = 0; i < str.length; i++) {
        let c = str.charAt(i);
        if (key[c]) {
            res += key[c].toUpperCase();
        } else {
            res += c;
        }
    }
    return res;
}
