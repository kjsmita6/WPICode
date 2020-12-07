function powerMod(a, b, n) {
  a = a % n;
  var result = 1;
  var x = a;

  while(b > 0){
    var leastSignificantBit = b % 2;
    b = Math.floor(b / 2);

    if (leastSignificantBit == 1) {
      result = result * x;
      result = result % n;
    }

    x = x * x;
    x = x % n;
  }
  return result;
}

function getElementOrders(orders) {
    let ret = {};
    for (let i = 2; i < 43; i++) {
        orders.forEach(order => {
            if (!ret[order]) {
                ret[order] = [];
            }
            if (powerMod(i, order, 43) === 1) {
                ret[order].push(i);
            }
        });
    }
    return ret;
}

console.log(JSON.stringify(getElementOrders([2,3,6,7,14,21,42]), null, 4));

 
