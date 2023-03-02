#!/usr/bin/perl

# straight up magic for including modules in same dir
# as main.pl
use File::Basename;
use lib dirname (__FILE__);

use XMLEventReader;

$INPUT_XML_FILE = "MapClick.xml";

$er = new XMLEventReader($INPUT_XML_FILE);


