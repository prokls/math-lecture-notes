# introduce determinism
set.seed(123)

# global settings
sampleSize <- 100

rollingDiceSum <- function (n=10^3) {
	rowSums(replicate(2, sample(6, n, replace=T)))
}
#plotIt <- function (what) {
#    # barplot(table(factor(what, level=1:12)), xlab="outcome", ylab="abs. probability")
#    barplot(table(what)/sampleSize, col=rgb(0, 0, 0.8, alpha=0.3), xlab="outcome", ylab="rel. probability")
#}

experimentResults <- rollingDiceSum(sampleSize)
barplot(table(experimentResults)/sampleSize, col=rgb(0, 0, 0.8, alpha=0.3), xlab="outcome", ylab="rel. probability")


exactProbabilities <- c(1:6, 5:1)/36 # via Skriptum, Beispiel in section 2.3
barplot(exactProbabilities, col=rgb(0.8, 0.8, 0, alpha=0.3), add=T, xaxt="n", yaxt="n")

# w <- factor(w, level=c(1,2,3,4,5,6,7))

