#!/usr/bin/env bash

patch MERGESORT.java _magpie/MERGESORTBug.diff
# srcml MERGESORT.java > _magpie/MERGESORTBug.java.xml
mv _magpie/MERGESORTBug.java.xml MERGESORT.java.xml
