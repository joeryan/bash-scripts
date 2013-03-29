#: script						: random.sh
#: Description			: creates four random numbers stored in variables and
#											outputs to both the screen and a file named random.txt

printf -v rand1 $RANDOM'.'$RANDOM
printf -v rand2 $RANDOM'.'$RANDOM
printf -v rand3 $RANDOM'.'$RANDOM
printf -v rand4 $RANDOM'.'$RANDOM
printf "%s\n" $rand1 $rand2 $rand3 $rand4 | tee random.txt