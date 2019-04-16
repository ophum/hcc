#!/bin/bash

try() {
  expected="$1"
  input="$2"

  ./hcc "$input" > tmp.s
  gcc -o tmp tmp.s
  ./tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$expected expected, but got $actual"
    exit 1
  fi
}

# step 1
try 0 0
try 42 42

# step 2
try 21 '5+20-4'

# step 3
try 41 " 12 + 34 - 5 "


echo OK
