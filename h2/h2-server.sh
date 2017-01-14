#!/bin/sh
dir=$(dirname "$0")
java -cp "$dir/h2-1.3.175.jar:" h2*.jar org.h2.tools.Recover

mkdir old
move qie.h2.db old\qie.h2.db
move qie.trace.db old\qie.trace.db
java -cp h2*.jar org.h2.tools.RunScript -url jdbc:h2:./qie -user sa -script qie.h2.sql
del qie.h2.sql
