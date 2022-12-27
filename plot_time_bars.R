#
#	plot_time_bars.R
#
#	Benjamin C. Haller, 26 December 2022
#
#
sem <- function(x) sd(x)/sqrt(length(x))


# change to the SLiM-Benchmarks folder, wherever that lives
#setwd("~/Desktop/benchmarking/SLiM-Benchmarks")
setwd("~/Desktop/benchmarking/STUDIO 2022-12-26")

# find the names of all model files present
model_files <- list.files("./models/", pattern="*.slim")
model_names <- gsub("(.*)\\.slim", "\\1", model_files)

# intersect that list with the models we have single-thread timing data for
st_models <- list.files("./times_single/", pattern="*.txt", include.dirs=T)
st_names <- gsub("(.*)\\.txt", "\\1", st_models)
model_names <- intersect(model_names, st_names)

# exclude models that do not have a given prefix
model_names  <- model_names[grepl("^S_", model_names)]

# generate the model_files list for the models we will plot
model_files <- paste0(model_names, ".slim")

# find all parallel timing folders
parallel_folders <- list.files(".", pattern="times_parallel_*", include.dirs=T)
parallel_threads <- as.integer(gsub("times_parallel_(.*)", "\\1", parallel_folders))
#parallel_threads <- parallel_threads[parallel_threads <= 6]		# remove hyperthreaded runs
parallel_threads <- parallel_threads[order(parallel_threads)]
parallel_folders <- paste0("times_parallel_", parallel_threads)

# use 0 to represent times_original and times_single
timing_threads <- c(0, 0, parallel_threads)
timing_folders <- c("times_original", "times_single", parallel_folders)

# plot pre-configuration
colors <- c("#555555", "#AAAAAA", "#EEEEEE", heat.colors(length(parallel_folders) - 1, rev=T))
ltext <- c("SLiM 4.0.1", "single-threaded", "parallel, 1 thread", paste(parallel_threads[parallel_threads > 1], "threads"))

# h <- matrix(c(1,2,3,4,5,6,7,8,9,2,3,4,5,6,7,8,9,10), nrow=length(colors), byrow=F)

time_mean <- NULL
time_sem <- NULL

for (model_index in seq_along(model_files))
{
	model_file <- model_files[model_index]
	model_name <- model_names[model_index]
	
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
	
	time_mean <- cbind(time_mean, model_wall_means)
	time_sem <- cbind(time_sem, model_wall_sems)
}

# make the plot from the data in the filesystem
width <- 1.5 + 1.3 * length(model_files)
quartz(width=width, height=7)
par(mar=c(3.1, 3.1, 2, 2), tcl=-0.3, mgp=c(1.9, 0.4, 0), family="serif")
mids <- barplot(height=time_mean, names.arg=rep("", length(model_files)), xlab="", ylab="Runtime (seconds)", col=colors, beside=T, args.legend = list(x = "topleft"), xlim=c(-1, length(model_files) * (length(timing_folders) + 1)), xaxs="i")

#legend; not sure what to do with this
#barplot(height=time_mean, names.arg=model_names, col=colors, beside=T, legend=ltext, args.legend = list(x = "topleft"))

# add SEM bars
height_vec <- as.vector(time_mean)
sem_vec <- as.vector(time_sem)
mid_vec <- as.vector(mids)

for (i in seq_along(height_vec))
{
	sem <- sem_vec[i]
	mid <- mid_vec[i]
	h <- height_vec[i]
	
	if (sem > 0.001)
		arrows(x0=mid, x1=mid, y0=h-sem, y1=h+sem, length=0.02, angle=90, code=3, col="black", xpd=T)
}

# add bar group labels
group_mids <- colMeans(mids)

for (group in seq_along(model_names))
{
	y <- if (group %% 2 == 1) 0.2 else 1.5
	mtext(model_names[group], side=1, line=y, at=group_mids[group], cex=1.0)
}










