#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
List scalar_missing(){
  int int_s =NA_INTEGER;
  String chr_s = NA_STRING;
  bool lgl_s = NA_LOGICAL;
  double num_s = NA_REAL;
  
  return List::create(int_s, chr_s,lgl_s,num_s);
}

//[[Rcpp::export]]
LogicalVector is_naC(NumericVector x){
  int n =x.size();
  LogicalVector out(n);
  
  for (int i =0;i<n; ++i){
    out[i]=NumericVector::is_na(x[i]);
  }
  return out;
}

/*** R
#str(scalar_missing())
is_naC(c(NA,5,5.4,3,3.2,NA))
*/
