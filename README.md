# Scilab in RMarkdown 

This is a simple example of how to execute Scilab code in RMarkdown. It will be possibly useful for anyone who needs to write reports or homeworks with this language. By the way, I used it in Ubuntu 20.04; I don't know whether it works in another OS :blush:. 

In order to use it, one needs to install Scilab in its machine. This can be done with 

``` 
sudo apt install scilab 
``` 

To make sure everything is working, the command `scilab-cli -e "disp('Hello World')";exit"` should print `"Hello World"` on the console. 

With this in hand, insert the code in [engine.R](https://github.com/tiagodsilva/ScilabEngine/blob/main/engine.R) at the start of your Rmd document; for instance, check [demo.Rmd](https://github.com/tiagodsilva/ScilabEngine/blob/main/demo.Rmd) file. This will add another engine to `knitr`; in general, it will read the code written in the chunk, execute it with `scilab-cli --timeout 4s -ns -e "code"` and print whatever appears in the console. It is, however, important to notice that we inserted a timeout to the execution; this is necessary because we can't interrupt execution from RStudio without reseting it. This can be controlled with a `timeout` option; for example, `{r, engine = "scilab", timeout = "25s"}`. 

In addition, two options are available: one allows to load Scilab files, so one can use custom functions; the other is used to define variables without writing them explicitly in the chunk: this is important because the variables defined in one chunk are locally to that chunk, that is, they can't be used anywhere else. The next bullet points are about those options. 

+ `scilab_file`. Load a scilab file; it uses `exec(filename, -1)` for this. 

+ `scilab_var`. Define variables; you can use semicolons to separe them. For instance, `{r, engine = "scilab", scilab_var = "A = [1 2 3 4]; b = [1 2 3 4 5]';"}` makes variables `A` and `b` available. 


This is it. Check the [demo](https://github.com/tiagodsilva/ScilabEngine/blob/main/demo.Rmd) for a more concrete example :stuck_out_tongue_winking_eye:. 
