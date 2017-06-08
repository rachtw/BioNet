### Name: jcheck
### Title: Java exception handling
### Aliases: .jcheck .jthrow .jclear .jgetEx
### Keywords: interface

### ** Examples

## Not run: 
##D # we try to create a bogus object and
##D # instruct .jnew to not clear the exception
##D # this will raise an exception
##D v <- .jnew("foo/bar", check=FALSE)
##D 
##D # you can poll for the exception, but don't try to print it
##D # (see details above)
##D if (!is.null(e<-.jgetEx())) print("Java exception was raised")
##D 
##D # expect TRUE result here because the exception was still not cleared
##D print(.jcheck(silent=TRUE))
##D # next invocation will be FALSE because the exception is now cleared
##D print(.jcheck(silent=TRUE))
##D 
##D # now you can print the actual expection (even after it was cleared)
##D print(e)
## End(Not run)



