#
#	plot_benchmarks.R
#
#	Benjamin C. Haller, 15 July 2020
#
#

sem <- function(x) sd(x)/sqrt(length(x))


# change to the SLiM-Benchmarks folder, wherever that lives
setwd("~/Desktop/SLiM-Benchmarks")

# find the names of all model files present
model_files <- list.files("./models/", pattern="*.slim")
model_names <- gsub("(.*)\\.slim", "\\1", model_files)

# intersect that list with the models we have single-thread timing data for
st_models <- list.files("./times_single/", pattern="*.txt", include.dirs=T)
st_names <- gsub("(.*)\\.txt", "\\1", st_models)
model_names <- intersect(model_names, st_names)

# generate the model_files list for the models we will plot
model_files <- paste0(model_names, ".slim")

# find all parallel timing folders
parallel_folders <- list.files(".", pattern="times_parallel_*", include.dirs=T)
parallel_threads <- as.integer(gsub("times_parallel_(.*)", "\\1", parallel_folders))
#parallel_threads <- parallel_threads[parallel_threads <= 6]		# remove hyperthreaded runs
parallel_threads <- parallel_threads[order(parallel_threads)]
parallel_folders <- paste0("times_parallel_", parallel_threads)

# use 0 to represent times_single
timing_threads <- c(0, parallel_threads)
timing_folders <- c("times_single", parallel_folders)

# plot pre-configuration
x_range <- range(parallel_threads)
speedup_range <- c(0, 10)
colors <- rainbow(length(model_files), end=0.80)
ltys <- rep(c(1,3,5), length.out=length(model_files))

# make the plot from the data in the filesystem
quartz(width=7, height=6)
par(mar=c(3.1, 3.1, 2, 2), tcl=-0.3, mgp=c(1.9, 0.4, 0), family="serif")
plot(x=x_range, y=speedup_range, type="n", xlab="Thread count", ylab="Speed relative to single-threaded", xaxt="n")

axis(1, at=timing_threads, labels=timing_threads)
abline(a=0, b=1, col="lightgray", lwd=2)
for (h in seq(1, 11, 2))
	abline(h=h, col="lightgray")

for (drawrep in 1:3)
{
	for (model_index in seq_along(model_files))
	{
		model_file <- model_files[model_index]
		model_name <- model_names[model_index]
		model_color <- colors[model_index]
		model_lty <- ltys[model_index]
		model_x <- parallel_threads + (model_index - (length(model_files) + 1) / 2) * 0.04
		#print(model_x)
		
		model_wall_means <- NULL
		model_wall_sems <- NULL
		
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
				
				model_wall_means <- c(model_wall_means, wall_mean)
				model_wall_sems <- c(model_wall_sems, wall_sem)
			}
			else
			{
				model_wall_means <- c(model_wall_means, NA)
				model_wall_sems <- c(model_wall_sems, NA)
			}
		}
		
		single_thread_wall_mean <- model_wall_means[1]
		parallel_wall_means <- model_wall_means[2:length(model_wall_means)]
		parallel_wall_sems <- model_wall_sems[2:length(model_wall_sems)]
		parallel_speedups <- single_thread_wall_mean / parallel_wall_means
		min_speedups <- single_thread_wall_mean / (parallel_wall_means - parallel_wall_sems)
		max_speedups <- single_thread_wall_mean / (parallel_wall_means + parallel_wall_sems)
		
		if (drawrep == 1) {
			#lines(x=model_x, y=parallel_speedups, col="black", lwd=3)
		} else if (drawrep == 2) {
			lines(x=model_x, y=parallel_speedups, col=model_color, lwd=1.5, lty=model_lty)
		} else if (drawrep == 3) {
			suppressWarnings(arrows(x0=model_x, y0=min_speedups, x1=model_x, y1=max_speedups, code=3, angle=90, length=0.02))
			points(x=model_x, y=parallel_speedups, pch=21, cex=0.9, bg=model_color, col="black")
		}
	}
}

legend("topleft", inset=c(0.005, 0.01), legend=model_names, col=colors, lwd=1.5, lty=c(1,3,5), cex=0.85, bg="white")
box()











