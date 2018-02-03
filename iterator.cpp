#include <Rcpp.h>
#include <numeric>  // or accumulate function
using namespace Rcpp;
using namespace std;

// [[Rcpp::export]]
double sum3(NumericVector x){
 /* double total =0;
  
  NumericVector::iterator it;
  for(it=x.begin(); it!= x.end(); it++){
    total+=*it;
  }
  
  return total;*/
 return std::accumulate(x.begin(),x.end(),0.0); // o.o for numeric, not int
}


/*** R

*/
