#!/bin/sh

valac -X -ldl -o main  core/main.vala 

g++ testPlugin/plugin.cpp -ldl --shared -fPIC -o plugin.so
