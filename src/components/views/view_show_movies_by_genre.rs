use yew::prelude::*;
use code_location::code_location;
use crate::graphql::{GraphQLService, GraphQLTask, Request, RequestTask};
use crate::components::models::model_movies::{ShowMoviesByGenreMutation, show_movies_by_genre_mutation};
use gloo::timers::callback::Timeout;

#[derive(Properties, PartialEq)]
pub struct CategoryName {
    pub genre: String,
}

pub struct ShowMovieByGenre {
    graphql_task: Option<GraphQLTask>,
    req_task: Option<RequestTask>,
    movie: Option<show_movies_by_genre_mutation::ResponseData>,
}

pub enum ShowMovieMessage {
    ShowMovieData,
    MovieReceived(Option<show_movies_by_genre_mutation::ResponseData>),
}

impl Component for ShowMovieByGenre {
    type Message = ShowMovieMessage;
    type Properties = CategoryName;

    fn create(ctx: &Context<Self>) -> Self {
        let _show_data = ctx.link().send_message(Self::Message::ShowMovieData);
        Self {
            graphql_task: Some(GraphQLService::connect(&code_location!())),
            req_task: None,
            movie: None,
        }
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        let my_genre = ctx.props().genre.replace("%20", " ");
        match msg {
            Self::Message::ShowMovieData => {
                if let Some(graphql_task) = self.graphql_task.as_mut() {
                    let vars = show_movies_by_genre_mutation::Variables {
                        genre: my_genre,
                    };
                    let task = ShowMoviesByGenreMutation::request(graphql_task, &ctx, vars, |data| {
                        Self::Message::MovieReceived(data.clone())
                    });
                    self.req_task = Some(task);
                }
            }
            Self::Message::MovieReceived(data) => {
                self.movie = data;
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
                        <th>{movie.genre_data.name.clone()}</th>
                    </tr>                
                </>
            }
        }).collect::<Html>();

        Timeout::new(2000, move || {
           // code...
        }).forget();

        html! {
            <>
                <div class="container">
                    <h1>{ "Curent category: " }{ &_ctx.props().genre }</h1>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>{"ID"}</th>
                                <th>{"Title"}</th>
                                <th>{"Original Language"}</th>
                                <th>{"Release Date"}</th>
                                <th>{"Genre Name"}</th>
                            </tr>
                        </thead>
                        <tfoot>
                            { list_movie }
                        </tfoot>
                    </table>   
                </div>                         
            </>
        }
    }
}