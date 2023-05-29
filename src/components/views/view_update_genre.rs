use yew::prelude::*;
use wasm_bindgen::prelude::*;
use super::super::models::model_genre::*;
use gloo::console::log;
use code_location::code_location;
use js_sys::JsString;
use web_sys::HtmlInputElement;

use crate::graphql::{GraphQLService, GraphQLTask, Request, RequestTask};
use crate::components::models::model_genre::UpdateGenreMutation;

use crate::assets::utils::extern_c::{clear_inputs, update_genre_validations};

pub struct UpdateGenre {
    graphql_task: Option<GraphQLTask>,
    req_task: Option<RequestTask>,
    genre_id: i32,
    genre_name: String,
    genre: Option<update_genre_mutation::ResponseData>,
}

pub enum UpdateGenreMessage {
    UpdateGenreData,
    GenreReceived(Option<update_genre_mutation::ResponseData>),
    UpdateGenreId(String),
    UpdateGenreName(String),
    ClearInternalData(),
    ClearExternalData(),
}

impl Component for UpdateGenre {
    type Message = UpdateGenreMessage;
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
        match msg {
            Self::Message::UpdateGenreData => {
                if let Some(graphql_task) = self.graphql_task.as_mut() {
                    let vars = update_genre_mutation::Variables {
                        id: self.genre_id as i64,
                        name: self.genre_name.clone(),
                    };
                    let task = UpdateGenreMutation::request(graphql_task, &ctx, vars, |data| {
                        Self::Message::GenreReceived(data.clone())
                    });
                    self.req_task = Some(task);

                    ctx.link().send_message(Self::Message::ClearInternalData());
                    ctx.link().send_message(Self::Message::ClearExternalData());

                    log!("Updated data!");
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
                let vec: Vec<JsString> = vec!["update_genre_id".into(), "update_genre_name".into()];
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
            let msg = UpdateGenreMessage::UpdateGenreId(value);
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
            let msg = UpdateGenreMessage::UpdateGenreName(value);
            cntext_name.send_message(msg);
        });

        html! {
            <>
                <div class="container pb-5">
                    <br />
                    <h1 class="title">{"Update Genre"}</h1>                    
                    <br /> 
                    
                    <form>
                        <div class="mb-3">
                            <label class="form-label">{"ID"}</label>
                            <input type="number" class="form-control" id="update_genre_id" onkeyup={|_| update_genre_validations()} onkeyup={change_id} />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">{"Genre Name"}</label>
                            <input type="text" class="form-control" id="update_genre_name" onkeyup={|_| update_genre_validations()} onkeyup={change_name} />
                        </div>                    
                    </form>                    

                    <br />
                    <button class="btn btn-primary me-2" id="update_genre_btn" disabled={true} onclick={ctx.link().callback(|_| UpdateGenreMessage::UpdateGenreData)}>{ "Update Genre" }</button>             

                    <button class="btn btn-warning me-2" onclick={ctx.link().callback(|_| UpdateGenreMessage::ClearInternalData())}>{ "Clear Internal (<self.values/>)" }</button>
                    <button class="btn btn-danger me-2" onclick={ctx.link().callback(|_| UpdateGenreMessage::ClearExternalData())}>{ "Clear External (<inputs.values/>)" }</button>

                </div>                                
            </>
        }
    }
}