use wasm_bindgen::prelude::*;
use js_sys::JsString;

#[wasm_bindgen]
extern "C" {
    pub fn say_hello();

    pub fn say_hello_name(name: &str);

    pub fn return_string() -> String;

    pub fn return_array() -> Vec<i32>;

    pub fn get_random_number();

    pub fn observer_input(id: String);

    pub fn observer_static_input();

    pub fn observer_static_input_using_jquery(id: &str);

    // Testing

    pub fn clear_deleted_genre_input(id: i32);
        
    pub fn clear_inputs(array: Vec<JsString>);

    pub fn insert_genre_validations();

    pub fn update_genre_validations();

    pub fn delete_genre_validations();

    pub fn search_genre_validations();
}