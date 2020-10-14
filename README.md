# gnl_trustfinder
Tester for get_next_line in 42cursus. This is a work in progress, please DM me on slack if you find bugs.

This tester will compile with different BUFFER_SIZE values (1 to 8 for now, i will add a flag to test with more) and compare the output file with the original one.
It will also compile using "fsanitize=address" to search for leaks (BUFFER_SIZE=1 and BUFFER_SIZE=512) and display the result.

I am planning on adding flags and bonus tests to make this script fully flexible.

(This is a temporary README.md, a new one will come when this script becomes more fully-featured)
