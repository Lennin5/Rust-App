use yew::prelude::*;
use crate::assets::utils::extern_c::clear_deleted_genre_input;

use crate::assets::utils::extern_c::{
  say_hello, 
};

#[function_component(TestingRoom)]
pub fn testing_room() -> Html {

  html! {
    <>        
      <div class="container pb-5">
      <br />
      <h1 class="title">{"Testing Room"}</h1>                    
      <br /> 

            <div class="container">
                <button class="btn btn-warning me-2" onclick={|_| clear_deleted_genre_input(3)}>{ "Call Javascript PURE" }</button>            
                <button class="btn btn-warning me-2" onclick={|_| say_hello()}>{ "Call Javascript" }</button>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                  {"Modal"}
                </button>
                
                
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">{"Modal title"}</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        {"..."}
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">{"Close"}</button>
                        <button type="button" class="btn btn-primary">{"Save changes"}</button>
                      </div>
                    </div>
                  </div>
                </div>                 
            </div>    
        </div>
    </>
  }
}