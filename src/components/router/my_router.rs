use yew_router::prelude::*;
use yew::prelude::*;

use crate::components::views::view_show_movies::ShowMovieList;
use crate::components::views::view_show_movie_by_id::ShowMovieByID;
use crate::components::views::view_insert_genre::InsertGenre;
use crate::components::views::view_delete_genre::DeleteGenre;
use crate::components::views::view_update_genre::UpdateGenre;
use crate::components::views::view_search_genre::SearchGenre;
use crate::components::views::view_show_genres::ShowGenres as ShowGenresRoot;
use crate::components::views::view_show_movies_by_genre::ShowMovieByGenre;
use crate::components::views::view_testing_room::TestingRoom;

use crate::components::layout::Layout;

#[derive(Debug, Clone, PartialEq, Routable)]
pub enum Route {
    #[at("/")]
    ShowMovieList,
    #[at("/show-movie-by-id")]
    ShowMovieByID,
    #[at("/insert-genre")]
    InsertGenre,
    #[at("/delete-genre")]
    DeleteGenre,
    #[at("/update-genre")]
    UpdateGenre,
    #[at("/search-genre")]
    SearchGenre,
    #[at("/genres")]
    ShowGenresRoot,
    #[at("/genres/*")]
    ShowGenresSubRoutes,
    #[at("/testing-room")]
    TestingRoom,
    #[not_found]
    #[at("/404")]
    NotFound,
}

#[derive(Clone, Routable, PartialEq)]
enum GenreSubRoute {
    #[at("/genres/:genre")]
    ShowMovieByGenre { genre: String },
    #[not_found]
    #[at("/404")]
    NotFound,    
}

fn render_page(route: Route) -> Html {
    match route {
        Route::ShowMovieList => html! { <ShowMovieList /> },
        Route::ShowMovieByID => html! { <ShowMovieByID /> },
        Route::InsertGenre => html! { <InsertGenre /> },
        Route::DeleteGenre => html! { <DeleteGenre /> },
        Route::UpdateGenre => html! { <UpdateGenre /> },
        Route::SearchGenre => html! { <SearchGenre /> },
        Route::ShowGenresRoot => html! { <ShowGenresRoot /> },
        Route::ShowGenresSubRoutes => html! { <Switch<GenreSubRoute> render={switch_genres} /> },
        Route::NotFound => html! { <DeleteGenre /> },
        Route::TestingRoom => html! { <TestingRoom /> },
    }
}

fn switch_genres(route: GenreSubRoute) -> Html {
    match route {
        GenreSubRoute::ShowMovieByGenre { genre } => html! { <ShowMovieByGenre genre={genre} /> },
        GenreSubRoute::NotFound => html! { <p>{"404 not found"}</p> },
    }
}

pub fn switch(routes: Route) -> Html {  
    html! { 
        <>
            <Layout>
                {render_page(routes)}
            </Layout>
        </>
    }
}
