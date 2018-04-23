N <- 100000
eigenValues <- matrix(nrow=N, ncol=2)

for (i in 1:N) {
	rand <- runif(3, min=-1, max=1)
	m <- matrix(nrow=2, ncol=2)
	m[1,1] <- rand[1]
	m[1,2] <- rand[2]
	m[2,1] <- rand[2]
	m[2,2] <- rand[3]
	e <- eigen(m)
	e$values <- c(min(e$values), max(e$values))
	eigenValues[i,] <- e$values
}

print(eigenValues[,1])

hist(eigenValues[,1], col=rgb(0.8, 0, 0, alpha=0.3), xlab="eigenvalue", ylab="frequency", main="frequency of eigenvalues")
hist(eigenValues[,2], col=rgb(0, 0.8, 0, alpha=0.5), add=T)


# Wikipedia [Positive-definite matrix]
# "The following properties are equivalent to M being positive definite:
# All its eigenvalues are positive."

posdef <- length(eigenValues[eigenValues[,1] > 0,])
print(paste('Absolute # of positive-definite matrices:', posdef))
print(paste('Relative # of positive-definite matrices:', 100 * posdef / N, '%'))
