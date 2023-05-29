// use super::super::models::model_genre::*;
use js_sys::JsString;
use wasm_bindgen::prelude::*;
use web_sys::HtmlInputElement;
use yew::prelude::*;
use gloo::console::log;

use crate::graphql::{GraphQLService, GraphQLTask, Request, RequestTask};
use code_location::code_location;
use crate::components::models::model_genre::{InsertGenreMutation, insert_genre_mutation};

use crate::assets::utils::extern_c::{clear_inputs, insert_genre_validations};

pub struct InsertGenre {
    graphql_task: Option<GraphQLTask>,
    req_task: Option<RequestTask>,
    genre_id: i32,
    genre_name: String,
    genre: Option<insert_genre_mutation::ResponseData>,
}

pub enum InsertGenreMessage {
    InsertGenreData,
    GenreReceived(Option<insert_genre_mutation::ResponseData>),
    UpdateGenreId(String),
    UpdateGenreName(String),
    ClearInternalData(),
    ClearExternalData(),
}

impl Component for InsertGenre {
    type Message = InsertGenreMessage;
    type Properties = ();

    fn create(_ctx: &Context<Self>) -> Self {
        Self {
            graphql_task: Some(GraphQLService::connect(&code_location!())),
            req_task: None,
            genre_id: 0,
            genre_name: "".to_string(),
            genre: None,
        }
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        // pub fn clear_all_data(self_ref: &mut InsertGenre) {
        //     // Clear inputs in frontend
        //     let vec: Vec<JsString> = vec!["genre_id".into(), "genre_name".into()];
        //     clear_inputs(vec);
        //     // Clear self data in backend
        //     self_ref.genre_id = 0;
        //     self_ref.genre_name = "".to_string();
        // }
        match msg {
            Self::Message::InsertGenreData => {
                if let Some(graphql_task) = self.graphql_task.as_mut() {
                    let vars = insert_genre_mutation::Variables {
                        id: self.genre_id as i64,
                        name: self.genre_name.clone(),
                    };
                    let task = InsertGenreMutation::request(graphql_task, &ctx, vars, |data| {
                        Self::Message::GenreReceived(data.clone())
                    });
                    self.req_task = Some(task);
                    // clear_all_data(self); // This is an option to call a function in the same struct it
                    
                    // Execute ClearInternalData()
                    ctx.link().send_message(Self::Message::ClearExternalData());
                    // Execute ClearExternalData()
                    ctx.link().send_message(Self::Message::ClearInternalData());

                    log!("Inserted data!");
                }
            }
            Self::Message::GenreReceived(data) => {
                self.genre = data.clone();
            }
            Self::Message::UpdateGenreId(genre_id) => {
                self.genre_id = genre_id.parse::<i32>().unwrap_or(0);
                
            }
            Self::Message::UpdateGenreName(genre_name) => {
                self.genre_name = genre_name;
            }
            Self::Message::ClearInternalData() => {
                self.genre_id = 0;
                self.genre_name = "".to_string();
            }
            Self::Message::ClearExternalData() => {
                let vec: Vec<JsString> = vec!["add_genre_id".into(), "add_genre_name".into()];
                clear_inputs(vec);
            }
        }
        true
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        let context_id = ctx.link().clone();
        let cntext_name = ctx.link().clone();

        let change_id = Callback::from(move |event: yew::KeyboardEvent| {
            let value = event
                .target()
                .unwrap()
                .dyn_into::<HtmlInputElement>()
                .unwrap()
                .value();
            
            log!("value: {}", &value);
            let msg = InsertGenreMessage::UpdateGenreId(value);
            context_id.send_message(msg);
        });

        let change_name = Callback::from(move |event: yew::KeyboardEvent| {
            let value = event
                .target()
                .unwrap()
                .dyn_into::<HtmlInputElement>()
                .unwrap()
                .value();
            
            log!("value: {}", &value);
            let msg = InsertGenreMessage::UpdateGenreName(value);
            cntext_name.send_message(msg);
        });

        // We can call this function from butoon onclick event with onclick={|_| clear_all_data()}
        // pub fn clear_external_inputs_data() {
        //     // crea un vector de strings A y 
        //     let vec: Vec<JsString> = vec!["genre_id".into(), "genre_name".into()];
        //     clear_inputs(vec);
        // } 
        
        html! {
            <>
                <div class="container pb-5">
                    <br />
                    <h1 class="title">{"Insert Genre"}</h1>                    
                    <br /> 
                    
                    <form>
                        <div class="mb-3">
                            <label class="form-label">{"ID"}</label>
                            <input type="number" class="form-control" id="add_genre_id" onkeyup={|_| insert_genre_validations()} onkeyup={change_id} required={true} />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">{"Genre Name"}</label>
                            <input type="text" class="form-control" id="add_genre_name" onkeyup={|_| insert_genre_validations()}  onkeyup={change_name} required={true} />
                        </div>               
                        <div class="mb-5">     
                            <button type="button" class="btn btn-success me-2" id="add_genre_btn" disabled={true} onclick={ctx.link().callback(|_| InsertGenreMessage::InsertGenreData)}>{ "Insert Genre" }</button>             
                        </div>
                    </form>                    
 
                    // <br />
                    

                    <button class="btn btn-warning me-2" onclick={ctx.link().callback(|_| InsertGenreMessage::ClearInternalData())}>{ "Clear Internal (<self.values/>)" }</button>
                    <button class="btn btn-danger me-2" onclick={ctx.link().callback(|_| InsertGenreMessage::ClearExternalData())}>{ "Clear External (<inputs.values/>)" }</button>

                </div>                                
            </>
        }
    }
}


