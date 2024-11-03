#!/usr/bin/env bash

patch KNAPSACK.java _magpie/KNAPSACKBug.diff
# srcml KNAPSACK.java > _magpie/KNAPSACKBug.java.xml
mv _magpie/KNAPSACKBug.java.xml KNAPSACK.java.xml
