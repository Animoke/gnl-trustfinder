#!/bin/bash

function cleanup()
{
 	rm -f diff.txt diff2.txt
	rm -rf obj
	rm -rf src
	rm -rf diff
	rm -rf mains
}

function exit_err()
{
	cleanup
	exit 1
}

src_path="../gnl-github" #Change directory here

trap cleanup EXIT
mkdir obj src diff mains

#Making files so the tester only has one file to download
echo -n "" > DEEPTHOUGHT
echo -n "" > diff/empty
echo -e "\n" > diff/rly_small
echo -e "The answer to the ultimate question of life, the universe and everything is 42." > diff/small
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

# Bonus test files
echo -n "The answer to the ultimate question of life,
the universe and everything is 42.
" > diff/bonus_small
echo "The answer to the ultimate question of life," > diff/bonus_small1
echo "the universe and everything is 42." > diff/bonus_small2

#echo -e "The answer to the ultimate question of life, the universe and everything is 42." > diff/small
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
CLONE COMMANDER CODY: It will be done, My Lord." > diff/bonus_med
echo -n "The battle between the CLONES and the DROIDS rages throughout the sinkhole. OBI-WAN rides up to CLONE COMMANDER CODY.
CLONE COMMANDER CODY: Very good, sir.
CLONE COMMANDER CODY: (continuing) Oh, by the way, I think you'll be needing this.
OBI-WAN: Thank you, Cody, (smiling) Now let's get a move on. We've got a battle to win here.
OBI-WAN and the LIZARD ride off down the wall of the giant sinkhole.
DARTH SlDIOUS: Commander Cody, the time has come. Execute Order Sixty-Six.
The HOLOGRAM disappears, and CLONE COMMANDER CODY gestures to a nearby Clone Trooper." > diff/bonus_med1
echo "OBI-WAN: Commander, contact your troops. Tell them to move to the higher levels.
CLONE COMMANDER CODY starts to move away, then remembers something and returns to OBI-WAN.
He hands OBI-WAN his lightsaber, and the LIZARD rears up.
CLONE COMMANDER CODY: Yes, sir!
The battle rages throughout the city. CLONE COMMANDER CODY (2224,) takes out his comlink and listens to the HOLOGRAM OF DARTH SIDIOUS as, far below, OBI-WAN can been seen battling DROIDS on a landing platform.
CLONE COMMANDER CODY: It will be done, My Lord.
CLONE COMMANDER CODY: Blast him!" > diff/bonus_med2
echo "[Intro]
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
Let it all blow in the sky" > diff/bonus_big
echo "[Intro]
In the afterlife
Par-delà le soleil
[Verse 1]
The sun is on our side
You will survive
The deepest corners of the world
And swimming all the oceans
Already made it through the night
Whenever the sun rises
[Chorus]
You're in everything
Tell me what you see
When you're everywhere
Tell me now
While you drift away from all the plagues of this world
You won't have to face it again

All the voices trapped underneath the ground
Find the power lost underneath the ground
All the voices trapped in my head
Find the power lost underneath the ground" > diff/bonus_big1
echo "Tell me what you see
Par-delà le ciel

In all there is to learn
And though you're on the run
Expanded to the state of light
Gliding through the lowlands
Walking through the silence
There will be a new day

You're invisible
Tell me what you see
When you're everywhere
Tell me now
[Bridge]
You're put out of misery, giant monster
Every step of the way gets you higher
[Outro]
Let 'em all go in the sky
Let it all blow in the sky
Let 'em all scream in the night
Let it all blow in the sky" > diff/bonus_big2





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
		printf(\"%s\n\", line);
	return (0);
}" > mains/main.c

echo "#include \"../src/get_next_line_bonus.h\"

