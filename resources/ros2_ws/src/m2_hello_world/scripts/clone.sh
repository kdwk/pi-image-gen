#!/bin/bash

# clone dependencies
if [ ! -d "$PWD/src/m2b" ]; then git clone git@github.com:m2robocon/m2b.git $PWD/src/m2b; fi
if [ ! -d "$PWD/src/trolly" ]; then git clone git@github.com:m2robocon/trolly.git $PWD/src/trolly; fi