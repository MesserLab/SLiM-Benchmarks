#
#	plot_one_benchmark.R
#
#	Benjamin C. Haller, 4 November 2022
#
#

sem <- function(x) sd(x)/sqrt(length(x))

# change to the SLiM-Benchmarks folder, wherever that lives
#setwd("~/Desktop/SLiM-Benchmarks")
setwd("~/Desktop/SLiM-Benchmarks-22.5")

# we want to plot a single model
model_name <- "R_recipe15_4"

# find all parallel timing folders
parallel_folders <- list.files(".", pattern="times_parallel_*", include.dirs=T)
parallel_threads <- as.integer(gsub("times_parallel_(.*)", "\\1", parallel_folders))
parallel_threads <- parallel_threads[order(parallel_threads)]
parallel_folders <- paste0("times_parallel_", parallel_threads)

# use 0 to represent times_single
timing_threads <- c(0, parallel_threads)
timing_folders <- c("times_single", parallel_folders)

# load all the data for the run we're interested in
df <- NULL

for (folder_index in seq_along(timing_folders))
{
	timing_thread <- timing_threads[folder_index]
	timing_folder <- timing_folders[folder_index]
	
	timing_file <- paste0(timing_folder, "/", model_name, ".txt")
	if (file.exists(timing_file))
	{
		timing_data <- read.csv(timing_file)
		
		wall_times <- timing_data$wall_secs
		wall_mean <- mean(wall_times)
		wall_sem <- sem(wall_times)
		
		cpu_times <- timing_data$cpu_secs
		cpu_mean <- mean(cpu_times)
		cpu_sem <- sem(cpu_times)
		
		df <- rbind(df, data.frame(threads=timing_thread, wall_mean=wall_mean, wall_sem=wall_sem, cpu_mean=cpu_mean, cpu_sem=cpu_sem))
	}
}

df_single <- df[df$threads == 0, ]
df_multi <- df[df$threads > 0, ]
threads <- df_multi$threads
x_range <- range(threads)


# plot mean CPU times
y_mean <- df_multi$cpu_mean
y_min <- y_mean - df_multi$cpu_sem
y_max <- y_mean + df_multi$cpu_sem

quartz(width=3, height=3)
par(mar=c(3.1, 3.1, 0.5, 0.5), tcl=-0.3, mgp=c(1.9, 0.4, 0), family="serif")
plot(x=x_range, y=range(c(0, y_mean)), type="n", xlab="Thread count", ylab="CPU time elapsed (secs)", xaxt="n")
axis(1, at=threads, labels=threads)

lines(x=threads, y=y_mean, col="red", lwd=3)
suppressWarnings(arrows(x0=threads, y0=y_min, x1=threads, y1=y_max, code=3, angle=90, length=0.02))
points(x=threads, y=y_mean, pch=21, cex=0.9, bg="red", col="black")


# plot mean wall clock times
y_mean <- df_multi$wall_mean
y_min <- y_mean - df_multi$wall_sem
y_max <- y_mean + df_multi$wall_sem

single_wall <- df_single$wall_mean
proportion <- 0.36		# proportion of single-threaded runtime that parallelizes, estimated from profiling
amdahl_speedup <- 1 / ((1 - proportion) + proportion / threads)
amdahl_wall <- single_wall / amdahl_speedup
amdahl_limit_speedup <- 1 / (1 - proportion)
amdahl_limit_wall <- single_wall / amdahl_limit_speedup

quartz(width=3, height=3)
par(mar=c(3.1, 3.1, 0.5, 0.5), tcl=-0.3, mgp=c(1.9, 0.4, 0), family="serif")
plot(x=x_range, y=range(c(0, y_mean)), type="n", xlab="Thread count", ylab="Wall clock time elapsed (secs)", xaxt="n")
axis(1, at=threads, labels=threads)

abline(h=amdahl_limit_wall, col="cornflowerblue", lwd=2)

lines(x=threads, y=y_mean, col="red", lwd=3)

lines(x=threads, y=amdahl_wall, col="black", lwd=1.5)

suppressWarnings(arrows(x0=threads, y0=y_min, x1=threads, y1=y_max, code=3, angle=90, length=0.02))
points(x=threads, y=y_mean, pch=21, cex=0.9, bg="red", col="black")


# plot speedup relative to single-threaded
# we restrict the x range here, otherwise the plot is unmanageable for this data
time_mean <- df_multi$wall_mean
time_min <- time_mean - df_multi$wall_sem
time_max <- time_mean + df_multi$wall_sem
single_wall <- df_single$wall_mean

y_mean <- single_wall / time_mean
y_min <- single_wall / time_max
y_max <- single_wall / time_min

proportion <- 0.36		# proportion of single-threaded runtime that parallelizes, estimated from profiling
amdahl_speedup <- 1 / ((1 - proportion) + proportion / threads)
amdahl_limit_speedup <- 1 / (1 - proportion)

quartz(width=8, height=2)
par(mar=c(3.1, 3.1, 0.5, 0.5), tcl=-0.3, mgp=c(1.9, 0.4, 0), family="serif")
plot(x=c(1,20), y=range(c(1, 2.0, y_mean)), type="n", xlab="Thread count", ylab="Speedup", xaxt="n", yaxt="n")
axis(1, at=threads, labels=threads)
axis(2, at=c(1, 1.5, 2), labels=c("1", "1.5", "2"))

abline(a=0, b=1, col="lightgray", lwd=2)
abline(h=amdahl_limit_speedup, col="cornflowerblue", lwd=2)

lines(x=threads, y=y_mean, col="red", lwd=3)

lines(x=threads, y=amdahl_speedup, col="black", lwd=1.5)

suppressWarnings(arrows(x0=threads, y0=y_min, x1=threads, y1=y_max, code=3, angle=90, length=0.02))
points(x=threads, y=y_mean, pch=21, cex=0.9, bg="red", col="black")




