int		main(int ac, char **av)
{
	(void)ac;
	char *line;
	int fd1 = open(av[1], O_RDONLY);
	int fd2 = open(av[2], O_RDONLY);
	int d = 1;
	while (d)
	{
		if (d &= (get_next_line(fd1, &line) > 0))
			printf(\"%s\n\", line);
		if (d &= (get_next_line(fd2, &line) > 0))
			printf(\"%s\n\", line);
	}
	return (0);
}	
" > mains/main_bonus.c

# Colors
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

# Variables
buffer_size=1
counter=1
#uni_success="${GREEN}✅${NOCOLOR}"
uni_success="${GREEN}✓${NOCOLOR}"
#uni_fail="${RED}❌${NOCOLOR}"
uni_fail="${RED}✗${NOCOLOR}"
uni_arrow="➥"
uni_sep="❯"
diff_ok="${GREEN}[OK]${NOCOLOR}"
diff_ko="${RED}[KO]${NOCOLOR}"

function startup_welcome()
{
echo -e "${YELLOW}
=======================================
#######################################
########### GNL-TRUSTFINDER ###########
#######################################
============❯ by gpatingr ❮============
"
echo -e "${YELLOW}
=======================================
#######################################
########### GNL-TRUSTFINDER ###########
#######################################
============❯ by gpatingr ❮============
" >> DEEPTHOUGHT
}

function src_cpy_no_bonus()
{
	# Copying sources
	echo -e "\n${YELLOW}----------------Copying----------------${NOCOLOR}"
	echo -e "\n${YELLOW}----------------Copying----------------${NOCOLOR}" >> DEEPTHOUGHT
	cp $src_path/get_next_line.c src/get_next_line.c && echo -e "$uni_arrow cp $src_path/get_next_line.c src/get_next_line.c"
	cp $src_path/get_next_line_utils.c src/get_next_line_utils.c && echo -e "$uni_arrow cp $src_path/get_next_line_utils.c src/get_next_line_utils.c"
	cp $src_path/get_next_line.h src/get_next_line.h && echo -e "$uni_arrow cp $src_path/get_next_line.h src/get_next_line.h"
	# DEEPTHOUGHT log
	echo -e "$uni_arrow cp $src_path/get_next_line.c src/get_next_line.c" >> DEEPTHOUGHT
	echo -e "$uni_arrow cp $src_path/get_next_line_utils.c src/get_next_line_utils.c" >> DEEPTHOUGHT
	echo -e "$uni_arrow cp $src_path/get_next_line.h src/get_next_line.h" >> DEEPTHOUGHT
	
	echo "" && echo "" >> DEEPTHOUGHT
	if ! ls src/get_next_line.c || ! ls src/get_next_line.h || ! ls src/get_next_line_utils.c ; then
		echo "$uni_fail error: files could not be copied"
		echo "$uni_fail error: files could not be copied" >> DEEPTHOUGHT
		exit_err
	fi

	echo ""
	echo -n "$uni_arrow    " && ls -l src/
	echo -e "$uni_success Files successfully copied into src/" && echo -e "$uni_success Files successfully copied into src/" >> DEEPTHOUGHT
	echo "" && echo "" >> DEEPTHOUGHT
}

function no_bonus_compilation()
{
	# Compiling from sources (no bonus)
	echo -e "${YELLOW}---------------Compiling---------------${NOCOLOR}"
	echo -e "${YELLOW}---------------Compiling---------------${NOCOLOR}" >> DEEPTHOUGHT
	while [ $buffer_size -le 8 ]
	do
		echo -ne "$uni_arrow  ${LIGHTBLUE}" && echo -ne "$uni_arrow  ${LIGHTBLUE}" >> DEEPTHOUGHT
		gcc -Wall -Werror -Wextra -D BUFFER_SIZE=$buffer_size src/get_next_line.c src/get_next_line_utils.c mains/main.c -o obj/$buffer_size.out
		echo -e "gcc -Wall -Werror -Wextra -D BUFFER_SIZE=$buffer_size src/get_next_line.c src/get_next_line_utils.c mains/main.c -o obj/$buffer_size.out" >> DEEPTHOUGHT
		if ! ls obj/$buffer_size.out ; then
			echo -e "${NOCOLOR} $uni_fail $buffer_size ${uni_sep}${RED} error: compilation failed. View DEEPTOUGHT for more info $diff_ko${NOCOLOR}"
			echo -e "$uni_fail${RED}Compilation failed. $diff_ko${NOCOLOR}" >> DEEPTHOUGHT
			gcc -Wall -Werror -Wextra -D BUFFER_SIZE=$buffer_size src/get_next_line.c src/get_next_line_utils.c mains/main.c -o obj/$buffer_size.out 2>> DEEPTHOUGHT
			exit_err
		else
			echo -e "${NOCOLOR} $uni_success $buffer_size ${uni_sep}${GREEN} Compilation successful"
			echo -e "${NOCOLOR} $uni_success $buffer_size ${uni_sep}${GREEN} Compilation successful" >> DEEPTHOUGHT
		fi
		echo -ne "${NOCOLOR}" && echo -ne "${NOCOLOR}" >> DEEPTHOUGHT
		((buffer_size++))
	done
	
	echo "" && echo "" >> DEEPTHOUGHT
}

function normal_diff_tests()
{
	# Comparing output and input file with diff/*
	diff_output=1
	echo -e "${YELLOW}-----------Comparing outputs-----------${NOCOLOR}"
	echo -e "${YELLOW}-----------Comparing outputs-----------${NOCOLOR}" >> DEEPTHOUGHT
	echo ""
	echo -e "$uni_arrow Comparing with diff/empty" && echo -e "$uni_arrow Comparing with diff/empty" >> DEEPTHOUGHT
	while [ $counter -le 8 ]
	do
		./obj/$counter.out diff/empty > diff.txt
		if ! diff -q diff/empty diff.txt > /dev/null ; then
			diff diff/empty diff.txt >> DEEPTHOUGHT
			echo -e "$uni_fail BUFFER_SIZE=$counter $diff_ko"
			echo -e "$uni_fail BUFFER_SIZE=$counter $diff_ko" >> DEEPTHOUGHT
			echo -e "$uni_fail error: output differs from diff/empty"
			((diff_output=1))
		else
			echo -e "$uni_success BUFFER_SIZE=$counter $diff_ok"
			echo -e "$uni_success BUFFER_SIZE=$counter $diff_ok" >> DEEPTHOUGHT
			((diff_output=0))
		fi
		echo -ne "$NOCOLOR"
		((counter++))
	done
	counter=1
	empty_diff=$diff_output
	echo "" && echo "" >> DEEPTHOUGHT
	echo -e "$uni_arrow Comparing with diff/rly_small" && echo -e "$uni_arrow Comparing with diff/rly_small" >> DEEPTHOUGHT
	while [ $counter -le 8 ]
	do
		./obj/$counter.out diff/rly_small > diff.txt
		if ! diff -q diff/rly_small diff.txt > /dev/null ; then
			diff diff/rly_small diff.txt >> DEEPTHOUGHT
			echo -e "$uni_fail BUFFER_SIZE=$counter $diff_ko"
			echo -e "$uni_fail BUFFER_SIZE=$counter $diff_ko" >> DEEPTHOUGHT
			echo -e "$uni_fail error: output differs from diff/rly_small"
			((diff_output=1))
		else
			echo -e "$uni_success BUFFER_SIZE=$counter $diff_ok"
			echo -e "$uni_success BUFFER_SIZE=$counter $diff_ok" >> DEEPTHOUGHT
			((diff_output=0))
		fi
		((counter++))
		echo -ne "$NOCOLOR"
	done
	counter=1
	rly_small_diff=$diff_output
	echo "" && echo "" >> DEEPTHOUGHT
	echo -e "$uni_arrow Comparing with diff/small" && echo -e "$uni_arrow Comparing with diff/small" >> DEEPTHOUGHT
	while [ $counter -le 8 ]
	do
		./obj/$counter.out diff/small > diff.txt
		if ! diff -q diff/small diff.txt > /dev/null ; then
			diff diff/small diff.txt >> DEEPTHOUGHT
			echo -e "$uni_fail BUFFER_SIZE=$counter $diff_ko"
			echo -e "$uni_fail BUFFER_SIZE=$counter $diff_ko" >> DEEPTHOUGHT
			echo -e "$uni_fail error: output differs from diff/small"
			((diff_output=1))
		else
			echo -e "$uni_success BUFFER_SIZE=$counter $diff_ok"
			echo -e "$uni_success BUFFER_SIZE=$counter $diff_ok" >> DEEPTHOUGHT
			((diff_output=0))
		fi
		((counter++))
		echo -ne "$NOCOLOR"
	done
	counter=1
	small_diff=$diff_output
	echo "" && echo "" >> DEEPTHOUGHT
	echo -e "$uni_arrow Comparing with diff/med" && echo -e "$uni_arrow Comparing with diff/med" >> DEEPTHOUGHT
	while [ $counter -le 8 ]
	do
		./obj/$counter.out diff/med > diff.txt
		if ! diff -q diff/med diff.txt > /dev/null ; then
			diff diff/med diff.txt >> DEEPTHOUGHT
			echo -e "$uni_fail BUFFER_SIZE=$counter $diff_ko"
			echo -e "$uni_fail BUFFER_SIZE=$counter $diff_ko" >> DEEPTHOUGHT
			echo -e "$uni_fail error: output differs from diff/med"
			((diff_output=1))
		else
			echo -e "$uni_success BUFFER_SIZE=$counter $diff_ok"
			echo -e "$uni_success BUFFER_SIZE=$counter $diff_ok" >> DEEPTHOUGHT
			((diff_output=0))
		fi
		((counter++))
		echo -ne "$NOCOLOR"
	done
	counter=1
	med_diff=$diff_output
	echo "" && echo "" >> DEEPTHOUGHT
	echo -e "$uni_arrow Comparing with diff/big" && echo -e "$uni_arrow Comparing with diff/big" >> DEEPTHOUGHT
	while [ $counter -le 8 ]
	do
		./obj/$counter.out diff/big > diff.txt
		if ! diff -q diff/big diff.txt > /dev/null ; then
			diff diff/big diff.txt >> DEEPTHOUGHT
			echo -e "$uni_fail BUFFER_SIZE=$counter $diff_ko"
			echo -e "$uni_fail BUFFER_SIZE=$counter $diff_ko" >> DEEPTHOUGHT
			echo -e "$uni_fail error: output differs from diff/big"
			((diff_output=1))
		else
			echo -e "$uni_success BUFFER_SIZE=$counter $diff_ok"
			echo -e "$uni_success BUFFER_SIZE=$counter $diff_ok" >> DEEPTHOUGHT
			((diff_output=0))
		fi
		((counter++))
		echo -ne "$NOCOLOR"
	done
	echo "" && echo "" >> DEEPTHOUGHT
	if [ $diff_output == 0 ] && [ $empty_diff == 0 ] && [ $rly_small_diff == 0 ] && [ $small_diff == 0 ] && [ $med_diff == 0 ] ; then
		echo -e "${GREEN}All good!${NOCOLOR}" && echo -e "${GREEN}All good!${NOCOLOR}" >> DEEPTHOUGHT
	else
		echo -e "${RED}One or more tests failed. Check DEEPTHOUGHT for logs${NOCOLOR}"
		echo -e "${RED}One or more tests failed.${NOCOLOR}" >> DEEPTHOUGHT
	fi
	echo "" && echo "" >> DEEPTHOUGHT
}

function leaks_test()
{
	# Compiling with -fsanitize=address to test for leaks
	leaks_tests=true
	echo -e "${YELLOW}-------------Testing leaks-------------${NOCOLOR}"
	echo -e "${YELLOW}-------------Testing leaks-------------${NOCOLOR}" >> DEEPTHOUGHT
	echo -e "${LIGHTBLUE}$uni_arrow Compiling with BUFFER_SIZE=1" && echo -e "${LIGHTBLUE}$uni_arrow Compiling with BUFFER_SIZE=1" >> DEEPTHOUGHT
	gcc -Wall -Werror -Wextra -g -fsanitize=address -D BUFFER_SIZE=1 src/get_next_line.c src/get_next_line_utils.c mains/main.c -o obj/1_leaks_test.out
	echo -e "${LIGHTBLUE}gcc -Wall -Werror -Wextra -g -fsanitize=address -D BUFFER_SIZE=1 src/get_next_line.c src/get_next_line_utils.c mains/main.c -o obj/1_leaks_test.out" >> DEEPTHOUGHT
	echo -e "${LIGHTBLUE}$uni_arrow Compiling with BUFFER_SIZE=512" && echo -e "${LIGHTBLUE}$uni_arrow Compiling with BUFFER_SIZE=512" >> DEEPTHOUGHT
	gcc -Wall -Werror -Wextra -g -fsanitize=address -D BUFFER_SIZE=512 src/get_next_line.c src/get_next_line_utils.c mains/main.c -o obj/512_leaks_test.out
	echo -e "${LIGHTBLUE}gcc -Wall -Werror -Wextra -g -fsanitize=address -D BUFFER_SIZE=512 src/get_next_line.c src/get_next_line_utils.c mains/main.c -o obj/512_leaks_test.out" >> DEEPTHOUGHT
	echo -ne "${NOCOLOR}\nls -l obj/1_leaks.out obj/512_leaks_test.out\n" >> DEEPTHOUGHT
	ls -l obj/1_leaks_test.out obj/512_leaks_test.out >> DEEPTHOUGHT
	if ! ls obj/1_leaks_test.out || ! ls obj/512_leaks_test.out ; then
		echo -e "$uni_fail ${RED}Compiling failed. Skipping leaks tests..."
		echo -e "$uni_fail ${RED}Compiling failed. Skipping leaks tests..." >> DEEPTHOUGHT
		gcc -Wall -Werror -Wextra -g -fsanitize=address -D BUFFER_SIZE=1 src/get_next_line.c src/get_next_line_utils.c mains/main.c -o obj/1_leaks_test.out 2>> DEEPTHOUGHT
		gcc -Wall -Werror -Wextra -g -fsanitize=address -D BUFFER_SIZE=512 src/get_next_line.c src/get_next_line_utils.c mains/main.c -o obj/1_leaks_test.out 2>> DEEPTHOUGHT
		leaks_tests=false
	fi
	echo -e "${NOCOLOR}" && echo -e "${NOCOLOR}" >> DEEPTHOUGHT
	
	# Testing if leaks are detected by -fsanitize=address
	if [ $leaks_tests == true ] ; then
		if ! ./obj/1_leaks_test.out diff/small > /dev/null ; then
			echo "================================================================="
			./obj/1_leaks_test.out diff/small 2>> DEEPTHOUGHT
			echo "=================================================================" >> DEEPTHOUGHT
			echo -e "$uni_fail [1] Your get_next_line leaks! $diff_ko"
		else
			echo -e "$uni_success [1] Your get_next_line does not leak!   $diff_ok"
		fi
		if ! ./obj/512_leaks_test.out diff/small > /dev/null ; then
			echo "================================================================="
			./obj/512_leaks_test.out diff/small 2>> DEEPTHOUGHT
			echo "=================================================================" >> DEEPTHOUGHT
			echo -e "$uni_fail [512] Your get_next_line leaks! $diff_ko"
		else
			echo -e "$uni_success [512] Your get_next_line does not leak! $diff_ok"	
		fi
	fi
}

function bonus_tests()
{
	# Copying sources
	echo -e "\n${YELLOW}---------Copying bonus sources---------${NOCOLOR}"
	echo -e "\n${YELLOW}---------Copying bonus sources---------${NOCOLOR}" >> DEEPTHOUGHT
	cp $src_path/get_next_line_bonus.c src/get_next_line_bonus.c && echo -e "$uni_arrow cp $src_path/get_next_line_bonus.c src/get_next_line_bonus.c"
	cp $src_path/get_next_line_utils_bonus.c src/get_next_line_utils_bonus.c && echo -e "$uni_arrow cp $src_path/get_next_line_utils_bonus.c src/get_next_line_utils_bonus.c"
	cp $src_path/get_next_line_bonus.h src/get_next_line_bonus.h && echo -e "$uni_arrow cp $src_path/get_next_line_bonus.h src/get_next_line_bonus.h"
	# DEEPTHOUGHT log
	echo -e "$uni_arrow cp $src_path/get_next_line_bonus.c src/get_next_line_bonus.c" >> DEEPTHOUGHT
	echo -e "$uni_arrow cp $src_path/get_next_line_utils_bonus.c src/get_next_line_utils_bonus.c" >> DEEPTHOUGHT
	echo -e "$uni_arrow cp $src_path/get_next_line_bonus.h src/get_next_line_bonus.h" >> DEEPTHOUGHT
	
	echo "" && echo "" >> DEEPTHOUGHT
	if ! ls src/get_next_line_bonus.c || ! ls src/get_next_line_bonus.h || ! ls src/get_next_line_utils_bonus.c ; then
		echo "$uni_fail error: files could not be copied"
		echo "$uni_fail error: files could not be copied" >> DEEPTHOUGHT
		exit_err
	fi

	echo ""
	echo -n "$uni_arrow    " && ls -l src/
	echo -e "$uni_success Files successfully copied into src/" && echo -e "$uni_success Files successfully copied into src/" >> DEEPTHOUGHT
	echo "" && echo "" >> DEEPTHOUGHT

	# Compiling bonus
	echo -e "${YELLOW}------------Compiling bonus------------${NOCOLOR}"
	echo -e "${YELLOW}------------Compiling bonus------------${NOCOLOR}" >> DEEPTHOUGHT
	echo -e "${LIGHTBLUE}$uni_arrow Compiling with BUFFER_SIZE=1" && echo -e "${LIGHTBLUE}$uni_arrow Compiling with BUFFER_SIZE=1" >> DEEPTHOUGHT
	gcc -Wall -Werror -Wextra -D BUFFER_SIZE=1 src/get_next_line_bonus.c src/get_next_line_utils_bonus.c mains/main_bonus.c -o obj/1_bonus_test.out
	echo -e "${LIGHTBLUE}gcc -Wall -Werror -Wextra -D BUFFER_SIZE=1 src/get_next_line_bonus.c src/get_next_line_utils_bonus.c mains/main_bonus.c -o obj/1_bonus_test.out" >> DEEPTHOUGHT
	echo -e "${LIGHTBLUE}$uni_arrow Compiling with BUFFER_SIZE=512" && echo -e "${LIGHTBLUE}$uni_arrow Compiling with BUFFER_SIZE=512" >> DEEPTHOUGHT
	gcc -Wall -Werror -Wextra -D BUFFER_SIZE=512 src/get_next_line_bonus.c src/get_next_line_utils_bonus.c mains/main_bonus.c -o obj/512_bonus_test.out
	echo -e "${LIGHTBLUE}gcc -Wall -Werror -Wextra -D BUFFER_SIZE=512 src/get_next_line_bonus.c src/get_next_line_utils_bonus.c mains/main_bonus.c -o obj/512_bonus_test.out" >> DEEPTHOUGHT
	echo -ne "${NOCOLOR}\nls -l obj/1_leaks.out obj/512_leaks.out\n" >> DEEPTHOUGHT
	ls -l obj/1_bonus_test.out obj/512_bonus_test.out >> DEEPTHOUGHT
	if ! ls obj/1_bonus_test.out || ! ls obj/512_bonus_test.out ; then
		echo -e "$uni_fail ${RED}Compiling failed. Skipping bonus tests... $diff_ko"
		echo -e "$uni_fail ${RED}Compiling failed. Skipping bonus tests... $diff_ko" >> DEEPTHOUGHT
		gcc -Wall -Werror -Wextra -D BUFFER_SIZE=1 src/get_next_line_bonus.c src/get_next_line_utils_bonus.c mains/main_bonus.c -o obj/1_bonus_test.out 2>> DEEPTHOUGHT
		gcc -Wall -Werror -Wextra -D BUFFER_SIZE=512 src/get_next_line_bonus.c src/get_next_line_utils_bonus.c mains/main_bonus.c -o obj/1_bonus_test.out 2>> DEEPTHOUGHT
		exit_err
	fi
	echo -e "${NOCOLOR}" && echo -e "${NOCOLOR}" >> DEEPTHOUGHT
	
	
	# Comparing output and input file with diff/*
	diff_output=1
	echo -e "${YELLOW}--------Comparing bonus outputs--------${NOCOLOR}"
	echo -e "${YELLOW}--------Comparing bonus outputs--------${NOCOLOR}" >> DEEPTHOUGHT
	echo ""
	echo -e "$uni_arrow Comparing with diff/bonus_small" && echo -e "$uni_arrow Comparing with diff/bonus_small" >> DEEPTHOUGHT
	./obj/1_bonus_test.out diff/bonus_small1 diff/bonus_small2 > diff.txt
	./obj/512_bonus_test.out diff/bonus_small1 diff/bonus_small2 > diff2.txt
	if ! diff -q diff/bonus_small diff.txt > /dev/null ; then
		diff diff/bonus_small diff.txt >> DEEPTHOUGHT
		echo -e "$uni_fail BUFFER_SIZE=1   $diff_ko"
		echo -e "$uni_fail BUFFER_SIZE=1   $diff_ko" >> DEEPTHOUGHT
		echo -e "$uni_fail error: output differs from diff/bonus_small"
		((diff_output=1))
	else
		echo -e "$uni_success BUFFER_SIZE=1   $diff_ok"
		echo -e "$uni_success BUFFER_SIZE=1   $diff_ok" >> DEEPTHOUGHT
		((diff_output=0))
	fi
	if ! diff -q diff/bonus_small diff2.txt > /dev/null ; then
		diff diff/bonus_small diff2.txt >> DEEPTHOUGHT
		echo -e "$uni_fail BUFFER_SIZE=512 $diff_ko"
		echo -e "$uni_fail BUFFER_SIZE=512 $diff_ko" >> DEEPTHOUGHT
		echo -e "$uni_fail error: output differs from diff/bonus_small"
		((diff_output=1))
	else
		echo -e "$uni_success BUFFER_SIZE=512 $diff_ok"
		echo -e "$uni_success BUFFER_SIZE=512 $diff_ok" >> DEEPTHOUGHT
		((diff_output=0))
	fi
	echo -ne "$NOCOLOR"
	bonus_small_diff=$diff_output
	echo "" && echo "" >> DEEPTHOUGHT

	# Comparing with diff/bonus_med
	echo -e "$uni_arrow Comparing with diff/bonus_med" && echo -e "$uni_arrow Comparing with diff/bonus_med" >> DEEPTHOUGHT
	./obj/1_bonus_test.out diff/bonus_med1 diff/bonus_med2 > diff.txt
	./obj/512_bonus_test.out diff/bonus_med1 diff/bonus_med2 > diff2.txt
	if ! diff -q diff/bonus_med diff.txt > /dev/null ; then
		diff diff/bonus_med diff.txt >> DEEPTHOUGHT
		echo -e "$uni_fail BUFFER_SIZE=1   $diff_ko"
		echo -e "$uni_fail BUFFER_SIZE=1   $diff_ko" >> DEEPTHOUGHT
		echo -e "$uni_fail error: output differs from diff/bonus_med"
		((diff_output=1))
	else
		echo -e "$uni_success BUFFER_SIZE=1   $diff_ok"
		echo -e "$uni_success BUFFER_SIZE=1   $diff_ok" >> DEEPTHOUGHT
		((diff_output=0))
	fi
	if ! diff -q diff/bonus_med diff2.txt > /dev/null ; then
		diff diff/bonus_med diff2.txt >> DEEPTHOUGHT
		echo -e "$uni_fail BUFFER_SIZE=512 $diff_ko"
		echo -e "$uni_fail BUFFER_SIZE=512 $diff_ko" >> DEEPTHOUGHT
		echo -e "$uni_fail error: output differs from diff/bonus_med"
		((diff_output=1))
	else
		echo -e "$uni_success BUFFER_SIZE=512 $diff_ok"
		echo -e "$uni_success BUFFER_SIZE=512 $diff_ok" >> DEEPTHOUGHT
		((diff_output=0))
	fi
	echo -ne "$NOCOLOR"
	bonus_med_diff=$diff_output
	echo "" && echo "" >> DEEPTHOUGHT

	# Comparing with diff/bonus_big
	echo -e "$uni_arrow Comparing with diff/bonus_big" && echo -e "$uni_arrow Comparing with diff/bonus_big" >> DEEPTHOUGHT
	./obj/1_bonus_test.out diff/bonus_big1 diff/bonus_big2 > diff.txt
	./obj/512_bonus_test.out diff/bonus_big1 diff/bonus_big2 > diff2.txt
	if ! diff -q diff/bonus_big diff.txt > /dev/null ; then
		diff diff/bonus_big diff.txt >> DEEPTHOUGHT
		echo -e "$uni_fail BUFFER_SIZE=1   $diff_ko"
		echo -e "$uni_fail BUFFER_SIZE=1   $diff_ko" >> DEEPTHOUGHT
		echo -e "$uni_fail error: output differs from diff/bonus_big"
		((diff_output=1))
	else
		echo -e "$uni_success BUFFER_SIZE=1   $diff_ok"
		echo -e "$uni_success BUFFER_SIZE=1   $diff_ok" >> DEEPTHOUGHT
		((diff_output=0))
	fi
	if ! diff -q diff/bonus_big diff2.txt > /dev/null ; then
		diff diff/bonus_big diff2.txt >> DEEPTHOUGHT
		echo -e "$uni_fail BUFFER_SIZE=512 $diff_ko"
		echo -e "$uni_fail BUFFER_SIZE=512 $diff_ko" >> DEEPTHOUGHT
		echo -e "$uni_fail error: output differs from diff/bonus_big"
		((diff_output=1))
	else
		echo -e "$uni_success BUFFER_SIZE=512 $diff_ok"
		echo -e "$uni_success BUFFER_SIZE=512 $diff_ok" >> DEEPTHOUGHT
		((diff_output=0))
	fi
	echo -ne "$NOCOLOR"
	bonus_big_diff=$diff_output
	echo "" && echo "" >> DEEPTHOUGHT
	if [ $bonus_small_diff == 0 ] && [ $bonus_med_diff == 0 ] && [ $bonus_big_diff == 0 ] ; then
		echo -e "${GREEN}All good!${NOCOLOR}" && echo -e "${GREEN}All good!${NOCOLOR}" >> DEEPTHOUGHT
	else
		echo -e "${RED}One or more bonus tests failed. Check DEEPTHOUGHT for logs${NOCOLOR}"
		echo -e "${RED}One or more bonus tests failed.${NOCOLOR}" >> DEEPTHOUGHT
	fi
	echo "" && echo "" >> DEEPTHOUGHT
	
	# Compiling with -fsanitize=address to test for leaks
	leaks_tests=true
	echo -e "${YELLOW}----------Testing bonus leaks----------${NOCOLOR}"
	echo -e "${YELLOW}----------Testing bonus leaks----------${NOCOLOR}" >> DEEPTHOUGHT
	echo -e "${LIGHTBLUE}$uni_arrow Compiling with BUFFER_SIZE=1" && echo -e "${LIGHTBLUE}$uni_arrow Compiling with BUFFER_SIZE=1" >> DEEPTHOUGHT
	gcc -Wall -Werror -Wextra -g -fsanitize=address -D BUFFER_SIZE=1 src/get_next_line_bonus.c src/get_next_line_utils_bonus.c mains/main_bonus.c -o obj/1_bonus_leaks_test.out
	echo -e "${LIGHTBLUE}gcc -Wall -Werror -Wextra -g -fsanitize=address -D BUFFER_SIZE=1 src/get_next_line_bonus.c src/get_next_line_utils_bonus.c mains/main_bonus.c -o obj/1_bonus_leaks_test.out" >> DEEPTHOUGHT
	echo -e "${LIGHTBLUE}$uni_arrow Compiling with BUFFER_SIZE=512" && echo -e "${LIGHTBLUE}$uni_arrow Compiling with BUFFER_SIZE=512" >> DEEPTHOUGHT
	gcc -Wall -Werror -Wextra -g -fsanitize=address -D BUFFER_SIZE=512 src/get_next_line_bonus.c src/get_next_line_utils_bonus.c mains/main_bonus.c -o obj/512_bonus_leaks_test.out
	echo -e "${LIGHTBLUE}gcc -Wall -Werror -Wextra -g -fsanitize=address -D BUFFER_SIZE=512 src/get_next_line_bonus.c src/get_next_line_utils_bonus.c mains/main_bonus.c -o obj/512_bonus_leaks_test.out" >> DEEPTHOUGHT
	echo -ne "${NOCOLOR}\nls -l obj/1_bonus_leaks.out obj/512_bonus_leaks_test.out\n" >> DEEPTHOUGHT
	ls -l obj/1_bonus_leaks_test.out obj/512_bonus_leaks_test.out >> DEEPTHOUGHT
	if ! ls obj/1_bonus_leaks_test.out || ! ls obj/512_bonus_leaks_test.out ; then
		echo -e "$uni_fail ${RED}Compiling failed. Skipping leaks tests..."
		echo -e "$uni_fail ${RED}Compiling failed. Skipping leaks tests..." >> DEEPTHOUGHT
		gcc -Wall -Werror -Wextra -g -fsanitize=address -D BUFFER_SIZE=1 src/get_next_line_bonus.c src/get_next_line_utils_bonus.c mains/main_bonus.c -o obj/1_bonus_leaks_test.out 2>> DEEPTHOUGHT
		gcc -Wall -Werror -Wextra -g -fsanitize=address -D BUFFER_SIZE=512 src/get_next_line_bonus.c src/get_next_line_utils_bonus.c mains/main_bonus.c -o obj/1_bonus_leaks_test.out 2>> DEEPTHOUGHT
		leaks_tests=false
	fi
	echo -e "${NOCOLOR}" && echo -e "${NOCOLOR}" >> DEEPTHOUGHT
	
	# Testing if leaks are detected by -fsanitize=address
	if [ $leaks_tests == true ] ; then
		if ! ./obj/1_bonus_leaks_test.out diff/bonus_small1 diff/bonus_small2 > /dev/null ; then
			echo "================================================================="
			./obj/1_bonus_leaks_test.out diff/bonus_small1 diff/bonus_small2 2>> DEEPTHOUGHT
			echo "=================================================================" >> DEEPTHOUGHT
			echo -e "$uni_fail [1] Your get_next_line_bonus leaks! $diff_ko"
		else
			echo -e "$uni_success [1] Your get_next_line_bonus does not leak!   $diff_ok"
		fi
		if ! ./obj/512_bonus_leaks_test.out diff/bonus_small1 diff/bonus_small2 > /dev/null ; then
			echo "================================================================="
			./obj/512_bonus_leaks_test.out diff/bonus_small1 diff/bonus_small2 2>> DEEPTHOUGHT
			echo "=================================================================" >> DEEPTHOUGHT
			echo -e "$uni_fail [512] Your get_next_line_bonus leaks! $diff_ko"
		else
			echo -e "$uni_success [512] Your get_next_line_bonus does not leak! $diff_ok"	
		fi
	fi


}

function normal_tests()
{
	src_cpy_no_bonus
	no_bonus_compilation
	normal_diff_tests
	leaks_test
	cleanup
	exit 0
}

if [ $# == 0 ] ; then
	startup_welcome
	normal_tests
fi

function syntax_err()
{
	echo -ne "${RED}Usage:${NOCOLOR}${NOCOLOR} ./gnl-trustfinder [-\$f] [\$option]\n"
	echo -ne "       ./gnl-trustfinder [--\$flag] [\$option]\n\n"
	echo -e "  ${LIGHTCYAN}-h | --help    ${NOCOLOR}display this message"
	echo -e "  ${LIGHTCYAN}-t | --test    ${NOCOLOR}test flag"
	echo -ne "\noptions:
        ${LIGHTCYAN}n | normal${NOCOLOR}     normal mode
        ${LIGHTCYAN}l | leaks ${NOCOLOR}     only tests leaks
        ${LIGHTCYAN}b | bonus ${NOCOLOR}     only tests bonus
        ${LIGHTCYAN}a | all   ${NOCOLOR}     all tests
	"
	echo -ne "\n  ${LIGHTCYAN}-s | --skip ${NOCOLOR}   skip flag\n\n"
	echo -e "options:
        ${LIGHTCYAN}---no options avalaible yet---${NOCOLOR}"
	echo -ne "\n${GREEN}Examples:${NOCOLOR}
These commands will run the same tests
${LIGHTCYAN}./gnl_trustfinder -t all${NOCOLOR}
${LIGHTCYAN}./gnl_trustfinder -t a${NOCOLOR}
${LIGHTCYAN}./gnl_trustfinder --test all${NOCOLOR}
${LIGHTCYAN}./gnl_trustfinder --test a${NOCOLOR}\n"
	exit_err
}
case $1 in
	-t | --test)
		if [ "$2" == "normal" ] || [ "$2" == "n" ] ; then
			startup_welcome
			normal_tests
		elif [ "$2" == "leaks" ] || [ "$2" == "l" ] ; then
			startup_welcome
			src_cpy_no_bonus
			no_bonus_compilation
			leaks_test
		elif [ "$2" == "bonus" ] || [ "$2" == "b" ] ; then
			startup_welcome
			bonus_tests
		elif [ "$2" == "all" ] || [ "$2" == "a" ] ;then
			startup_welcome
			src_cpy_no_bonus
			no_bonus_compilation
			normal_diff_tests
			leaks_test
			bonus_tests
		else
			syntax_err
		fi
	;;
	-h | --help) syntax_err;;
	*) syntax_err;;

esac
echo ""

exit 0
