#!/usr/bin/env bash

patch RPN_EVAL.java _magpie/RPN_EVALBug.diff
# srcml RPN_EVAL.java > _magpie/RPN_EVALBug.java.xml
mv _magpie/RPN_EVALBug.java.xml RPN_EVAL.java.xml
