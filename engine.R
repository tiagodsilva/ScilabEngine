library(stringr) 
eng_scilab <- function(options) { 
code <- str_c(options$code, collapse = "\n")  
if (options$eval) { 
flags = "--timeout 4s -ns -e" 
if(!is.null(options$timeout)) flags = paste("--timeout", options$timeout, "-ns -e") 
if(typeof(options$scilab_file) == "character") {
  exec_file <- sprintf("exec('%s', -1)", options$scilab_file) 
  code <- paste(exec_file, "\n", code)   
} 

if(!is.null(options$scilab_var)) {
  code <- paste(options$scilab_var, code) 
} 
# print(code) 
code <- paste(code, "\nexit") 
code <- paste("try;", code, ";catch;", 
              "disp('some exception was raised! :(') 
              disp('this is the exception:') 
              disp(lasterror())  
              exit; end") 
cmd <- sprintf('scilab-cli %s %s',
             flags, shQuote(code, type="sh")) 

# options$comment = NA 
out <- system(cmd, intern = TRUE) 
# print(out) 
}else{out <- ""}

knitr::engine_output(options, options$code, out)

}

knitr::knit_engines$set(scilab=eng_scilab) 

