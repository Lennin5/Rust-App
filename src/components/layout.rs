use yew::prelude::*;
use crate::components::header::Header;
use crate::components::footer::Footer;

#[derive(Clone, Properties, PartialEq)]
pub struct Props {
    pub children: Children,
}

#[function_component(Layout)]
pub fn layout(props: &Props) -> Html {
    html! {
        <>
            <Header />
                { props.children.clone() }
            <Footer />
        </>
    }
}