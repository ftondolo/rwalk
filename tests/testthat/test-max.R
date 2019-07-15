context("test-max")
test_that("Finds max between 2 & 4",{
        numbers <- c(2,4)
        expect_equal(max(numbers), 4)
})

test_that("Finds max between 2s and 10s of sweep",{
        fil <- "./../testdata/181015_10mg-kgAMPH_50mM_Nimo_2_outlier_scrub.csv"
        sample_rate <- 100
        
        dat <- read_experiment_csv(fil, sr = sample_rate)
        twosec <- dat[[2]][[20]]
        tensec <- dat[[2]][[100]]
        values <- c(twosec, tensec)
        expect_equal(max(values), 97131.2)
})

test_that("Finds first peak max",{
        fil <- "./../testdata/181015_10mg-kgAMPH_50mM_Nimo_2_outlier_scrub.csv"
        sample_rate <- 100
        dat <- read_experiment_csv(fil, sr = sample_rate)
        highest <-dat[[2]][[100]]
        for (i in 100:1200){
           if (highest < dat[[2]][[i]])   {
                   highest <- dat[[2]][[i]]
           }  
        }
        expect_equal(highest, 100781)
        #expect_equal(dat[[2]][[max_peak(dat)]], 96793.8)
})
