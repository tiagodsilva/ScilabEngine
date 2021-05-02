function [f] = Fibonacci(n) 
	F = [0 1; 1 1]; 
	[X, L] = spec(F)  
	f = X * L^(n - 1) * X' * [1 1]'; 
	f = f(1, 1); 
endfunction   
	
