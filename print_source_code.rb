#!/usr/bin/env ruby

#This program returns its own source code. 
File.open(__FILE__, "r") {|file| puts file.read}
