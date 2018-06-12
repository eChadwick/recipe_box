function addDirection(){
  var direction = document.createElement("input");
  direction.placeholder = "Direction";
  direction.name = "recipe[directions][]";
  direction.autocomplete = "off";
  direction.type = "text"

  var remove_button = document.createElement("img");
  remove_button.src = "/assets/remove-button.png";
  remove_button.className = "remove_recipe_element";
  remove_button.onclick = function() {
    var target = this.parentElement;
    target.parentElement.removeChild(target);
  }

  var td = document.createElement("td");
  td.appendChild(direction);
  td.appendChild(remove_button);

  var tr = document.createElement("tr");
  tr.appendChild(td);

  document.getElementById("directions_list").appendChild(tr);
}

function addIngredient(){
  var id = Date.now();

  var ingredient = document.createElement("input");
  ingredient.placeholder = "Ingredient";
  ingredient.name = "recipe[recipe_ingredients_attributes][" + id + "][ingredient_attributes][name]";
  ingredient.autocomplete = "off";
  ingredient.type = "text";

  var measurement = document.createElement("input");
  measurement.placeholder = "Measurement";
  measurement.name = "recipe[recipe_ingredients_attributes][" + id + "][measurement]";
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

// self is the object calling the removal.
//
// Removes entire tr containing self
function removeExistingDirection(self){
  document.getElementById('directions_list').removeChild(self.parentElement.parentElement);
}

// self is the object calling the removal.
// id is the database id of the recipe_ingredient being removed
//
// Removes entire tr containing self and adds id to params
function removeExistingIngredient(self, id){
  var delete_field = document.createElement('input');
  delete_field.type = 'hidden';
  delete_field.name = 'deleted_ingredients[]';
  delete_field.value = id
  document.getElementById('ingredients_list').removeChild(self.parentElement.parentElement);
  document.getElementById('ingredients_list').appendChild(delete_field)
}
