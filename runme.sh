#!/bin/bash
function cleanup()
{
	rm -f a.out
	rm -f diff.txt
}
trap cleanup EXIT
src_path="../gnl"
buffer_size=1
echo -n "" > DEEPTHOUGHT

#normal mode
while [ buffer_size -le 8 ]
do
	gcc -Wall -Werror -Wextra -D BUFFER_SIZE=$(buffer_size) $(src_path)/get_next_line.c $(src_path)/get_next_line_utils.c mains/main.c -o tests/$(buffer_size).out
	((buffer_size++))
done
