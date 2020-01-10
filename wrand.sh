#!/bin/bash

# Random Word Generator
# linuxconfig.org
#
# jan 2019 - my customizations

#if [ $# -ne 1 ]
#then
#echo "Please specify how many random words would you like to generate !" 1>&2
#echo "example: ./random-word-generator 3" 1>&2
#echo "This will generate 3 random words" 1>&2
#exit 0
#fi

words=2

# Constants
X=0
ALL_NON_RANDOM_WORDS=/usr/share/dict/british-english

cat $ALL_NON_RANDOM_WORDS | grep -P "^[\x{0061}-\x{007A}]{5,8}$" > /tmp/words

# total number of non-random words available
non_random_words=`cat /tmp/words |wc -l`

# while loop to generate random words
# number of random generated words depends on supplied argument
#while [ "$X" -lt "$words" ]
#do
#random_number=`od -N3 -An -i /dev/urandom |
#awk -v f=0 -v r="$non_random_words" '{printf "%i\n", f + r * $1 / 16777216}'`
#sed `echo $random_number`"q;d" /tmp/words
#  let "X = X + 1"
#done

random_number=`od -N3 -An -i /dev/urandom |
awk -v f=0 -v r="$non_random_words" '{printf "%i\n", f + r * $1 / 16777216}'`
w1=$(sed `echo $random_number`"q;d" /tmp/words)

random_number=`od -N3 -An -i /dev/urandom |
awk -v f=0 -v r="$non_random_words" '{printf "%i\n", f + r * $1 / 16777216}'`
w2=$(sed `echo $random_number`"q;d" /tmp/words)

cat $ALL_NON_RANDOM_WORDS | grep -P "^[\x{0061}-\x{007A}]{3}$" > /tmp/words
non_random_words=`cat /tmp/words |wc -l`
random_number=`od -N3 -An -i /dev/urandom |
awk -v f=0 -v r="$non_random_words" '{printf "%i\n", f + r * $1 / 16777216}'`
w3=$(sed `echo $random_number`"q;d" /tmp/words)

echo "$w1-$w2.$w3"

rm -f /tmp/words
