## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(sim.BA)

## -----------------------------------------------------------------------------
parameters <- create_parameters(nbinary = 6,
                                ncontinuous = 1,
                                ncount = 1,
                                # file = "parameters.csv",
                                unmeasured_conf = "u1",
                                unmeasured_type = "binary")

# Note: uncomment `file` argument to automatically save file to supplied path

## -----------------------------------------------------------------------------
parameters <- read.csv(system.file("extdata", "parameters.csv",
                                   package = "sim.BA"))

parameters

## -----------------------------------------------------------------------------
sim <- simBA(parameters,
             iterations = 500,
             size = 1000,
             treatment_prevalence = .2,
             treatment_coeff = -.5,
             outcome_prevalence = .05,
             dist = "weibull",
             unmeasured_conf = "u1",
             n_proxies = 2,
             proxy_type = "binary",
             corr = c(0.5, 0.4), 
             adj = "matching", 
             adj_args = list(method = "nearest", caliper=0.2),
             estimand = "ATT",
             keep_data = FALSE,
             # cl = 4, #uncomment for speed on Mac
             verbose = FALSE)

sim

## ----fig.height=5, fig.width=5------------------------------------------------
summary(sim)

## ----fig.height=5, fig.width=5------------------------------------------------
plot(sim, type = "balance")

## ----fig.height=5, fig.width=5------------------------------------------------
plot(sim, type = "hr")

## ----fig.height=5, fig.width=5------------------------------------------------
plot(sim, type = "bias")

