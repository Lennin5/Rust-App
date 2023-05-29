use wasm_bindgen::JsCast;
use web_sys::HtmlInputElement;
use yew::prelude::*;
use super::super::models::model_genre::*;
use gloo::console::log;

use crate::graphql::{GraphQLService, GraphQLTask, Request, RequestTask};
use code_location::code_location;
use crate::components::models::model_genre::DeleteGenreMutation;

use crate::components::my_component::MyComponent;

pub struct DeleteGenre {
    graphql_task: Option<GraphQLTask>,
    req_task: Option<RequestTask>,
    genre_id: i32,
    genre: Option<delete_genre_mutation::ResponseData>,
}

pub enum DeleteGenreMessage {
    DeleteGenreData,
    GenreReceived(Option<delete_genre_mutation::ResponseData>),
    UpdateGenreId(String),
}

impl Component for DeleteGenre {
    type Message = DeleteGenreMessage;
    type Properties = ();

    fn create(_ctx: &Context<Self>) -> Self {
        Self {
            graphql_task: Some(GraphQLService::connect(&code_location!())),
            req_task: None,
            genre_id: 0,
            genre: None,
        }
    }
    
    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Self::Message::DeleteGenreData => {
                if let Some(graphql_task) = self.graphql_task.as_mut() {
                    let vars = delete_genre_mutation::Variables {
                        id: self.genre_id as i64,
                    };
                    let task = DeleteGenreMutation::request(graphql_task, &ctx, vars, |data| {
                        Self::Message::GenreReceived(data.clone())
                    });
                    self.req_task = Some(task);
                    log!("Deleted data!")
                }                
            }
            Self::Message::GenreReceived(data) => {
                self.genre = data.clone();
            }
            Self::Message::UpdateGenreId(genre_id) => {
                self.genre_id = genre_id.parse::<i32>().unwrap_or(0);
            }
        }
        true
    }
    
    fn view(&self, ctx: &Context<Self>) -> Html {
    
        let link_clone = ctx.link().clone();
    
        let change_id = Callback::from(move |event: yew::KeyboardEvent| {
            let value = event
                .target()
                .unwrap()
                .dyn_into::<HtmlInputElement>()
                .unwrap()
                .value();
            log!("value: {}", &value);
            let msg = DeleteGenreMessage::UpdateGenreId(value);
            link_clone.send_message(msg);
        });

        // let call_javascript = Callback::from(|_| {
        //     say_hello();
        // });         
    
        html! {
            <>
                <MyComponent 
                    delete_genre_action={ctx.link().callback(|_| DeleteGenreMessage::DeleteGenreData)} 
                    change_id={change_id} />                
            </>
        }
    }
}