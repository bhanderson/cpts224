#!/usr/bin/perl -w
use strict;
my ($name,$pop,$land,$water,$highpop,$highpopname,$lowpop,$lowpopname,
	$highwater,$highwatername,$lowwater,$lowwatername,$popdense,$waterdense);
printf "%15s %25s %10s\n", "County", "Population/sq mile", "%Water";
while (<>) {
	# skip the header
	next if /^County Name/;
	chomp;
	# get the line
	($name,$pop,$land,$water) = (split ",");
	# define population min and maxes
	if (!defined($highpop)){
		$highpop = $pop/$land;
		$highpopname = $name;
	}
	if (!defined($lowpop)){
		$lowpop = $pop/$land;
		$lowpopname = $name
	}
	if (!defined($highwater)){
		$highwater = 100*($water/($water+$land));
		$highwatername = $name;
	}
	if (!defined($lowwater)){
		$lowwater = 100*($water/($water + $land));
		$lowwatername = $name;
	}
	# conditionals
	if ($highpop < $pop/$land){
		$highpop = $pop/$land;
		$highpopname = $name;
	}
	if ($lowpop > $pop/$land){
		$lowpop = $pop/$land;
		$lowpopname = $name;
	}
	if ($highwater < 100*($water/($water+$land))){
		$highwater = 100*($water/($water+$land));
		$highwatername = $name
	}
	if ($lowwater > 100*($water/($water+$land))){
		$lowwater = 100*($water/($water+$land));
		$lowwatername = $name
	}
	printf "%19s %15.2f %15.2f\n", $name, $pop/$land, 100*($water/($water+$land));
}
printf "Highest Population Density: %s, %.2f people/sq mi\n",
		$highpopname, $highpop;
printf "Lowest Population Density: %s, %.2f people/sq mi\n",
		$lowpopname, $lowpop;
printf "Highest percentage of water: %s, %.2f%% water\n",
		$highwatername, $highwater;
printf "Lowest percentage of water: %s, %.2f%% water\n",
		$lowwatername, $lowwater;

