function printCallback(arr)
{
  arr.forEach(element => console.log(element));
}

function titleize(names, callBack)
{
  var titleized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);

  callBack(titleized);
}

function Elephant(name, age, activities)
{
  this.name = name;
  this.age = age;
  this.activities = activities;
}

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];


Elephant.prototype.paradeHelper = function(elephant)
{
  console.log(`${elephant.name} is trotting by!`);
};

// Something is wrong.... ???
herd.forEach(elephant => elephant.paradeHelper);
