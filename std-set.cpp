//[[Rcpp::plugins(cpp11)]]

#include <Rcpp.h>
#include <unordered_set>
using namespace Rcpp;
using namespace std;

// before using please run Sys.setenv("PKG_CXXFLAGS"="-std=c++11")
// Set or unordered set is iterator and value

// [[Rcpp::export]]
LogicalVector duplicatedC(IntegerVector x){
  std::unordered_set<int> seen;
  int n = x.size();
  LogicalVector out(n);
  
  for (int i=0; i< n; ++i){
    out[i]= !seen.insert(x[i]).second;
    // FALSE is unique, TRUE are duplicates
  }
  
  return out;
}

/*** R

*/
