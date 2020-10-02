#!/bin/bash

# create schema
sqlcmd < ddl.sql


# Examples
FILES=examples/*.csv
for f in $FILES
do
  echo "Loading file $f..."
  # take action on each file. $f store current file name
  filename=$(basename "$f")
  # extension="${filename##*.}"
  filename="${filename%.*}"
  csvloader --file $f $filename -r ./log
done


FILES=data/*.csv
for f in $FILES
do
  echo "Loading file $f..."
  # take action on each file. $f store current file name
  filename=$(basename "$f")
  # extension="${filename##*.}"
  filename="${filename%.*}"
  csvloader --skip 1 --file $f $filename -r ./log
done


