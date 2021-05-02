Demo
================

This is a simple demo for using Scilab engine in RMarkdown. Let’s start,
just to be sure that everythin is working, with matrix multiplication.

``` scilab
A = [1 2 3; 4 5 6; 7 8 9]; 
b = [1 5 25]'; 
A * b 
```

    ##  ans  =
    ## 
    ##    86. 
    ##    179.
    ##    272.

Sometimes, we need to multiply two really big matrices; for this, we can
update the timeout.

``` scilab
n = 2500; 
A = rand(n, n); 
B = rand(n, n); 
tic() 
A * B; 
toc() 
```

    ##  ans  =
    ## 
    ##    12.36345

Now, let’s say we define a matrix in some chunk:

``` scilab
A = [1 2 3; 4 5 6; 7 8 9]; 
spec(A) 
```

    ##  ans  =
    ## 
    ##    16.116844 + 0.i
    ##   -1.116844  + 0.i
    ##   -1.304D-15 + 0.i

And we want to reuse it in another chunk. For this, we can use
`scilab_var` option.

``` scilab
max(abs(spec(A))) // dominant eigenvalue of A 
```

    ##  ans  =
    ## 
    ##    16.116844

However, one possibly needs to reuse functions and variables between
chunks; writing them in one line in `scilab_var` could be really
inconvenient. For this, the option `scilab_file` is available; one can
load a file with whatever they want. The next chunk, for instance,
compute the Fibonacci numbers with the Fibonacci function, written in
[Fibonacci.sci](https://github.com/tiagodsilva/ScilabEngine/blob/main/demo/Fibonacci.sci)
file.

``` scilab
fibo = []; 
for i = 1:15 do fibo = [fibo Fibonacci(i)]; end 
fibo 
```

    ##  fibo  = 
    ## 
    ##          column 1 to 13
    ## 
    ##    1.   1.   2.   3.   5.   8.   13.   21.   34.   55.   89.   144.   233.
    ## 
    ##          column 14 to 15
    ## 
    ##    377.   610.

That is it. It is also possibly use normally all amazing functionalities
of RMarkdown (for example, LaTeX with tinytex, HTML and GitHub
markdown)!
