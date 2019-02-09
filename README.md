---
	output:
	pdf_document: default
	html_document: default
	---
	# logistic_regression_tutorial
	Short introduction of logistic regression and related R code
	##########
	
	Lot of medical and ecological studies result in a binary outcome variable (survived-yes/no; parasite found yes/no). These outcome variables can depend on independent predictor variables.
	
	The logistic regression analysis is based on the principal of linear regression. However, the conditional mean of regression equation is bound between 0 and 1. 
	
	Quantity $\pi(x)= E(Y|x)$,  $\pi(x)$ represents conditional mean of x given y
	    Logistic regression model can be represented as:
	    $\pi(x) = \frac{\exp(\beta_0+\beta_1x)}{(1+exp(\beta_0+\beta_1x)}$
	
	Logit trasnformation of the above model has many properties of linear regression:
	
	$g(x) = ln[\frac{\pi(x)}{1-\pi(x)}] = \beta_0+\beta_1x$
	
	
	
	
	
	
