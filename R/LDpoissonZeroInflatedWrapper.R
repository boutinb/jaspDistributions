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

LDpoissonZeroInflated <- function(
          data = NULL,
          version = "0.19",
          chiSquare = FALSE,
          ciInterval = FALSE,
          ciIntervalInterval = 0.95,
          ecdf = FALSE,
          estCDF = FALSE,
          estPMF = FALSE,
          explanatoryText = FALSE,
          formulas = FALSE,
          highlightDensity = FALSE,
          highlightProbability = FALSE,
          histogram = FALSE,
          histogramBins = 30,
          lambda = 3,
          max = 5,
          max_x = 5,
          methodMLE = FALSE,
          min = 0,
          min_x = 0,
          moments = FALSE,
          momentsUpTo = 2,
          newVariableName = "",
          outputEstimates = TRUE,
          outputSE = FALSE,
          parsSupportMoments = FALSE,
          plotCMF = FALSE,
          plotHeight = 320,
          plotPMF = TRUE,
          plotWidth = 480,
          ppPlotCi = FALSE,
          ppPlotCiLevel = 0.95,
          ppplot = FALSE,
          prob = 0.25,
          qqPlotCi = FALSE,
          qqPlotCiLevel = 0.95,
          qqplot = FALSE,
          sampleSize = 7,
          simulateNow = FALSE,
          summary = TRUE,
          variable = "") {

   defaultArgCalls <- formals(jaspDistributions::LDpoissonZeroInflated)
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

   return(jaspBase::runWrappedAnalysis("jaspDistributions::LDpoissonZeroInflated", data, options, version))
}