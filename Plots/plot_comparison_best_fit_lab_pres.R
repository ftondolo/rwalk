# Random Walk.
# Build CV model and plot it.
# Plot data from file.
# Report fit in terms of r-squared.

library(tidyverse)

fil <- "./input/181015_10mg-kgAMPH_50mM Nimo_2_outlier_scrub.csv"
sample_rate <- 100

dat <- read_experiment_csv(fil, sr = sample_rate)
dat_list <- split_stims(dat)

plot(dat$time_sec, dat$electrode, type = "l")
lapply(dat_list, function(x) {plot(x$time_sec, x$electrode, type = "l")})


# Find the best fit for one stimulus.
vmax_min <- 1.1
vmax_max <- 1.2
vmax_by <- .1
km_min <- 6.5
km_max <- 6.5
km_by <- 0
release_min <- 3.1
release_max <- 3.2
release_by <- .1

pulses <- 30
pulse_freq <- 50
bin_size <- 2.0
electrode_distance <- 1000
dead_space_distance <- 4
diffusion_coefficient <- 2.7 * 10^-6
convert_current = TRUE
calibration_current = 7500.0
calibration_concentration = 5.0

arg_df <- create_arg_df(vmax_min, vmax_max, vmax_by, km_min, 
                        km_max, km_by, 
                        pulses, pulse_freq,
                        release_min, release_max, release_by, bin_size, 
                        electrode_distance, dead_space_distance, diffusion_coefficient, 
                        convert_current, calibration_current, calibration_concentration)

arg_df

fit <- calc_fit_multi(dat_list[[1]], arg_df) 

fit

# Plot the best fit
compare_pulse_args_df(dat_list[[1]], paste(fil, "#1"), get_best_args(fit))

# Long Demo
vmax_min <- 1.0
vmax_max <- 1.5
vmax_by <- .1
km_min <- 6.5
km_max <- 6.5
km_by <- 0
release_min <- 2.5
release_max <- 3.5
release_by <- .1

pulses <- 30
pulse_freq <- 50
bin_size <- 2.0
electrode_distance <- 1000
dead_space_distance <- 4
diffusion_coefficient <- 2.7 * 10^-6
convert_current = TRUE
calibration_current = 7500.0
calibration_concentration = 5.0

arg_df <- create_arg_df(vmax_min, vmax_max, vmax_by, km_min, 
                        km_max, km_by, 
                        pulses, pulse_freq,
                        release_min, release_max, release_by, bin_size, 
                        electrode_distance, dead_space_distance, diffusion_coefficient, 
                        convert_current, calibration_current, calibration_concentration)

arg_df

print(paste("START -->", Sys.time()))
# "START --> 2019-03-28 13:14:15"

fit_long <- calc_fit_multi(dat_list[[1]], arg_df) 

fit_long

print(paste("END -->", Sys.time()))
# "END --> 2019-03-28 13:26:21"

# DURATION: 12 minutes.

# Plot the best fit
compare_pulse_args_df(dat_list[[1]], paste(fil, "#1"), get_best_args(fit_long))

