
source()
set.seed(123)
mat1 <- cor(matrix(rnorm(400),nrow = 20))
mat2 <- Network_Enhancement(mat1)
mat3 <- mat1
mat3[mat1<.3] <- 0
mat4 <- Network_Enhancement(mat3)
mat5 <- mat2
mat5[mat2<.1] <- 0

require(igraph)
net1 <- graph_from_adjacency_matrix(mat1,
                                    weighted = TRUE,
                                    mode = "undirect",
                                    diag = FALSE)
net2 <- graph_from_adjacency_matrix(mat2,
                                    weighted = TRUE,
                                    mode = "undirect",
                                    diag = FALSE)
net3 <- graph_from_adjacency_matrix(mat3,
                                    weighted = TRUE,
                                    mode = "undirect",diag = FALSE)
net4 <- graph_from_adjacency_matrix(mat4,
                                    weighted = TRUE,
                                    mode = "undirect",diag = FALSE)
net5 <- graph_from_adjacency_matrix(mat5,
                                    weighted = TRUE,
                                    mode = "undirect",diag = FALSE)

par(mfrow=c(3,2),mar=rep(0,4))
plot(net1,layout=layout.circle, edge.width = E(net1)$weight)
plot(net2,layout=layout.circle, edge.width = E(net2)$weight)
plot(net3,layout=layout.circle, edge.width = E(net3)$weight)
plot(net4,layout=layout.circle, edge.width = E(net4)$weight)
plot(net5,layout=layout.circle, edge.width = E(net5)$weight)

