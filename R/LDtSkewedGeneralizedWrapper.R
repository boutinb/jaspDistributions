#
# Copyright (C) 2013-2022 University of Amsterdam
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# This is a generated file. Don't change it

LDtSkewedGeneralized <- function(
          data = NULL,
          version = "0.19",
          andersonDarling = FALSE,
          ciInterval = FALSE,
          ciIntervalInterval = 0.95,
          cramerVonMisses = FALSE,
          ecdf = FALSE,
          estCDF = FALSE,
          estPDF = FALSE,
          explanatoryText = FALSE,
          formulas = FALSE,
          highlightDensity = FALSE,
          highlightProbability = FALSE,
          highlightType = "minmax",
          histogram = FALSE,
          histogramBins = 30,
          kolmogorovSmirnov = FALSE,
          lambda = 0,
          lower_max = 0,
          max = 1,
          max_x = 3,
          methodMLE = FALSE,
          min = 0,
          min_x = -3,
          moments = FALSE,
          momentsUpTo = 2,
          mu = 0,
          newVariableName = "",
          outputEstimates = TRUE,
          outputSE = FALSE,
          p = 2,
          parsSupportMoments = FALSE,
          plotCDF = FALSE,
          plotHeight = 320,
          plotPDF = TRUE,
          plotQF = FALSE,
          plotWidth = 480,
          ppPlotCi = FALSE,
          ppPlotCiLevel = 0.95,
          ppplot = FALSE,
          q = 1,
          qqPlotCi = FALSE,
          qqPlotCiLevel = 0.95,
          qqplot = FALSE,
          sampleSize = 7,
          shapiroWilk = FALSE,
          sigma = 1,
          simulateNow = FALSE,
          summary = TRUE,
          upper_min = 0,
          variable = "") {

   defaultArgCalls <- formals(jaspDistributions::LDtSkewedGeneralized)
   defaultArgs <- lapply(defaultArgCalls, eval)
   options <- as.list(match.call())[-1L]
   options <- lapply(options, eval)
   defaults <- setdiff(names(defaultArgs), names(options))
   options[defaults] <- defaultArgs[defaults]
   options[["data"]] <- NULL
   options[["version"]] <- NULL

   optionsWithFormula <- c("variable")
   for (name in optionsWithFormula) {
      if ((name %in% optionsWithFormula) && inherits(options[[name]], "formula")) options[[name]] = jaspBase::jaspFormula(options[[name]], data)   }

   return(jaspBase::runWrappedAnalysis("jaspDistributions::LDtSkewedGeneralized", data, options, version))
}