
class LFSR {
    constructor(m, gate, initial) {
        this.m = m;
        this.gatePos = gate;
        this.initialState = initial;
    }

    compute(n) {
        let result = [];
        let states = this.initialState.slice();
        let last = this.m - 1;
        for (let i = 0; i < n; i++) {
            let feedback = states[last] * this.gatePos[last];
            result[i] = states[this.m - 1];
            for (let j = last; j >= 0; j--) {
                feedback ^= states[j - 1] * this.gatePos[j - 1];
            }
            states.unshift(feedback);
            states.pop();
        }
        return result.join('');
    }
}

if (process.argv.length < 6) {
    console.log('Usage: node lfsr.js m gatePositions initialStates numSteps');
    process.exit(0);
} else {
    let m = process.argv[2];
    let gates = process.argv[3].split('');
    let initialStates = process.argv[4].split('');
    let lfsr = new LFSR(m, gates, initialStates);
    console.log(lfsr.compute(process.argv[5]));
}
