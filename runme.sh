#!/bin/bash

function cleanup()
{
	rm -f diff.txt
	rm -rf obj
	rm -rf src
	rm -rf diff
	rm -rf mains
	echo "hello?"
}

function exit_err()
{
	cleanup
	exit 1
}

trap cleanup EXIT
mkdir obj src diff mains

echo -n "" > DEEPTHOUGHT
echo -n "" > diff/empty
echo -e "\n" > diff/rly_small
echo -e "The answer to the ultimate question of life, the universe and everything is 42.\n" > diff/small
echo "The battle between the CLONES and the DROIDS rages throughout the sinkhole. OBI-WAN rides up to CLONE COMMANDER CODY.
OBI-WAN: Commander, contact your troops. Tell them to move to the higher levels.
CLONE COMMANDER CODY: Very good, sir.
CLONE COMMANDER CODY starts to move away, then remembers something and returns to OBI-WAN.
CLONE COMMANDER CODY: (continuing) Oh, by the way, I think you'll be needing this.
He hands OBI-WAN his lightsaber, and the LIZARD rears up.
OBI-WAN: Thank you, Cody, (smiling) Now let's get a move on. We've got a battle to win here.
CLONE COMMANDER CODY: Yes, sir!
OBI-WAN and the LIZARD ride off down the wall of the giant sinkhole.
The battle rages throughout the city. CLONE COMMANDER CODY (2224,) takes out his comlink and listens to the HOLOGRAM OF DARTH SIDIOUS as, far below, OBI-WAN can been seen battling DROIDS on a landing platform.
DARTH SlDIOUS: Commander Cody, the time has come. Execute Order Sixty-Six.
CLONE COMMANDER CODY: It will be done, My Lord.
The HOLOGRAM disappears, and CLONE COMMANDER CODY gestures to a nearby Clone Trooper.
CLONE COMMANDER CODY: Blast him!
" > diff/med
echo "
[Intro]
Tell me what you see
In the afterlife
Par-delà le ciel
Par-delà le soleil

[Verse 1]
In all there is to learn
The sun is on our side
And though you're on the run
You will survive
Expanded to the state of light
The deepest corners of the world
Gliding through the lowlands
And swimming all the oceans
Walking through the silence
Already made it through the night
There will be a new day
Whenever the sun rises

[Chorus]
You're invisible
You're in everything
Tell me what you see
Tell me what you see
When you're everywhere
When you're everywhere
Tell me now
Tell me now
[Bridge]
While you drift away from all the plagues of this world
You're put out of misery, giant monster
You won't have to face it again
Every step of the way gets you higher

[Outro]
All the voices trapped underneath the ground
Let 'em all go in the sky
Find the power lost underneath the ground
Let it all blow in the sky
All the voices trapped in my head
Let 'em all scream in the night
Find the power lost underneath the ground
Let it all blow in the sky
" > diff/big

echo "#include \"../src/get_next_line.h\"
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>

