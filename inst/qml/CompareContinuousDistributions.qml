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
					{ value: "normalMu",				label: qsTr("μ (mean)"),			min: -Infinity,		defaultValue: 0},
					{ value: "normalSigma",				label: qsTr("σ (std. deviation)"),	min: 0,				defaultValue: 1}
				],
				"sigma2": [
					{ value: "normalMu",				label: qsTr("μ (mean)"),			min: -Infinity,		defaultValue: 0},
					{ value: "normalSigma2",			label: qsTr("σ² (variance)"),		min: 0,				defaultValue: 1}
				],
				"tau": [
					{ value: "normalMu",				label: qsTr("μ (mean)"),			min: -Infinity,		defaultValue: 0},
					{ value: "normalTau",				label: qsTr("τ (precision)"),		min: 0,				defaultValue: 1}
				]
			}
		},
		"StandardNormal": {},
		"StandardT": {
			parametersSettings: {
				"default": [
					{ value: "standardTNu",				label: qsTr("ν (df)"),				min: 0,				defaultValue: 5}
				]
			}
		},
		"NoncentralT": {
			parametersSettings: {
				"default": [
					{ value: "noncentralTNu",			label: qsTr("ν (df)"),				min: 0,				defaultValue: 5},
					{ value: "noncentralTKappa",		label: qsTr("κ (noncentrality)"),	min: -Infinity,		defaultValue: 0}
				]
			}
		},
		"NoncentralStudentT": {
			parametersSettings: {
				"default": [
					{ value: "noncentralStudentTNu",	label: qsTr("ν (df)"),				min: 0,				defaultValue: 5},
					{ value: "noncentralStudentTKappa",	label: qsTr("κ (noncentrality)"),	min: -Infinity,		defaultValue: 0},
					{ value: "noncentralStudentTMu",	label: qsTr("μ (location)"),		min: -Infinity,		defaultValue: 0},
					{ value: "noncentralStudentTSigma",	label: qsTr("σ (scale)"),			min: 0,				defaultValue: 1}
				]
			}
		},
		"Cauchy": {
			parametersSettings: {
				"default": [
					{ value: "cauchyMu",				label: qsTr("μ (location)"),		min: -Infinity,		defaultValue: 0},
					{ value: "cauchySigma",				label: qsTr("σ (scale)"),			min: 0,				defaultValue: 1},
				]
			}
		},

		"Gumbel": {
			parametersSettings: {
				"default": [
					{ value: "gumbelMu",				label: qsTr("μ (location)"),		min: -Infinity,		defaultValue: 0},
					{ value: "gumbelBeta",				label: qsTr("β (scale)"),			min: 0,				defaultValue: 1},
				]
			}
		},
		"Laplace" : {
			parametersSettings: {
				"default": [
					{ value: "laplaceMu",				label: qsTr("μ (location)"),		min: -Infinity,		defaultValue: 0},
					{ value: "laplaceBeta",				label: qsTr("β (scale)"),			min: 0,				defaultValue: 1},
				]
			}
		},
		"Logistic" : {
			parametersSettings: {
				"default": [
					{ value: "logisticMu",				label: qsTr("μ (location)"),		min: -Infinity,		defaultValue: 0},
					{ value: "logisticSigma",			label: qsTr("β (scale)"),			min: 0,				defaultValue: 1},
				]
			}
		},
		"SkewedGeneralizedT": {
			parametersSettings: {
				"default": [
					{ value: "skewedGeneralizedTMu",	label: qsTr("μ (location)"),		min: -Infinity,		defaultValue: 0},
					{ value: "skewedGeneralizedTSigma",	label: qsTr("σ (scale)"),			min: 0,				defaultValue: 1},
					{ value: "skewedGeneralizedTLambda",label: qsTr("λ (skew)"),			min: -1,			defaultValue: 0},
					{ value: "skewedGeneralizedTP",		label: qsTr("p (kurtosis)"),		min: 0,				defaultValue: 2},
					{ value: "skewedGeneralizedTQ",		label: qsTr("q (kurtosis)"),		min: 0,				defaultValue: 2},
				]
			}
		},
		"SymmetricGeneralizedNormal": {
			parametersSettings: {
				"default": [
					{ value: "symmetricGeneralizedNormalMu",	label: qsTr("μ (location)"),	min: -Infinity,		defaultValue: 0},
					{ value: "symmetricGeneralizedNormalAlpha",	label: qsTr("σ (scale)"),		min: 0,				defaultValue: 1},
					{ value: "symmetricGeneralizedNormalBeta",	label: qsTr("β (shape)"),		min: 0,				defaultValue: 2},
				]
			}
		},
		"SkewNormal": {
			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
					{ value: "skewNormalOmega",	label: qsTr("ω (scale)"),		min: 0,				defaultValue: 1},
					{ value: "skewNormalAlpha",	label: qsTr("α (slant)"),		min:  -Infinity,	defaultValue: 0}
				]
			}
		}, // TODO: Update settings in the diestributions below!!!!
		"SkewCauchy": {
			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"SkewT": {
			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},

		"Beta": {
			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"BetaPrime": {
			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"CentralF": {
			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"NoncentralF": {
			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"ChiSquared": {
			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"NoncentralChiSquared": {
			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
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
					{ value: "exponentialLambda",		label: qsTr("λ (rate)"),			min: 0,				defaultValue: 1}
				],
				"beta": [
					{ value: "exponentialBeta",			label: qsTr("β (scale)"),			min: 0,				defaultValue: 1}
				]
			}
		},
		"Gamma": {
			parametersChoice : [
				{ label: qsTr("α (shape), θ (scale)"),	value: "theta"	},
				{ label: qsTr("α (shape), λ (rate)"),	value: "lambda"	},
				{ label: qsTr("α (shape), μ (mean)"),	value: "mu"		}
			],
			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"InverseGamma": {
			parametersChoice : [
				{ label: qsTr("α (shape), θ (scale)"),	value: "theta"	},
				{ label: qsTr("α (shape), λ (rate)"),	value: "lambda"	},
				{ label: qsTr("α (shape), μ (mean)"),	value: "mu"		}
			],

			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"Gompertz": {
			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"LogLogistic": {
			parametersChoice : [
				{ label: qsTr("μ (log location), σ (log scale)"),	value: "mu"	},
				{ label: qsTr("α (scale), β (shape)"),				value: "alpha"	}
			],

			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"LogNormal"	: {
			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"Wald": {
			parametersChoice : [
				{ label: qsTr("μ (mean), λ (shape)"),					value: "mu"		},
				{ label: qsTr("ν (drift), α (threshold), σ (noise)"),	value: "nu"	}
			],

			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"Weibull": {
			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},

		"Amoroso": {
			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"StretchedBeta": {
			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"Frechet": {
			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"Pareto": {
			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"Triangular": {
			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"Uniform": {
			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},

		"ShiftedExponential": {
			parametersChoice : [
				{ label: qsTr("λ (rate), shift"),	value: "lambda"	},
				{ label: qsTr("β (scale), shift"),	value: "beta"	}
			],

			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"ShiftedLogNormal": {
			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"ShiftedGamma": {
			parametersChoice : [
				{ label: qsTr("α (shape), θ (scale), shift"),	value: "theta"	},
				{ label: qsTr("α (shape), λ (rate), shift"),	value: "lambda"	},
				{ label: qsTr("α (shape), μ (mean), shift"),	value: "mu"		}
			],

			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"ShiftedInverseGamma": {
			parametersChoice : [
				{ label: qsTr("α (shape), θ (scale), shift"),	value: "theta"	},
				{ label: qsTr("α (shape), λ (rate), shift"),	value: "lambda"	},
				{ label: qsTr("α (shape), μ (mean), shift"),	value: "mu"		}
			],

			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"ShiftedLogLogistic": {
			parametersChoice : [
				{ label: qsTr("μ (log location), σ (log scale), shift"),	value: "mu"	},
				{ label: qsTr("α (scale), β (shape), shift"),				value: "alpha"	}
			],

			parametersSettings: {

				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"ShiftedWald": {
			parametersChoice : [
				{ label: qsTr("μ (mean), λ (shape), shift"),					value: "mu"		},
				{ label: qsTr("ν (drift), α (threshold), σ (noise), shift"),	value: "nu"	}
			],

			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		},
		"ShiftedWeibull": {
			parametersSettings: {
				"default": [
					{ value: "skewNormalXi",	label: qsTr("ξ (location)"),	min: -Infinity,		defaultValue: 0},
				]
			}
		}

	}

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

					ComponentsList
					{
						id:					parametersSettingsId
						values:				parametersSettings
						name:				"parametersSettings"
						addItemManually:	false
						visible:			parametersSettings.length > 0

						property var parametersSettingsAll: distributionParametersId.distributionParameters.hasOwnProperty("parametersSettings") ? distributionParametersId.distributionParameters["parametersSettings"] : {}
						property var parametersSettings:	parametersSettingsAll.hasOwnProperty(parameterChoice.currentValue) ? parametersSettingsAll[parameterChoice.currentValue] : (parametersSettingsAll.hasOwnProperty("default") ? parametersSettingsAll["default"] : [])


						rowComponent: Row {
							spacing: 10 * jaspTheme.uiScale
							Label {			width: 100 * jaspTheme.uiScale; text: rowLabel }
							DoubleField	{	name: rowValue;		min: parametersSettingsId.parametersSettings[rowIndex].min;	defaultValue: parametersSettingsId.parametersSettings[rowIndex].defaultValue }
							CheckBox	{	name: rowValue + "Fixed";	label: qsTr("Fixed") }
						}

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
