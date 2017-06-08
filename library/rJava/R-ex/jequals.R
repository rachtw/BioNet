### Name: jequals
### Title: Comparing Java References
### Aliases: .jequals !=,ANY,jobjRef-method !=,jobjRef,jobjRef-method
###   !=,jobjRef,ANY-method ==,ANY,jobjRef-method ==,jobjRef,jobjRef-method
###   ==,jobjRef,ANY-method
### Keywords: interface

### ** Examples

## Not run: 
##D s <- .jnew("java/lang/String", "foo")
##D .jequals(s, "foo") # TRUE
##D .jequals(s, "foo", strict=TRUE) # FALSE - "foo" is not a Java object
##D t <- s
##D .jequals(s, t, strict=TRUE) # TRUE
##D 
##D s=="foo" # TRUE
## End(Not run)



