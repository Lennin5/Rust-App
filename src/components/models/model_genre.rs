use crate::graphql::{self};
use graphql_client::GraphQLQuery;
use super::timestamp::Timestamptz; // This is neccesarly to use Timestamp type (For Insert genre data)

// Insert genre data
#[derive(GraphQLQuery)]
#[graphql(
    schema_path = "schema.graphql",
    query_path = "query.graphql",
    response_derives = "Debug, Clone",
    normalization = "rust"
)]
pub struct InsertGenreMutation;
impl graphql::Request for InsertGenreMutation {}

// Update genre data
#[derive(GraphQLQuery)]
#[graphql(
    schema_path = "schema.graphql",
    query_path = "query.graphql",
    response_derives = "Debug, Clone",
    normalization = "rust"
)]
pub struct UpdateGenreMutation;
impl graphql::Request for UpdateGenreMutation {}

// Delete genre data
#[derive(GraphQLQuery)]
#[graphql(
    schema_path = "schema.graphql",
    query_path = "query.graphql",
    response_derives = "Debug, Clone",
    normalization = "rust"
)]
pub struct DeleteGenreMutation;
impl graphql::Request for DeleteGenreMutation {}

// Search genre data
#[derive(GraphQLQuery)]
#[graphql(
    schema_path = "schema.graphql",
    query_path = "query.graphql",
    response_derives = "Debug, Clone",
    normalization = "rust"
)]
pub struct SearchGenreMutation;
impl graphql::Request for SearchGenreMutation {}