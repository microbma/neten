TransitionFields <- function(W) {
        eps <- 2e-16
        Length <- function(mat) {
                return(max(dim(mat)))
        }

        zeroindex <- which(rowSums(W) == 0)
        W <-  W * Length(W)
        W <- NE_dn(W, 'ave')
        W <- apply(W, 2, function(x) x / sqrt(sum(abs(x)) + eps))
        W <- tcrossprod(W)
        Wnew <- W
        Wnew[zeroindex, ] <- 0
        Wnew[, zeroindex] <- 0
        return(Wnew)
}
