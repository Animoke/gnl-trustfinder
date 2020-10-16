# gnl-trustfinder


get_next_line tester


Default:

Running 𝘨𝘯𝘭-𝘵𝘳𝘶𝘴𝘵𝘧𝘪𝘯𝘥𝘦𝘳.𝘴𝘩 without any flag will do the same as 𝘨𝘯𝘭-𝘵𝘳𝘶𝘴𝘵𝘧𝘪𝘯𝘥𝘦𝘳.𝘴𝘩 --𝘵𝘦𝘴𝘵 𝘯𝘰𝘳𝘮𝘢𝘭

A DEEPTHOUGHT file is generated during the execution of the script.

Usage:

Change your gnl directory in 𝘨𝘯𝘭-𝘵𝘳𝘶𝘴𝘵𝘧𝘪𝘯𝘥𝘦𝘳.𝘴𝘩 :

src_path="../𝘺𝘰𝘶𝘳_𝘱𝘢𝘵𝘩" --- default path is "../𝘨𝘯𝘭"


  ./gnl-trustfinder [-$f] [$option]
  ./gnl-trustfinder [--$flag] [$option]

  -h | --help    display help message
  -t | --test    test flag

  options:
        n | normal     normal mode
        l | leaks      only tests leaks
        b | bonus      only tests bonus
        a | all        all tests
       hf | huge-file  test with huge file (48000 lines)

Example:
Running ./gnl-trustfinder -t b will test for bonus, without testing the rest.

The flags are interchangeable, meaning that it does not matter if you type the short flag with a full option and vice-versa.


Features:

 - Normal mode:
The normal mode will compile your files with a BUFFER_SIZE of 1 to 8.
It will then compare the output of the binary and compare it with the input file (in the diff/ directory when the programm is running).
The leaks test uses -𝘧𝘴𝘢𝘯𝘪𝘵𝘪𝘻𝘦=𝘢𝘥𝘳𝘦𝘴𝘴 on compilation to look for more informations if there are leaks. 

 - Leaks mode:
This mode will do the same as the normal mode, but skipping the comparison.

 - Bonus mode:
This mode will compile with BUFFER_SIZE 1 and 512, and then compare the output of the binaries to the input file.
The leaks test works the same way as it does in normal mode

 - All tests mode:
This mode will run normal mode and bonus mode. It will be improved in the future to add all the features.

 - Huge-file mode:
This mode will generate a huge file (48000 lines) into diff/huge (this operation takes about 20-30 seconds)
It will the compile like the normal mode, and compare the diff/huge file with the output of your gnl.



Feature to come:
 - huge-buf-size mode, a mode that compiles with different and random BUFFER_SIZE between 1 and 4096.
 
If you find bugs, or have any idea that could improve this tester, let me know on slack (@gpatingr) or create an issue.
