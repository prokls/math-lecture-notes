library(grid)

circleColor <- "black"
insideDotColor <- rgb(0, 1, 0)
outsideDotColor <- rgb(1, 0, 0, alpha=0.2)

toPolar <- function (pt) {
  list("r"=sqrt(pt[1]^2 + pt[2]^2), "phi"=atan2(pt[2], pt[1]))
}

phis <- c()
rs <- c()



plotDots <- function (n) {
  # procedural approach
  i = 1
  png(filename="pi-circle.png")
  plot.new()
  grid.circle(0.5, 0.5, r=0.4)
  repeat {
    newPoint <- runif(2, min=-1, max=1)
    polar <- toPolar(newPoint)
    if (polar$r < 1) {
      grid.circle(newPoint[1]*0.4 + 0.5, newPoint[2]*0.4+0.5, r=0.001, gp=gpar(col=insideDotColor))
      rs <- c(rs, polar$r)
      phis <- c(phis, polar$phi)
      i = i + 1
    } else {
      grid.circle(newPoint[1]*0.4 + 0.5, newPoint[2]*0.4+0.5, r=0.001, gp=gpar(col=outsideDotColor))
    }
    if (i >= n) {
      break
    }
  }
  dev.off()
  list("rs"=rs, "phis"=phis)
}

dots <- plotDots(5000)

# histogram for radius
Sys.sleep(1)
png(filename="hist-r.png")
hist(dots$rs)
dev.off()

# histogram for phi
dots <- plotDots(10^5)
Sys.sleep(1)
png(filename="hist-phi.png")
hist(dots$phis)
dev.off()
