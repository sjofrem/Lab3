#' Example graph for Dijkstra's algorithm
#'
#' A small directed, weighted graph used in examples of Dijkstra’s algorithm.
#'
#' @format data.frame
#' \describe{
#'   \item{v1}{Start node of the directed edge (numeric).}
#'   \item{v2}{End node of the directed edge (numeric).}
#'   \item{w}{Weight (numeric).}
#' }
#'
#' @references <https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm>
#' @examples
#' data(wiki_graph)
#' head(wiki_graph)
"wiki_graph"
