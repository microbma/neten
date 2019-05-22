NE_dn <- function(w, type) {
        eps <- 2e-16
        Length <- function(mat) {
                return(max(dim(mat)))
        }

        w <- w * Length(w)
        D <- rowSums(abs(w)) + eps

        if (type == 'ave') {
                D <- 1 / D
                D <- diag(D)
                wn <- D %*% w
        } else if (type == 'gph') {
                D <- 1 / sqrt(D)
                D <- diag(D)
                wn <- D %*% w %*% D
        }
        return(wn)
}

