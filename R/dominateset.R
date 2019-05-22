dominateset <- function(aff_matrix, NR_OF_KNN) {
        eps <- 2e-16
        Length <- function(mat) {
                return(max(dim(mat)))
        }

        A <- t(apply(aff_matrix, MARGIN = 1, function(x) sort(x, decreasing = TRUE)))
        B <- t(apply(aff_matrix, MARGIN = 1, function(x) order(x, decreasing = TRUE)))

        res <- A[, 1:NR_OF_KNN]
        inds <- matrix(1:Length(aff_matrix), nrow = Length(aff_matrix), ncol = NR_OF_KNN )
        loc <- B[, 1:NR_OF_KNN]
        PNN_matrix1 = matrix(0, ncol = ncol(aff_matrix), nrow = nrow(aff_matrix))
        idx_ = (as.vector(loc) - 1) * nrow(aff_matrix) + as.vector(inds)
        PNN_matrix1[idx_] = as.vector(res)
        PNN_matrix = (PNN_matrix1 + t(PNN_matrix1)) / 2

        return(PNN_matrix)
}

