#' A Cat Function
#'



cat_function <- structure(function# custom title goes here
                          ### for description, function arguments, and return values.
                          ### cat_function descr goes here \eqn{a}
(love=TRUE ##<< for documenting function arguments on the same line.
### love is a parameter
### for description, function arguments, and return values.
 )
{  ##sectttttion<< followed by 
  ## for arbitrary documentation sections.
  invisible(print(ifelse(love == TRUE, 
    "I love cats!",
    "I am not a cool person."
  ))
)
### for description, function arguments, and return values.
### the return value is a print statement  
}, ex = function(){
# comment in example
  cat_function(love = TRUE)
  cat_function(l = FALSE)
})

