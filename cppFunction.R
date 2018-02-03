library("Rcpp")
cppFunction('int add(int x, int y, int z){
            int sum=x+y+z;
            sum=pow(sum,3);
            return sum;
            }')


add(01,02,30)
