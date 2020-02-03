# C compile error “Variable sized object may not be initialized”

https://stackoverflow.com/questions/3082914/c-compile-error-variable-sized-object-may-not-be-initialized

Why do I receive the error "Variable-sized object may not be initialized" with the following code?

int boardAux[length][length] = {{0}};

I am assuming that you are using a C99 compiler (with support for dynamically sized arrays). The problem in your code is that at the time when the compilers sees your variable declaration it cannot know how many elements there are in the array (I am also assuming here, from the compiler error that length is not a compile time constant).

You must manually initialize that array:

int boardAux[length][length]; memset( boardAux, 0, length*length*sizeof(int) );