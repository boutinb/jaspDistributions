import QtQuick
import QtQuick.Layouts
import JASP
import JASP.Controls
import "./common" as Common

Form
{
	id: form
	columns: 1
	info: qsTr("Specify a set of distributions, estimate their parameters, and compare their fit to data.")

	property var allDistributionParameters: {
		"Normal": {
			parametersChoice : [
				{ label: qsTr("μ (mean), σ (std.deviation)"),	value: "sigma"	},
				{ label: qsTr("μ (mean), σ² (variance)"),		value: "sigma2"	},
				{ label: qsTr("μ (mean), τ (precision)"),		value: "tau"	}
			],
			parametersSettings: {
				"sigma": [
					{ name: "normalMu",					label: qsTr("μ (mean)"),			min: -Infinity,		defaultValue: 0},
					{ name: "normalSigma",				label: qsTr("σ (std. deviation)"),	min: 0,				defaultValue: 1}
				],
				"sigma2": [
					{ name: "normalMu",					label: qsTr("μ (mean)"),			min: -Infinity,		defaultValue: 0},
					{ name: "normalSigma2",				label: qsTr("σ² (variance)"),		min: 0,				defaultValue: 1}
				],
				"tau": [
					{ name: "normalMu",					label: qsTr("μ (mean)"),			min: -Infinity,		defaultValue: 0},
					{ name: "normalTau",				label: qsTr("τ (precision)"),		min: 0,				defaultValue: 1}
				]
			}
		},
		"StandardNormal": {},
		"StandardT": {
			parametersSettings: {
				"default": [
					{ name: "standardTNu",				label: qsTr("ν (df)"),				min: 0,				defaultValue: 5}
				]
			}
		},
		"NoncentralT": {
			parametersSettings: {
				"default": [
					{ name: "noncentralTNu",			label: qsTr("ν (df)"),				min: 0,				defaultValue: 5},
					{ name: "noncentralTKappa",			label: qsTr("κ (noncentrality)"),	min: -Infinity,		defaultValue: 0}
				]
			}
		},
		"NoncentralStudentT": {
			parametersSettings: {
				"default": [
					{ name: "noncentralStudentTNu",		label: qsTr("ν (df)"),				min: 0,				defaultValue: 5},
					{ name: "noncentralStudentTKappa",	label: qsTr("κ (noncentrality)"),	min: -Infinity,		defaultValue: 0},
					{ name: "noncentralStudentTMu",		label: qsTr("μ (location)"),		min: -Infinity,		defaultValue: 0},
					{ name: "noncentralStudentTSigma",	label: qsTr("σ (scale)"),			min: 0,				defaultValue: 1}
				]
			}
		},
		"Cauchy": {
			parametersSettings: {
				"default": [
					{ name: "cauchyMu",					label: qsTr("μ (location)"),		min: -Infinity,		defaultValue: 0},
					{ name: "cauchySigma",				label: qsTr("σ (scale)"),			min: 0,				defaultValue: 1},
				]
			}
		},

		"Gumbel": {
			parametersSettings: {
				"default": [
					{ name: "gumbelMu",					label: qsTr("μ (location)"),		min: -Infinity,		defaultValue: 0},
					{ name: "gumbelBeta",				label: qsTr("β (scale)"),			min: 0,				defaultValue: 1},
				]
			}
		},
		"Exponential": {
			parametersChoice : [
				{ label: qsTr("λ (rate)"), 	value: "lambda"	},
				{ label: qsTr("β (scale)"),	value: "beta" 	}
			],
			parametersSettings:  {
				"lambda": [
					{ name: "exponentialLambda",		label: qsTr("λ (rate)"),			min: 0,				defaultValue: 1}
				],
				"beta": [
					{ name: "exponentialBeta",			label: qsTr("β (scale)"),			min: 0,				defaultValue: 1}
				]
			}
		}
	}

/*	property var parametersValues2: {
		// Multi-parametrization distributions
		if (distribution.currentValue === "Normal")
			return [
				{ label: qsTr("μ (mean), σ (std.deviation)"),	value: "sigma"	},
				{ label: qsTr("μ (mean), σ² (variance)"),		value: "sigma2"	},
				{ label: qsTr("μ (mean), τ (precision)"),		value: "tau"	}
			]
		if (distribution.currentValue === "Exponential")
			return [
				{ label: qsTr("λ (rate)"), 	value: "lambda"	},
				{ label: qsTr("β (scale)"),	value: "beta" 	}
			]
		if (distribution.currentValue === "Gamma")
			return [
				{ label: qsTr("α (shape), θ (scale)"),	value: "theta"	},
				{ label: qsTr("α (shape), λ (rate)"),	value: "lambda"	},
				{ label: qsTr("α (shape), μ (mean)"),	value: "mu"		}
			]
		if (distribution.currentValue === "InverseGamma")
			return [
				{ label: qsTr("α (shape), θ (scale)"),	value: "theta"	},
				{ label: qsTr("α (shape), λ (rate)"),	value: "lambda"	},
				{ label: qsTr("α (shape), μ (mean)"),	value: "mu"		}
			]
		if (distribution.currentValue === "LogLogistic")
			return [
				{ label: qsTr("μ (log location), σ (log scale)"),	value: "mu"	},
				{ label: qsTr("α (scale), β (shape)"),				value: "alpha"	}
			]
		if (distribution.currentValue === "Wald")
			return [
				{ label: qsTr("μ (mean), λ (shape)"),					value: "mu"		},
				{ label: qsTr("ν (drift), α (threshold), σ (noise)"),	value: "nu"	}
			]
		if (distribution.currentValue === "ShiftedExponential")
			return [
				{ label: qsTr("λ (rate), shift"),	value: "lambda"	},
				{ label: qsTr("β (scale), shift"),	value: "beta"	}
			]
		if (distribution.currentValue === "ShiftedGamma")
			return [
				{ label: qsTr("α (shape), θ (scale), shift"),	value: "theta"	},
				{ label: qsTr("α (shape), λ (rate), shift"),	value: "lambda"	},
				{ label: qsTr("α (shape), μ (mean), shift"),	value: "mu"		}
			]
		if (distribution.currentValue === "ShiftedInverseGamma")
			return [
				{ label: qsTr("α (shape), θ (scale), shift"),	value: "theta"	},
				{ label: qsTr("α (shape), λ (rate), shift"),	value: "lambda"	},
				{ label: qsTr("α (shape), μ (mean), shift"),	value: "mu"		}
			]
		if (distribution.currentValue === "ShiftedLogLogistic")
			return [
				{ label: qsTr("μ (log location), σ (log scale), shift"),	value: "mu"	},
				{ label: qsTr("α (scale), β (shape), shift"),				value: "alpha"	}
			]
		if (distribution.currentValue === "ShiftedWald")
			return [
				{ label: qsTr("μ (mean), λ (shape), shift"),					value: "mu"		},
				{ label: qsTr("ν (drift), α (threshold), σ (noise), shift"),	value: "nu"	}
			]
		// Single-parametrization distributions
		return [{ label: qsTr("default"), value: "default" }]
	} */

	VariablesForm
	{
		preferredHeight: jaspTheme.smallDefaultVariablesFormHeight
		infoLabel: qsTr("Select data for distribution comparison.")
		visible: true
		AvailableVariablesList { name: "allVariables" }
		AssignedVariablesList
		{
			name: "variable"; label: qsTr("Variable");
			allowedColumns: "scale"
			singleVariable: true
		}
	}

	ComponentsList
	{
		name:				"distributions"
		title:				qsTr("Specify distributions")
		info:				qsTr("Specify distributions to be compared...")
		minimumItems:		1
		rowComponent:
			Column
			{
				Row
				{
					id: rowDistribution
					spacing: 5 * jaspTheme.uiScale

					DropDown
					{
						id: distribution
						name: "distribution"
						addEmptyValue: true
						placeholderText: qsTr("<Select a distribution>")
						values: [
							// Unbounded
							{ label: qsTr("Normal"),						value: "Normal"						},
							{ label: qsTr("Standard normal"),				value: "StandardNormal"				},
							{ label: qsTr("Standard t"),					value: "StandardT"					},
							{ label: qsTr("Student t"),						value: "StudentT"					},
							{ label: qsTr("Noncentral t"),					value: "NoncentralT"				},
							{ label: qsTr("Noncentral Student t"),			value: "NoncentralStudentT"			},
							{ label: qsTr("Cauchy"),						value: "Cauchy"						},
							{ label: qsTr("Gumbel"),						value: "Gumbel"						},
							{ label: qsTr("Laplace"),						value: "Laplace"					},
							{ label: qsTr("Logistic"),						value: "Logistic"					},
							{ label: qsTr("Skewed generalized t"),			value: "SkewedGeneralizedT"			},
							{ label: qsTr("Symmetric generalized normal"),	value: "SymmetricGeneralizedNormal"	},
							{ label: qsTr("Skew normal"),					value: "SkewNormal"					},
							{ label: qsTr("Skew Cauchy"),					value: "SkewCauchy"					},
							{ label: qsTr("Skew t"),						value: "SkewT"						},
							// Bounded — fixed support
							{ label: qsTr("Beta"),							value: "Beta"						},
							{ label: qsTr("Beta prime"),					value: "BetaPrime"					},
							{ label: qsTr("F"),								value: "CentralF"					},
							{ label: qsTr("Noncentral F"),					value: "NoncentralF"				},
							{ label: qsTr("Chi-squared"),					value: "ChiSquared"					},
							{ label: qsTr("Noncentral chi-squared"),		value: "NoncentralChiSquared"		},
							{ label: qsTr("Exponential"),					value: "Exponential"				},
							{ label: qsTr("Gamma"),							value: "Gamma"						},
							{ label: qsTr("Inverse gamma"),					value: "InverseGamma"				},
							{ label: qsTr("Gompertz"),						value: "Gompertz"					},
							{ label: qsTr("Log-logistic"),					value: "LogLogistic"				},
							{ label: qsTr("Log-normal"),					value: "LogNormal"					},
							{ label: qsTr("Wald"),							value: "Wald"						},
							{ label: qsTr("Weibull"),						value: "Weibull"					},
							// Bounded — dynamic support
							{ label: qsTr("Amoroso"),						value: "Amoroso"					},
							{ label: qsTr("Stretched beta"),				value: "StretchedBeta"				},
							{ label: qsTr("Fréchet"),						value: "Frechet"					},
							{ label: qsTr("Pareto"),						value: "Pareto"						},
							{ label: qsTr("Triangular"),					value: "Triangular"					},
							{ label: qsTr("Uniform"),						value: "Uniform"					},
							// Shifted
							{ label: qsTr("Shifted Exponential"),			value: "ShiftedExponential"			},
							{ label: qsTr("Shifted Log-normal"),			value: "ShiftedLogNormal"			},
							{ label: qsTr("Shifted Gamma"),					value: "ShiftedGamma"				},
							{ label: qsTr("Shifted Inverse gamma"),			value: "ShiftedInverseGamma"		},
							{ label: qsTr("Shifted Log-logistic"),			value: "ShiftedLogLogistic"			},
							{ label: qsTr("Shifted Wald"),					value: "ShiftedWald"				},
							{ label: qsTr("Shifted Weibull"),				value: "ShiftedWeibull"				}
						]
					}
					CheckBox
					{
						id: settings
						name: "settings"
						label: qsTr("Show parameter settings")
						checked: false
						visible: !["", "StandardNormal"].includes(distribution.currentValue)
					}
				}
				Column
				{
					id: distributionParametersId
					spacing: 5
					leftPadding: 10
					visible: settings.checked

					property var distributionParameters: distribution.currentValue ? allDistributionParameters[distribution.currentValue] : {}

					DropDown
					{
						id: parameterChoice
						visible: parameters.length > 1
						name: "parameters"
						label: qsTr("Parameters")
						values: parameters
						property var parameters: distributionParametersId.distributionParameters.hasOwnProperty("parametersChoice") ? distributionParametersId.distributionParameters["parametersChoice"] : []
					}

					Group
					{
						id: parametersSettingsId
						rowSpacing: 0
						columns: 3
						property var parametersSettingsAll: distributionParametersId.distributionParameters.hasOwnProperty("parametersSettings") ? distributionParametersId.distributionParameters["parametersSettings"] : {}
						property var parametersSettings: parametersSettingsAll.hasOwnProperty(parameterChoice.currentValue) ? parametersSettingsAll[parameterChoice.currentValue] : (parametersSettingsAll.hasOwnProperty("default") ? parametersSettingsAll["default"] : [])

						property var parametersSettings1: parametersSettings.length > 0 ? parametersSettings[0] : {visible: false, label: "", min: 0, defaultValue: 0, name: "name1", fixedName: "fixedName1" }
						property var parametersSettings2: parametersSettings.length > 1 ? parametersSettings[1] : {visible: false, label: "", min: 0, defaultValue: 0, name: "name2", fixedName: "fixedName2"  }
						property var parametersSettings3: parametersSettings.length > 2 ? parametersSettings[2] : {visible: false, label: "", min: 0, defaultValue: 0, name: "name3", fixedName: "fixedName3"  }
						property var parametersSettings4: parametersSettings.length > 3 ? parametersSettings[3] : {visible: false, label: "", min: 0, defaultValue: 0, name: "name4", fixedName: "fixedName4"  }
						property var parametersSettings5: parametersSettings.length > 4 ? parametersSettings[4] : {visible: false, label: "", min: 0, defaultValue: 0, name: "name5", fixedName: "fixedName5"  }

						Label {			visible: parametersSettingsId.parametersSettings.length > 0;	text: parametersSettingsId.parametersSettings1.label }
						DoubleField	{	visible: parametersSettingsId.parametersSettings.length > 0;	name: "parameter1";		min: parametersSettingsId.parametersSettings1.min;	defaultValue: parametersSettingsId.parametersSettings1.defaultValue }
						CheckBox	{	visible: parametersSettingsId.parametersSettings.length > 0;	name: "parameterFixed1";	label: qsTr("Fixed") }

						Label {			visible: parametersSettingsId.parametersSettings.length > 1;	text: parametersSettingsId.parametersSettings2.label }
						DoubleField	{	visible: parametersSettingsId.parametersSettings.length > 1;	name: "parameter2";		min: parametersSettingsId.parametersSettings2.min;	defaultValue: parametersSettingsId.parametersSettings2.defaultValue }
						CheckBox	{	visible: parametersSettingsId.parametersSettings.length > 1;	name: "parameterFixed2";	label: qsTr("Fixed") }

						Label {			visible: parametersSettingsId.parametersSettings.length > 2;	text: parametersSettingsId.parametersSettings3.label }
						DoubleField	{	visible: parametersSettingsId.parametersSettings.length > 2;	name: "parameter3";		min: parametersSettingsId.parametersSettings3.min;	defaultValue: parametersSettingsId.parametersSettings3.defaultValue }
						CheckBox	{	visible: parametersSettingsId.parametersSettings.length > 2;	name: "parameterFixed3";	label: qsTr("Fixed") }

						Label {			visible: parametersSettingsId.parametersSettings.length > 3;	text: parametersSettingsId.parametersSettings4.label }
						DoubleField	{	visible: parametersSettingsId.parametersSettings.length > 3;	name: "parameter4";		min: parametersSettingsId.parametersSettings4.min;	defaultValue: parametersSettingsId.parametersSettings4.defaultValue }
						CheckBox	{	visible: parametersSettingsId.parametersSettings.length > 3;	name: "parameterFixed4";	label: qsTr("Fixed") }

						Label {			visible: parametersSettingsId.parametersSettings.length > 4;	text: parametersSettingsId.parametersSettings5.label }
						DoubleField	{	visible: parametersSettingsId.parametersSettings.length > 4;	name: "parameter5";		min: parametersSettingsId.parametersSettings5.min;	defaultValue: parametersSettingsId.parametersSettings5.defaultValue }
						CheckBox	{	visible: parametersSettingsId.parametersSettings.length > 4;	name: "parameterFixed5";	label: qsTr("Fixed") }

					}

					Group
					{
						visible: false
						TextField {name: "parameterName1"; value: parametersSettingsId.parametersSettings1.name }
						TextField {name: "parameterName2"; value: parametersSettingsId.parametersSettings2.name }
						TextField {name: "parameterName3"; value: parametersSettingsId.parametersSettings3.name }
						TextField {name: "parameterName4"; value: parametersSettingsId.parametersSettings4.name }
						TextField {name: "parameterName5"; value: parametersSettingsId.parametersSettings5.name }
					}

				}
			}
	}

	Section
	{
		title: qsTr("Output")
		info: qsTr("Control what output will be generated.")

		Group
		{
			CheckBox
			{
				name: "comparisonTable"
				label: qsTr("Distribution comparison table")
				checked: true
				info: qsTr("Outputs the main distribution comparison table.")

				CheckBox
				{
					name: "comparisonTableOrder"
					label: qsTr("Order by")
					infoLabel: qsTr("Order by AIC/BIC")
					info: qsTr("Orders the output by how well the distributions fit the data (according to AIC or BIC).")
					childrenOnSameRow: true
					checked: true
					DropDown
					{
						name: "comparisonTableOrderBy"
						values:   [
							{ label: qsTr("AIC"), value: "aic"},
							{ label: qsTr("BIC"), value: "bic"}
						]
						startValue: "bic"
					}
				}
			}

			CheckBox
			{
				name: "fullDistributionSpecification"
				label: qsTr("Show full distribution specification")
				info: qsTr("Displays the full distribution specification, including its parameters. If unchecked, only distribution names are shown.")
			}
		}

		Group
		{
			title: qsTr("Output per distribution")
			info: qsTr("Get detailed output for individual distributions.")
			CheckBox
			{
				name: "outputLimit"
				label: qsTr("Limit output to the first")
				infoLabel: qsTr("Limit output to the first x distributions")
				info: qsTr("Show the detailed output only for the top x distributions.")
				enabled: parameterEstimates.checked || goodnessOfFit.checked || empiricalPlots.checked
				checked: true
				childrenOnSameRow: true
				IntegerField
				{
					name: "outputLimitTo"
					value: 1
					min: 1
					afterLabel: qsTr("distributions")
				}
			}

			CheckBox
			{
				name: "parameterEstimates"
				id: parameterEstimates
				label: qsTr("Parameter estimates")
				info: qsTr("Obtain a table of parameter estimates. *Note*: All parameters are estimated with maximum likelihood.")
				checked: true
			}

			CheckBox
			{
				name: "goodnessOfFit"
				id: goodnessOfFit
				label: qsTr("Goodness of fit")
				info: qsTr("Compute goodness of fit tests. For most of the distributions, the default tests are Cramér-von Mises and Anderson-Darling for composite null hypothesis. Note that these tests rely on randomly splitting the data in two sets;\
				as a result, the results may be variable, especially for small sample sizes.\
				When a distribution does not have free parameters (i.e., all parameters are fixed), the tests are Kolmorogov-Smirnov, and Cramér-von Mises and Anderson-Darling for simple null hypothesis. \
				For normal distributions with free location and scale parameters, specific versions of goodness of fit tests are computed, appropriate for this setting. If the normal distribution has some parameters fixed, it is treated as any other distribution.")

				CheckBox
				{
					name: "goodnessOfFitBootstrap"
					label: qsTr("Parametric bootstrap from")
					infoLabel: qsTr("Parametric bootstrap from x samples")
					info: qsTr("Obtain the p-value of the goodness-of-fit tests using parametric bootstrap. In this case, the test statistics are always Kolmorogov-Smirnov, and Cramér–von Mises and Anderson-Darling for simple null hypothesis.")
					childrenOnSameRow: true
					IntegerField{
						name: "goodnessOfFitBootstrapSamples"
						value: 1000
						afterLabel: qsTr("samples")
					}
				}
			}

			CheckBox
			{
				name: "empiricalPlots"
				id: empiricalPlots
				label: qsTr("Plot the distribution against data")
				info: qsTr("Outputs histogram vs theoretical density plot, empirical vs. theoretical cumulative distribution function, the Q-Q plot, and the P-P plot.")
				CheckBox
				{
					name: "empiricalPlotsCi"
					label: qsTr("Confidence interval")
					info: qsTr("Add the confidence interval to the P-P and Q-Q plots.")
					childrenOnSameRow: true
					CIField
					{
						name: "empiricalPlotsCiLevel"
					}
				}
			}
		}


	}
}
