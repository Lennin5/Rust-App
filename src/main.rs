#![recursion_limit = "512"]

extern crate lazy_static;

use log::*;
use yew::prelude::*;
use yew_router::prelude::*;

mod config;
pub mod graphql;

pub mod components;

use crate::components::router::my_router::{Route, switch};

pub mod assets;

#[derive(Debug)]
enum Message {}

struct Model {}

impl Component for Model {
    type Message = Message;
    type Properties = ();

    fn create(_ctx: &Context<Self>) -> Self {
        Self {}
    }

    fn update(&mut self, _ctx: &Context<Self>, msg: Self::Message) -> bool {
        info!("{:?}", msg);
        true
    }

    fn changed(&mut self, ctx: &Context<Self>, _props: &Self::Properties) -> bool {
        info!("{:?}", ctx.props());
        true
    }

    fn view(&self, _ctx: &Context<Self>) -> Html {
        html! {
            <>          
            // <p>{ "Hello World!" }</p>

            <BrowserRouter>
                <Switch<Route> render={switch} /> 
            </BrowserRouter>                
                
                // <hr />
                // <ShowMovieList />
                // <hr />
                // <ShowMovieByID />
                // <hr />
                // <InsertGenre />
                // <hr />
                // <DeleteGenre />
                // <hr />
                // <UpdateGenre />
                // <hr />
                // <SearchGenre />                
            </>
        }
    }
}

fn main() {
    wasm_logger::init(wasm_logger::Config::new(log::Level::Info));
    yew::Renderer::<Model>::new().render();    
}
