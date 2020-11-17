let column = JSON.parse(process.argv[2]);
console.log(matMul(column).join('\n'));


function matMul(col) {
    col[0] = parseInt(Number(col[0], 10));
    col[1] = parseInt(Number(col[1], 10));
    col[2] = parseInt(Number(col[2], 10));
    col[3] = parseInt(Number(col[3], 10));
    let s0 = mul2(col[0]) ^ mul3(col[1]) ^ col[2] ^ col[3];
    let s1 = col[0] ^ mul2(col[1]) ^ mul3(col[2]) ^ col[3];
    let s2 = col[0] ^ col[1] ^ mul2(col[2]) ^ mul3(col[3]);
    let s3 = mul3(col[0]) ^ col[1] ^ col[2] ^ mul2(col[3]);
    return [(s0 & 0xff).toString(16), (s1 & 0xff).toString(16), (s2 & 0xff).toString(16), (s3 & 0xff).toString(16)];
}

function mul2(num) {
    let mult = num << 1;
    if ((num & 0x80) === 0x80) {
        mult ^= 0x1b;
    }
    return mult;
}

function mul3(num) {
    return mult = mul2(num) ^ num;
}
