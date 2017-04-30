// Write a function that takes three strings - a verb, an adjective, and a noun
// - uppercases and interpolates them into the sentence "We shall VERB the
// ADJECTIVE NOUN". Use ES6 template literals.

function madLib(verb, adjective, noun)
{
  // capitalize
  let capVerb = verb.toUpperCase();
  let capAdj = adjective.toUpperCase();
  let capNoun = noun.toUpperCase();

  // interpolate
  return `We shall ${capVerb} the ${capAdj} ${capNoun}`;
}

function  isSubstring(searchString, subString)
{
  if (searchString.includes(subString))
  {
    return true;
  }
  return false;
}

function fizzBuzz(arr)
{
  let newArr = [];

  for (let i = 0; i < arr.length; i++)
  {
    if (arr[i] % 3 === 0 && arr[i] % 5 !== 0)
    {
      newArr.push(arr[i]);
    }

    else if (arr[i] % 3 !== 0 && arr[i] % 5 === 0)
    {
      newArr.push(arr[i]);
    }

  }

  return newArr;
}

function isPrime(num)
{

  if (num < 2)
  {
    return false;
  }

  for (let factor = 2; factor < num; factor++)
  {
    if (num % factor === 0)
    {
      return false;
    }
  }

  return true;
}


function sumOfNPrimes(num)
{
  let sum = 0;
  let numPrimes = 0;

  for (let pos = 2; numPrimes < num; pos++)
  {
    if (isPrime(pos))
    {
      sum += pos;
      numPrimes++;
    }
  }

  return sum;
}

function allOrNothing(mod, ...nums)
{
  for (let i = 0; i < nums.length; i++)
  {
    if (nums[i] % mod !== 0)
    {
      return false;
    }
  }

  return true;
}
