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
