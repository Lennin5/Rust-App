

function say_hello(){
    console.log("Hello from Javascript!");
  }

function say_hello_name(name){
    console.log(`Hello ${name} from Javascript!`);
}

function return_string() {
    return "This is my string returned from Javascript!"
}

function return_array() {
    return [1, 2, 3, 4, 5]
}

function get_random_number() {
    console.log("A random number is: " + _.random(1, 100));
    // alert("Another random number is: " + _.random(1, 100));
}

function observer_input(id) {
    let value = document.getElementById(id).value;
    console.log(value);
}

function observer_static_input() {
    var x = document.getElementById("my-input-number");
    x.addEventListener("keyup", function() {
        console.log("This is the value of my input number: "+x.value);
    });
}

function observer_static_input_using_jquery(id){
    $("#"+id).keyup(function(){
        console.log("This is the value of my input using jquery: "+$("#"+id).val());
    });
}

function clear_deleted_genre_input(deleted_id) {
    console.log("The id passed as param from Rust is: "+deleted_id);
}

function clear_inputs(array){
    for (let i = 0; i < array.length; i++) {
        document.getElementById(array[i]).value = "";
        // console.log("the element is: "+array[i]);
    }
}

// When inputs with id add_genre_id and add_genre_name are filled, the button add_genre is enabled
function insert_genre_validations() {
    var input_ids = ["add_genre_id", "add_genre_name"];
    var allInputsEmpty = true;
  
    for (var i = 0; i < input_ids.length; i++) {
        if ($("#" + input_ids[i]).val() != "") {
            allInputsEmpty = false;
        }else {
            allInputsEmpty = true;
            break;
        }
    }
  
    if (allInputsEmpty) {
      $("#add_genre_btn").prop("disabled", true);
    } else {
        $("#add_genre_btn").prop("disabled", false);
    }
}

function update_genre_validations() {
    var input_ids = ["update_genre_id", "update_genre_name"];
    var allInputsEmpty = true;
  
    for (var i = 0; i < input_ids.length; i++) {
        if ($("#" + input_ids[i]).val() != "") {
            allInputsEmpty = false;
        }else {
            allInputsEmpty = true;
            break;
        }
    }
  
    if (allInputsEmpty) {
      $("#update_genre_btn").prop("disabled", true);
    } else {
        $("#update_genre_btn").prop("disabled", false);
    }
}

function delete_genre_validations() {
    var input_ids = ["delete_genre_id"];
    var allInputsEmpty = true;
  
    for (var i = 0; i < input_ids.length; i++) {
        if ($("#" + input_ids[i]).val() != "") {
            allInputsEmpty = false;
        }else {
            allInputsEmpty = true;
            break;
        }
    }
  
    if (allInputsEmpty) {
      $("#delete_genre_btn").prop("disabled", true);
    } else {
        $("#delete_genre_btn").prop("disabled", false);
    }
}

function search_genre_validations(){
    var input_ids = ["search_genre_name"];
    var allInputsEmpty = true;
  
    for (var i = 0; i < input_ids.length; i++) {
        if ($("#" + input_ids[i]).val() != "") {
            allInputsEmpty = false;
        }else {
            allInputsEmpty = true;
            break;
        }
    }
  
    if (allInputsEmpty) {
      $("#search_genre_btn").prop("disabled", true);
    } else {
        $("#search_genre_btn").prop("disabled", false);
    }    
}