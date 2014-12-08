awk -F, '
BEGIN {
printf("%15s %25s %10s\n", "County", "Population/sq mile", "% Water")
}
{if (NR > 1){
	printf("%19s %15.2f %15.2f\n", $1,$2/($3+$4), 100*($4/($3+$4)))
	if (biggest < $2/$3){
		biggest = $2/$3
		biggestname = $1
	}
	if (NR == 2){
		smallest = $2/$3
		smallestname = $1
		lowwater = 100*($4/($3+$4))
		lowwatername = $1
	}
	if (smallest > $2/$3){
		smallest = $2/$3
		smallestname = $1
	}
	if (lowwater > 100*($4/($3+$4))){
		lowwater = 100*($4/($3+$4))
		lowwatername = $1
	}
	if (highwater < 100*($4/($3+$4))){
		highwater = 100*($4/($3+$4))
		highwatername = $1
	}
}
}
END {
printf("Highest Population Density: %s, %.2f people/sq mi\n",
biggestname, biggest)

printf("Lowest Population Density: %s, %.2f people/sq mi\n", smallestname,
smallest)

printf("Highest percentage of water: %s, %.2f%% water\n", highwatername, highwater)

printf("Lowest percentage of water: %s, %.2f%% water\n", lowwatername, lowwater)

}
' census2010.txt
