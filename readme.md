# gnl-trustfinder

**get_next_line tester**

# Usage

Change your gnl directory in 𝘨𝘯𝘭-𝘵𝘳𝘶𝘴𝘵𝘧𝘪𝘯𝘥𝘦𝘳.𝘴𝘩 :   
`src_path="../𝘺𝘰𝘶𝘳𝘱𝘢𝘵𝘩"` --- default is `src_path"../gnl"`   

`./gnl-trustfinder [-$f]`   
`./gnl-trustfinder [--$flag]`   
   
   
|Short flag      |Full flag               |Description                        |
|----------------|------------------------|-----------------------------------|
|**-h**          |**--help**              |display help message               |
|**-n**          |**--normal**            |normal mode                        |
|**-l**          |**--leaks**             |only tests leaks                   |
|**-b**          |**--bonus**             |only tests bonus                   |
|**-hf**         |**--huge-file**         |test with huge file (48000 lines)  |
|**-s**          |**--size**              |test BUFFER_SIZE from 1 to 4096    |
|**-a**          |**--all**               |only tests leaks                   |
   
**Example**: running `./gnl-trustfinder -b` will test for bonus, without testing the rest.   
   
# Features:

-   Normal mode: The normal mode will compile your files with a `BUFFER_SIZE` of 1 to 8. It will then compare the output of the binary and compare it with the input file (in the `diff/` directory when the programm is running). The leaks test uses `-fsanitize=address` on compilation to look for more informations if there are leaks.
    
-   Leaks mode: This mode will do the same as the normal mode, but skipping the comparison. The leaks test uses `-fsanitize=address` on compilation to look for more informations if there are leaks.
    
-   Bonus mode: This mode will compile with `BUFFER_SIZE` 1 and 512, and then compare the output of the binaries to the input file.
    
-   All tests mode: This mode will run normal mode bonus mode and huge-file test (confirmation is asked). It will be improved in the future to add all the features.
    
-   Huge-file mode: This mode will generate a huge file (48000 lines) into `diff/huge` (this operation takes about 20-30 seconds on the school iMacs) It will the compile like the normal mode, and compare the `diff/huge` file with the output of your gnl.
    

# Feature to come:

-   huge-buf-size mode, a mode that compiles with different and random `BUFFER_SIZE` between 1 and 4096.

If you find bugs, or have any idea that could improve this tester, let me know on slack (@gpatingr) or create an issue.
