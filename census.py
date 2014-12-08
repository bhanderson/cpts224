import csv
import sys

f = open(sys.argv[1],'rb')
rownum= 0
highpop = None
highpopname = None
lowpop = None
lowpopname = None
highwater = None
highwatername = None
lowwater = None
lowwatername = None

try:
    reader = csv.reader(f)
    for row in reader:
        if rownum == 0:
            rownum += 1
            #print "Cournty".center(15), "Population/sq mile".center(20), "% Water"
            print "%15s %25s %10s" % ("County", "Population/sq mile", "%Water")
            continue
        else:
            name = row[0]
            pop = float(row[1])
            land = float(row[2])
            water = float(row[3])
            if highpop == None:
                highpop = pop/land
                highpopname = row[0]
            elif highpop < pop/land:
                highpop = pop/land
                highpopname = row[0]
            if lowpop == None:
                lowpop = pop/land
                lowpopname = row[0]
            elif lowpop > pop/land:
                lowpop = pop/land
                lowpopname = row[0]
            if highwater == None:
                highwater = 100*(water/(land+water))
                highwatername = row[0]
            elif highwater < 100*(water/(land+water)):
                highwater = 100*(water/(land+water))
                highwatername = row[0]
            if lowwater == None:
                lowwater = 100*(water/(land+water))
                lowwatername = row[0]
            elif lowwater > 100*(water/(land+water)):
                lowwater = 100*(water/(land+water))
                lowwatername = row[0]
            print "%19s %15.2f %15.2f" % (name, pop/land,
                    100*(water/(water+land)))
    print "Highest Population Density: %s, %.2f people/sq mi" % (highpopname, highpop)
    print "Lowest Population Density: %s, %.2f people/sq mi" % (lowpopname, lowpop)
    print "Highest percentage of water: %s, %.2f%% water" % (highwatername, highwater)
    print "Lowest percentage of water: %s, %.2f%% water" % (lowwatername, lowwater)
finally:
    f.close()