int		main(int ac, char **av)
{
	(void)ac;
	char *line;
	int fd = open(av[1], O_RDONLY);
	int d;
	while ((d = get_next_line(fd, &line)) > 0)
	{
		printf(\"%s\n\", line);
		free(line);
	}
	free(line);
	return (0);
}" > mains/main.c

src_path="../gnl" #Change directory here
buffer_size=1
counter=1

#Copying sources
echo "----------Copying----------"
cp $src_path/get_next_line.c src/get_next_line.c && echo "➥ cp $src_path/get_next_line.c src/get_next_line.c"
cp $src_path/get_next_line_utils.c src/get_next_line_utils.c && echo "➥ cp $src_path/get_next_line_utils.c src/get_next_line_utils.c"
cp $src_path/get_next_line.h src/get_next_line.h && echo "➥ cp $src_path/get_next_line.h src/get_next_line.h"
echo ""
if ! ls src/get_next_line.c || ! ls src/get_next_line.h || ! ls src/get_next_line_utils.c ; then
	echo "❌error: files could not be copied"
	exit_err
fi

echo ""
echo -n "➥ " && ls -l src/
echo "✅Files successfully copied into src/"
echo ""

#Compiling from sources (no bonus)
echo "---------Compiling---------"
while [ $buffer_size -le 8 ]
do
	echo -n "➥ "
	gcc -Wall -Werror -Wextra -D BUFFER_SIZE=$buffer_size src/get_next_line.c src/get_next_line_utils.c mains/main.c -o obj/$buffer_size.out
	if ! ls obj/$buffer_size.out ; then
		echo "❌$buffer_size | error: compilation failed. View DEEPTOUGHT for more info"
	else
		echo "✅$buffer_size | Compilation successful"
	fi
	((buffer_size++))
done

echo ""

#Comparing output and input file with diff/*
echo "-----Comparing outputs-----"
echo ""
echo "➥ Comparing with diff/empty"
while [ $counter -le 8 ]
do
	./obj/$counter.out diff/empty > diff.txt
	if ! diff -q diff/empty diff.txt ; then
		diff -y diff/empty diff.txt
		echo "❌BUFFER_SIZE=$counter [KO]"
		echo "❌error: output differs from diff/empty"
	else
		echo "✅BUFFER_SIZE=$counter [OK]"
	fi
	((counter++))
done
counter=1
echo ""
echo "➥ Comparing with diff/rly_small"
while [ $counter -le 8 ]
do
	./obj/$counter.out diff/rly_small > diff.txt
	if ! diff -q diff/rly_small diff.txt ; then
		diff -y diff/rly_small diff.txt
		echo "❌BUFFER_SIZE=$counter [KO]"
		echo "❌error: output differs from diff/empty"
	else
		echo "✅BUFFER_SIZE=$counter [OK]"
	fi
	((counter++))
done
counter=1
echo ""
echo "➥ Comparing with diff/small"
while [ $counter -le 8 ]
do
	./obj/$counter.out diff/small > diff.txt
	if ! diff -q diff/small diff.txt ; then
		diff -y diff/small diff.txt
		echo "❌BUFFER_SIZE=$counter [KO]"
		echo "❌error: output differs from diff/empty"
	else
		echo "✅BUFFER_SIZE=$counter [OK]"
	fi
	((counter++))
done
counter=1
echo ""
echo "➥ Comparing with diff/med"
while [ $counter -le 8 ]
do
	./obj/$counter.out diff/med > diff.txt
	if ! diff -q diff/med diff.txt ; then
		diff -y diff/med diff.txt
		echo "❌BUFFER_SIZE=$counter [KO]"
		echo "❌error: output differs from diff/empty"
	else
		echo "✅BUFFER_SIZE=$counter [OK]"
	fi
	((counter++))
done
counter=1
echo ""
echo "➥ Comparing with diff/big"
while [ $counter -le 8 ]
do
	./obj/$counter.out diff/big > diff.txt
	if ! diff -q diff/big diff.txt ; then
		diff -y diff/big diff.txt
		echo "❌BUFFER_SIZE=$counter [KO]"
		echo "❌error: output differs from diff/empty"
	else
		echo "✅BUFFER_SIZE=$counter [OK]"
	fi
	((counter++))
done
echo -e "\nAll good!\n"

#Compiling with -fsanitize-address to test for leaks
leaks_tests=true
echo "-------Testing leaks-------"
echo "➥ Compiling with BUFFER_SIZE=1"
gcc -Wall -Werror -Wextra -g -fsanitize=address -D BUFFER_SIZE=1 src/get_next_line.c src/get_next_line_utils.c mains/main.c -o obj/1_leaks_test.out
echo "➥ Compiling with BUFFER_SIZE=512"
gcc -Wall -Werror -Wextra -g -fsanitize=address -D BUFFER_SIZE=512 src/get_next_line.c src/get_next_line_utils.c mains/main.c -o obj/512_leaks_test.out
if ! ls obj/1_leaks_test.out || ! ls obj/512_leaks_test.out ; then
	echo "❌Compiling failed. Skipping leaks tests..."
	leaks_tests=false
fi

if [ $leaks_tests == true ] ; then
#	./obj/1_leaks_test.out diff/small > /dev/null
#	./obj/512_leaks_test.out diff/small > /dev/null
	if ! ./obj/1_leaks_test.out diff/small > /dev/null || ! ./obj/512_leaks_test.out diff/small > /dev/null ; then
		echo "================================================================="
		echo
		echo "❌Your get_next_line leaks! [KO]"
	else
		echo
		echo -e "✅Your get_next_line does not leak! [OK]"
	fi
fi
