### Name: jcall
### Title: Call a Java method
### Aliases: .jcall
### Keywords: interface

### ** Examples

## Not run: 
##D .jcall("java/lang/System","S","getProperty","os.name")
##D f <- .jnew("java/awt/Frame","Hello")
##D .jcall(f,,"setVisible",TRUE)
## End(Not run)



