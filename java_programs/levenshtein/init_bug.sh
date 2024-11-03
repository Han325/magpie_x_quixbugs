#!/usr/bin/env bash

patch LEVENSHTEIN.java _magpie/LEVENSHTEINBug.diff
# srcml LEVENSHTEIN.java > _magpie/LEVENSHTEINBug.java.xml
mv _magpie/LEVENSHTEINBug.java.xml LEVENSHTEIN.java.xml
