use yew::prelude::*;
use yew_router::prelude::*;
use crate::components::router::my_router::Route;
// use gloo::console::log;

#[function_component(Header)]
pub fn header() -> Html {

    let navigator = use_navigator().unwrap();
    let navigator_show_movie_list = navigator.clone();
    let navigator_show_movie_by_id = navigator.clone();
    let navigator_update = navigator.clone();
    let navigator_search = navigator.clone();
    let navigator_insert = navigator.clone();
    let navigator_delete = navigator.clone();
    let navigator_testing_room = navigator.clone();


    let show_movie_list_path = "/".to_string(); 
    let show_movie_by_id_path = "/show-movie-by-id".to_string();
    let update_genre_path = "/update-genre".to_string();
    let search_genre_path = "/search-genre".to_string();

    // function that returns true or false if the current route matches the route passed in
    fn active_route(route: String) -> String {
      let current_route = web_sys::window().unwrap().location().pathname().unwrap();
        if current_route == route {
            return "text-primary text-decoration-underline fw-bolder".to_string();
        } else {
            return "".to_string();
        }
    }


  html! {
    <>      
        <nav class="navbar navbar-expand-lg navbar-light bg-light" role="navigation" aria-label="main navigation">
        <div class="container-fluid">
          <a class="navbar-item" href="https://getbootstrap.com/">
            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Bootstrap_logo.svg/2560px-Bootstrap_logo.svg.png" width="100" height="100" style="object-fit: contain" />
          </a>
    
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarBasicExample" aria-controls="navbarBasicExample" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
    
            <div class="collapse navbar-collapse" id="navbarBasicExample">
                <ul class="navbar-nav me-auto fs-6">
                    <li class="nav-item ms-2">
                        <a class={format!("nav-link {}", active_route(show_movie_list_path))} href="" onclick={Callback::from(move|_| navigator_show_movie_list.clone().push(&Route::ShowMovieList))}>
                            <i class="fas fa-list me-2"></i>
                            {"Show Movie List"}      
                        </a>
                    </li>
    
                    <li class="nav-item">
                        <a class={format!("nav-link {}", active_route(show_movie_by_id_path))} href="" onclick={Callback::from(move|_| navigator_show_movie_by_id.clone().push(&Route::ShowMovieByID))}>
                            <i class="fas fa-dice-one me-2"></i>
                            {"Show Movie By ID"}
                        </a>
                    </li>
    
                    <li class="nav-item">
                        <a class={format!("nav-link {}", active_route(update_genre_path))} href="" onclick={Callback::from(move|_| navigator_update.clone().push(&Route::UpdateGenre))}>
                            <i class="fas fa-pen me-2"></i>
                            {"Update Genre"}
                        </a>
                    </li>
    
                    <li class="nav-item">
                        <a class={format!("nav-link {}", active_route(search_genre_path))} href="" onclick={Callback::from(move|_| navigator_search.clone().push(&Route::SearchGenre))}>
                            <i class="fas fa-search me-2"></i>
                            {"Search Genre"}
                        </a>
                    </li>
                </ul>
    
                <div class="navbar-nav">
                    <div class="nav-item">
                        <div class="d-flex">
                            <a class="btn btn-success me-2" href="" onclick={Callback::from(move|_| navigator_insert.clone().push(&Route::InsertGenre))}>
                                <i class="fas fa-plus-square me-2"></i>
                                {"Insert Genre"}
                            </a>
                            <a class="btn btn-danger me-2" href="" onclick={Callback::from(move|_| navigator_delete.clone().push(&Route::DeleteGenre))}>
                                <i class="fas fa-trash me-2"></i>
                                {"Delete Genre"}
                            </a>
                            <a class="btn btn-dark me-2" href="" onclick={Callback::from(move|_| navigator_testing_room.clone().push(&Route::TestingRoom))}>
                                <i class="fas fa-code me-2"></i>
                                {"Testing Room"}
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>    

    </>
  }
}