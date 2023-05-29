use wasm_bindgen::JsCast;
use web_sys::HtmlInputElement;
use yew::prelude::*;
use crate::graphql::{GraphQLService, GraphQLTask, Request, RequestTask};
use code_location::code_location;
use gloo::console::log;
use crate::components::models::model_genre::{SearchGenreMutation, search_genre_mutation};
use crate::assets::utils::extern_c::{search_genre_validations};

pub struct SearchGenre {
    graphql_task: Option<GraphQLTask>,
    req_task: Option<RequestTask>,
    search_term: String,
    search_results: Option<search_genre_mutation::ResponseData>,
}

pub enum SearchGenreMessage {
    SearchTermChanged(String),
    SearchButtonClicked,
    SearchResultsReceived(Option<search_genre_mutation::ResponseData>),
}

impl Component for SearchGenre {
    type Message = SearchGenreMessage;
    type Properties = ();

    fn create(_ctx: &Context<Self>) -> Self {
        Self {
            graphql_task: Some(GraphQLService::connect(&code_location!())),
            req_task: None,
            search_term: "".to_string(),
            search_results: None,
        }
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Self::Message::SearchTermChanged(term) => {
                self.search_term = term;
                true
            }
            Self::Message::SearchButtonClicked => {
                if let Some(graphql_task) = self.graphql_task.as_mut() {
                    let vars = search_genre_mutation::Variables {
                        word: self.search_term.clone(),
                    };
                    let task = SearchGenreMutation::request(graphql_task, &ctx, vars, |data| {
                        Self::Message::SearchResultsReceived(data.clone())
                    });
                    self.req_task = Some(task);
                }
                true
            }
            Self::Message::SearchResultsReceived(data) => {
                self.search_results = data.clone();
                true
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        let link_clone = ctx.link().clone();

        let on_search_term_change = Callback::from(move |event: yew::KeyboardEvent| {
            let value = event
                .target()
                .unwrap()
                .dyn_into::<HtmlInputElement>()
                .unwrap()
                .value();
            log!("Search term changed: {}", &value);
            let msg = SearchGenreMessage::SearchTermChanged(value);
            link_clone.send_message(msg);
        });

        let on_search_button_click = ctx.link().callback(|_| SearchGenreMessage::SearchButtonClicked);

        let search_results = if let Some(results) = &self.search_results {
            html! {
                <div class="container">
                    {
                        if results.genre.len() > 0 {
                            html! {
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>{"ID"}</th>
                                            <th>{"Genre Name"}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        { for results.genre.iter().map(|genre| html! {
                                            <tr>
                                                <td>{ &genre.id }</td>
                                                <td>{ &genre.name }</td>
                                            </tr>
                                        })}
                                    </tbody>
                                </table> 
                            }
                        }
                        else {
                            html! {
                                <></>
                            }
                        }
                    }   
                </div>  
            }
        } else {
            html! {
                <div>
                    // <p>{ "No results" }</p>
                </div>
            }
        };

        // Prevent form submission
        let submit_form = Callback::from(move |event: yew::SubmitEvent| {
            event.prevent_default();
        });

        html! {
        
            <div class="container mb-5">
                <br />
                    <h1 class="title">{"Search Genre"}</h1>                    
                <br /> 
                
                <form onsubmit={submit_form}>
                    <div class="mb-3">
                        <label class="form-label">{"Genre Name"}</label>
                        <input type="text" class="form-control" id="search_genre_name" onkeyup={|_| search_genre_validations()} onkeyup={on_search_term_change} required={true} />
                    </div> 
                    <div class="mb-3">
                        <button type="button" class="btn btn-primary" disabled={true} id="search_genre_btn" onclick={on_search_button_click}>{ "Search" }</button>
                    </div>                                        
                </form>                                   
                                                  
                { search_results }
            </div>
        }
    }
}
