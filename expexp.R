pexpexp <- function(x, rate, shape){
    return ((1 - exp(-1*rate*x)) ^ shape)
}