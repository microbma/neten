Network_Enhancement <- function(W_in, order = 2, K = min(20, ceiling(Length(W_in)/10)), alpha = 0.9) {

        eps <- 2e-16
        Length <- function(mat) {
                return(max(dim(mat)))
        }

        force(K)
        W_in1 = W_in * ( 1 - diag(Length(W_in)))
        zeroindex <- which(colSums(abs(W_in)) > 0)
        W0 <- W_in[zeroindex, zeroindex]
        W <- NE_dn(W0, 'ave')
        W <- (W + t(W)) / 2

        DD <- colSums(abs(W0))

        if (length(unique(as.vector(W))) == 2) {
                P <- W
        } else {
                P <- dominateset(abs(W), min(K, Length(W) - 1)) * sign(W)
        }
        P <- P + (diag(Length(P)) + diag(rowSums(abs(P))))
        P <- TransitionFields(P)
        eig <- eigen(P)
        U <- eig$vectors
        d <- eig$values - eps
        d <- (1 - alpha) * d / (1 - alpha * d^order)
        D <- diag(d)
        W <- U %*% D %*% t(U)
        W <- W * (1 - diag(Length(W))) / (1 - diag(W))
        D <- diag(DD)
        W = D %*% W
        W[W < 0] <- 0
        W <- (W + t(W)) / 2
        W_out <- matrix(0, nrow = nrow(W_in), ncol = ncol(W_in))
        W_out[zeroindex, zeroindex] <- W
        return(W_out)
}
