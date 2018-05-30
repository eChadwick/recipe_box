function addIngredient(){
  var id = Date.now();

  var ingredient = document.createElement("input");
  ingredient.placeholder = "Ingredient";
  ingredient.name = "recipe[recipe_ingredients_attributes][][ingredient_attributes][name]";
  ingredient.autocomplete = "off";
  ingredient.type = "text";

  var measurement = document.createElement("input");
  measurement.placeholder = "Measurement";
  measurement.name = "recipe[recipe_ingredients_attributes][][measurement]";
  measurement.autocomplete = "off";
  measurement.type = "text";

  var remove_button = document.createElement("img");
  remove_button.src = "/assets/remove-button.png";
  remove_button.className = "remove_recipe_element";
  remove_button.onclick = function() {
    var target = this.parentElement;
    target.parentElement.removeChild(target);
  }

  var td = document.createElement("td");
  td.appendChild(ingredient);
  td.appendChild(measurement);
  td.appendChild(remove_button);

  var tr = document.createElement("tr");
  tr.appendChild(td);

  document.getElementById("ingredients_list").appendChild(tr);
}
