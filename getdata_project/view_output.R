view_output <- function() {
        data <- read.table('./tidy_data_set.txt', header=T)
        View(data)
}