#include <Rcpp.h>
using namespace Rcpp;
using namespace std;

// [[Rcpp::export]]
std::map<double, int> tableC(NumericVector x){
  std::map<double, int> counts;
  
  int n = x.size();
  for (int i=0; i<n;i++){
    counts[x[i]]++;
  }
  return counts;
}


/*** R
tableC(as.integer(runif(200,1,9)))
*/
