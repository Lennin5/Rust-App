use super::super::models::model_movies::*;
use yew::prelude::*;

use crate::graphql::{ GraphQLService, GraphQLTask, Request, RequestTask};
use code_location::code_location;
use crate::components::models::model_movies::ShowMovies;

pub struct ShowMovieList {
    graphql_task: Option<GraphQLTask>,
    req_task: Option<RequestTask>,
    movie: Option<show_movies::ResponseData>,
}

pub enum ShowMovieMessage {
    ShowMovieData,
    MovieReceived(Option<show_movies::ResponseData>),
}


impl Component for ShowMovieList {
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
        match msg {
            Self::Message::ShowMovieData => {
                if let Some(graphql_task) = self.graphql_task.as_mut() {
                    let vars = show_movies::Variables {                        
                    };
                    let task = ShowMovies::request(graphql_task, &ctx, vars, | data | {
                        Self::Message::MovieReceived(data)
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
        let _list_movie = self.movie.clone().and_then(|data| Some(data.movie)).unwrap_or_default().iter().map(|movie|{
            html!{
                <>
                    <tr>
                        <th>{movie.id.clone()}</th>
                        <th>{movie.title.clone()}</th>
                        <th>{movie.genre_data.name.clone()}</th>
                    </tr>                
                </>
            }
        }).collect::<Html>();

        html! {
            <>
                <div class="container">
                    <br />
                    <h1 class="title">{"Show Movies"}</h1>
                    // Add button to redirect to /show_movies_by_genre/Horror
                    // <a href="/genres/Horror" class="btn btn-primary">{"Horror"}</a>            
                    <br />

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>{"ID"}</th>
                                <th>{"Title"}</th>
                                <th>{"Genre Name"}</th>
                                <th>{"Action"}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {
                                self.movie.clone().and_then(|data| Some(data.movie)).unwrap_or_default().iter().map(|movie|{
                                    html!{
                                        <>
                                            <tr>
                                                <th>{movie.id.clone()}</th>
                                                <th>{movie.title.clone()}</th>
                                                <th>{movie.genre_data.name.clone()}</th>
                                                <th>
                                                    <a class="text-gray-900" href={format!("/genres/{}", movie.genre_data.name.clone())} class="button is-info">{"Show Movies By Genre: "}{movie.genre_data.name.clone()}</a>
                                                </th>
                                            </tr>                
                                        </>
                                    }
                                }).collect::<Html>()
                            }
                        </tbody>
                    </table>    
                </div>                        
            </>
        }
    }
}
    