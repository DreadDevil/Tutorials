function sumArray(array) {
  return array.reduce((acc, current) => acc + current, 0);
}

function findMaxNumber(array) {
  return Math.max(...array);
}

module.exports = {
  sum,
  average
};