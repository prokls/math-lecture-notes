N <- 10000

ts1 <- 1:N
ts2 <- 1:N

experiment <- function () {
	t <- 0
	repeat {
		outcome <- sample(2, 1, prob=c(1/4, 3/4))
		if (outcome == 1) {
			break
		} else {
			t <- t + 1
		}
	}
	t
}


for (i in 1:N) {
	ts1[i] <- experiment()
	ts2[i] <- ts1[i] + experiment()
}

# exercise (i)
print(summary(ts1))
barplot(table(ts1)/N)
# exercise (ii)
barplot(table(ts2)/N)