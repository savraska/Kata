#include <Rcpp.h>
using namespace Rcpp;

//[[Rcpp::export]]


RObject adin(Function f){
  return f(1);
}
//adin(function(x) x+8) or adin(paste)

//[[Rcpp::export]]

List lapply1 (List input, Function f){
  int n =input.size();
  List out(n);
  
  for (int i =0;i<n;i++){
   // out[i]=f(input[i]);  //or
    out[i]=f(_["x"]=input[i]);

  }
  
  return out;
  
  //named arguments in functions should be written:
  // f(_["x"]="y", _["value"]=1);

}
//lapply1(iris$Sepal.Length,function(x) x * 10)  
/*** R

*/
