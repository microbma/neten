# Introduction

# Installation

You can install it from GitHub with $devtools$:

```
install_github("microbma/neten")
```

Or you can download the binary package for this package from GitHub repository:

(https://github.com/microbma/neten)[https://github.com/microbma/neten)

# Useage

The $Network_Enhancement$ command require to input a correlation matrix, either directed or undirected.

```
mat1 <- cor(matrix(rnorm(400),nrow = 20))
mat2 <- Network_Enhancement(mat1)
```

$mat2$ is the enhanced matrix. From this matrix we can infer a network with higher confidence.

![]("test.jpg")


