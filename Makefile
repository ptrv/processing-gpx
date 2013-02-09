
PROCESSING_CORE = deps/core.jar

SRC_FILES = \
	GPX.java \
	GPXTrack.java \
	GPXWayPoint.java \
	GPXPoint.java \
	GPXTrackSeg.java

library/gpx.jar: $(SRC_FILES) Makefile
	javac -cp $(PROCESSING_CORE) -sourcepath src -d . -target 1.1 -source 1.3 $(SRC_FILES) 
	jar -Mcvf library/gpx.jar tomc/gpx/*.class

test:
	java -cp $(PROCESSING_CORE):library/gpx.jar tomc.gpx.GPX newforest.gpx

clean:
	rm -f library/gpx.jar
	rm -rf tomc
