#include <Rcpp.h>
#include <tuple>
#include<iostream>
using namespace std;
using namespace Rcpp;


// [[Rcpp::export]]
string tupa(){
  
  tuple<int , string, bool> t1(1,"Igor", true);
  auto t2 = make_tuple(2,"Gorodskov", false);
  int i;
  string s;
  bool b;
  
  tie(i,s,b)=t1;
  
  tie(ignore,s,ignore)=t2;
  return s;
}


// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically 
// run after the compilation.
//

/*** R
tupa()
*/
