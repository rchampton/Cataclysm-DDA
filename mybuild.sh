#!/bin/bash

echo Building CataclysmDDA
time make -j6 TILES=1 SOUND=1 RELEASE=0 USE_HOME_DIR=1
