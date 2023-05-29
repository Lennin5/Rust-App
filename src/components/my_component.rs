use yew::prelude::*;
use crate::assets::utils::extern_c::{delete_genre_validations};

#[derive(Properties, PartialEq)]
pub struct Props {
    pub delete_genre_action: Callback<MouseEvent>,
    pub change_id: Callback<KeyboardEvent>,
}


#[function_component(MyComponent)]
pub fn my_component(props: &Props) -> Html {


  html! {
    <div class="container pb-5">
      <br />
      <h1 class="title">{"Delete Genre"}</h1>                    
      <br /> 
      
      <form>
          <div class="mb-3">
              <label class="form-label">{"ID"}</label>
              <input type="number" class="form-control" id="delete_genre_id" onkeyup={|_| delete_genre_validations()} onkeyup={&props.change_id} required={true} />
          </div>      
          <div class="mb-3">
            <button type="button" class="btn btn-danger me-2" id="delete_genre_btn" disabled={true} onclick={&props.delete_genre_action} >{"Delete"}</button>       
          </div>
      </form>         

        // <h1 class="title">{"Delete Genre"}</h1>
        // <div class="field">
        //     <label class="label">{"ID"}</label>
        //     <div class="control">
        //         <input class="input" type="number" placeholder="Genre ID" id="deleted_genre" onkeyup={&props.change_id} />
        //     </div>
        // </div>                    
        // <br />
        // <button class="button is-danger mr-2" onclick={&props.delete_genre_action} >{"Delete"}</button>        
    </div>
  }
}