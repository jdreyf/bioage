% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hdfuns.R
\name{hd}
\alias{hd}
\title{Calculate homeostatic disregulation in a dataset.}
\usage{
hd(data, biomarkers, fit = NULL, filter = NULL)
}
\arguments{
\item{data}{The dataset for calculating homeostatic disregulation.}

\item{biomarkers}{A character vector indicating the names of the variables for the biomarkers to use in calculating homeostatic disregulation.}

\item{fit}{An S3 object for model fit. If the value is NULL, then the parameters to use for training homeostatic disregulation are calculated.}

\item{filter}{a list with biomarker names that identifies any restrictions in training data. These are generally a young, "healthy" reference group, i.e. a group within clinical guidelines.}
}
\value{
An object of class 'hd'. This object is a list with two elements (data and fit),
and two methods (extract_data and extract_fit).
}
\description{
Calculate homeostatic disregulation in a dataset.
}
\examples{
#(not run)
#Train homeostatic disregulation
train = hd(data=nhanes,
           biomarkers=c('sysbp','totchol','bun','cmv','mcv'),
           fit=list(sysbp='',
                    totchol='',
                    bun='',
                    cmv='',
                    mcv=''
           ))

#Use training data to calculate out-of-sample biological ages
valudate = kdm_calc(data,fit=train$fit,
  biomarkers=c('sysbp','totchol','bun','cmv','mcv'))

#combine biological ages calculated using training parameters
data$bioage = extract_data(biocalc)[,'bioage']
}
