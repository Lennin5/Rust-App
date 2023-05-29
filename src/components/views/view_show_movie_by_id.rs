use super::super::models::model_movies::*;
use yew::prelude::*;

use crate::graphql::{GraphQLService, GraphQLTask, Request, RequestTask};
use code_location::code_location;
use crate::components::models::model_movies::ShowMovieById;

pub struct ShowMovieByID {
    graphql_task: Option<GraphQLTask>,
    req_task: Option<RequestTask>,
    movie: Option<show_movie_by_id::ResponseData>,
}

pub enum ShowMovieMessage {
    ShowMovieData,
    MovieReceived(Option<show_movie_by_id::ResponseData>),
}

impl Component for ShowMovieByID {
    type Message = ShowMovieMessage;
    type Properties = ();

    fn create(ctx: &Context<Self>) -> Self {
        let _show_data = ctx.link().send_message(Self::Message::ShowMovieData);
        Self {
            graphql_task: Some(GraphQLService::connect(&code_location!())),
            req_task: None,
            movie: None,
        }
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        let x :i64 = 99;
        let my_id = Option::from(x);
        match msg {
            Self::Message::ShowMovieData => {
                if let Some(graphql_task) = self.graphql_task.as_mut() {
                    let vars = show_movie_by_id::Variables {
                        eq: my_id,
                    };
                    let task = ShowMovieById::request(graphql_task, &ctx, vars, |data| {
                        Self::Message::MovieReceived(data.clone())
                    });
                    self.req_task = Some(task);
                }
            }
            Self::Message::MovieReceived(data) => {
                self.movie = data.clone();
            }
        }
        true
    }

    fn view(&self, _ctx: &Context<Self>) -> Html {
        let list_movie = self.movie.clone().and_then(|data| Some(data.movie)).unwrap_or_default().iter().map(|movie|{
            html!{
                <>
                    <tr>
                        <th>{movie.id.clone()}</th>
                        <th>{movie.title.clone()}</th>
                        <th>{movie.original_language.clone()}</th>
                        <th>{movie.release_date.clone()}</th>
                    </tr>                
                </>
            }
        }).collect::<Html>();

        html! {
            <>
                <div class="container">
                    <br />
                    <h1 class="title">{"Show Movie By ID"}</h1>                    
                    <br />
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>{"ID"}</th>
                                <th>{"Title"}</th>
                                <th>{"Original Language"}</th>
                                <th>{"Release Date"}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {list_movie}
                        </tbody>
                    </table>   
                </div>                         
            </>
        }
    }
}