function addIngredient(){
  var id = Date.now();

  var ingredient = document.createElement("input");
  ingredient.placeholder = "Ingredient";
  ingredient.name = "recipe[recipe_ingredients][" + id + "][ingredient]";

  var measurement = document.createElement("input");
  measurement.placeholder = "Measurement";
  measurement.name = "recipe[recipe_ingredients][" + id + "][measurement]";

  var td = document.createElement("td");
  td.appendChild(ingredient);
  td.appendChild(measurement);

  var tr = document.createElement("tr");
  tr.appendChild(td);

  document.getElementById("ingredients_list").appendChild(tr);
}
