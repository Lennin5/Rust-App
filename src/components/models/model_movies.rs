use crate::graphql::{self};
use graphql_client::GraphQLQuery;

// Show movie data
#[derive(GraphQLQuery)]
#[graphql(
    schema_path = "schema.graphql",
    query_path = "query.graphql",
    response_derives = "Debug, Clone",
    normalization = "rust"
)]

pub struct ShowMovies;
impl graphql::Request for ShowMovies {}

// Show movie data by id
#[derive(GraphQLQuery)]
#[graphql(
    schema_path = "schema.graphql",
    query_path = "query.graphql",
    response_derives = "Debug, Clone",
    normalization = "rust"
)]
pub struct ShowMovieById;
impl graphql::Request for ShowMovieById {}

// Show movies data by genre
#[derive(GraphQLQuery)]
#[graphql(
    schema_path = "schema.graphql",
    query_path = "query.graphql",
    response_derives = "Debug, Clone",
    normalization = "rust"
)]
pub struct ShowMoviesByGenreMutation;
impl graphql::Request for ShowMoviesByGenreMutation {}

