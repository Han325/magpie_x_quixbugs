#!/usr/bin/env bash

patch DETECT_CYCLE.java _magpie/DETECT_CYCLEBug.diff
# srcml DETECT_CYCLE.java > _magpie/DETECT_CYCLEBug.java.xml
mv _magpie/DETECT_CYCLEBug.java.xml DETECT_CYCLE.java.xml
