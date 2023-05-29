use yew::prelude::*;
// use yew_router::prelude::*;
// use crate::components::router::my_router::Route;

#[function_component(Footer)]
pub fn footer() -> Html {
    // let navigator = use_navigator().unwrap();
    // let navigator_testing_room = navigator.clone();
    // let navigator_show_movie_list = navigator.clone();

    // let current_route = web_sys::window().unwrap().location().pathname().unwrap();
    
    html! {
        <>
        <p>{"Footer"}</p>

        // {
        //     if current_route.clone().to_string() == "/testing-room" {
        //         html! {
        //             <footer class="container">
        //                 <a class="btn btn-dark btn-sm mt-10" href="" onclick={Callback::from(move|_| navigator_show_movie_list.clone().push(&Route::ShowMovieList))}>
        //                     <i class="fas fa-home me-1"></i>
        //                     {"Home"}
        //                 </a>            
        //             </footer>                          
        //         }
        //     } else {
        //         html! {
        //              <footer class="container">
        //                 <a class="btn btn-dark btn-sm mt-10" href="" onclick={Callback::from(move|_| navigator_testing_room.clone().push(&Route::TestingRoom))}>
        //                     <i class="fas fa-code me-1"></i>
        //                     {"Testing Room..."}
        //                 </a>            
        //             </footer>   
        //         }
        //     }
        // }
        </>
    }
}
