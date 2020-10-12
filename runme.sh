#!/bin/bash
function cleanup()
{
	rm -f a.out
	rm -f diff.txt
}
trap cleanup EXIT
i=1
echo -n "" > DEEPTHOUGHT

