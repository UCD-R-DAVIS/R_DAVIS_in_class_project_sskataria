set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4, 12, 22, 27), NA)
hw2
# vector without NAs, select no.s btwn 14 and 38--
prob1 <- hw2[hw2 >= 14 & hw2 <= 38 & !is.na(hw2)]
prob1
## multiply by 3--
times3 <- prob1 * 3
##Add 10--
plus10 <- times3 + 10
plus10
final <- plus10[seq(1, length(plus10), by = 2)]
final
