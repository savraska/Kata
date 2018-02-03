#include <Rcpp.h>
using namespace Rcpp;
//Rcpp::sourceCpp('R/Rcpp/mpe.cpp')

// [[Rcpp::export]]
// MPE - mean percentage error
double mpe(List mod){
  // check if it was from lm
  if(!mod.inherits("lm")) stop ("It must be command lm for linear model");
  
  // convert R input to C++ data
  NumericVector resid = as<NumericVector>(mod["residuals"]);
  NumericVector fitted = as<NumericVector>(mod["fitted.values"]);
  
  int n = resid.size();
  double err = 0;
  for (int i=0;i<n;++i){
    // this is how to count mpe
    err+=resid[i] / (fitted[i]+resid[i]);
  }
  
  return err / n;
}


// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically 
// run after the compilation.
//

/*** R

fit <- lm(Sepal.Width ~ Sepal.Length, data = iris)
mpe(fit)
*/
