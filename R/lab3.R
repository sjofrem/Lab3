#' Euclidean Algorithm for Greatest Common Divisor
#'
#' Computes the greatest common divisor (GCD) of two numbers
#' using the Euclidean algorithm.
#'
#' @param a A numeric scalar or integer.
#' @param b A numeric scalar or integer.
#'
#' @return An integer giving the greatest common divisor of `a` and `b`.
#' @export
#'
#' @examples
#' euclidean(123612, 13892347912) # [1] 4
#' euclidean(100, 1000) # [1] 100
#'
#' @references <https://en.wikipedia.org/wiki/Euclidean_algorithm>
#'
euclidean <- function(a, b){
  stopifnot(is.numeric(a))
  stopifnot(is.numeric(b))
  while (b != 0) {
    t <- b
    b <- a%%b
    a <- t
  }
  return(a)
}

#' Dijkstra's Algorithm for Shortest Paths
#'
#' Calculates the shortest path distances from a starting node to all other
#' nodes in a directed graph.
#'
#' @param graph A data.frame with three columns:
#'   \describe{
#'     \item{v1}{Start node of an edge (numeric).}
#'     \item{v2}{End node of an edge (numeric).}
#'     \item{w}{Weight of the edge (numeric).}
#'   }
#' @param init_node A numeric scalar giving the starting node.
#'
#' @return A numeric vector of shortest path distances from `init_node` to every node.
#' @export
#'
#' @examples
#' wiki_graph <- data.frame(
#'   v1=c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),
#'   v2=c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),
#'   w =c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9)
#' )
#' dijkstra(wiki_graph, 1) # [1] 0 7 9 20 20 11
#'
#' @references <https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm>
#'
dijkstra <- function(graph, init_node){
  stopifnot(is.data.frame(graph))
  need_cols <- c("v1","v2","w")
  stopifnot(all(need_cols %in% names(graph)))
  stopifnot(is.numeric(graph$w))
  stopifnot(is.numeric(init_node), length(init_node) == 1)

  V <- sort(unique(c(graph$v1, graph$v2)))
  stopifnot(init_node %in% V)

  dist <- setNames(rep(Inf, length(V)), V)
  prev <- setNames(rep(NA_integer_, length(V)), V)
  dist[as.character(init_node)] <- 0

  # Q = unvisited vertices
  Q <- as.character(V)

  while (length(Q) > 0) {
    # choose u with smallest tentative distance
    u <- Q[which.min(dist[Q])]
    Q <- setdiff(Q, u)

    # all outgoing edges (u -> v) with weights
    out_idx <- graph$v1 == as.integer(u)
    if (any(out_idx)) {
      vs <- as.character(graph$v2[out_idx])  # neighbor labels as characters
      ws <- graph$w[out_idx]                 # weights

      # only unvisited neighbors
      keep <- vs %in% Q
      vs <- vs[keep]
      ws <- ws[keep]

      # relax: for each neighbor v, alt = dist[u] + w(u,v)
      for (i in seq_along(vs)) {
        v <- vs[i]
        w_uv <- ws[i]
        alt <- dist[u] + w_uv
        if (alt < dist[v]) {
          dist[v] <- alt
          prev[v] <- as.integer(u)
        }
      }
    }
  }
  return(unname(dist[as.character(V)]))
}
