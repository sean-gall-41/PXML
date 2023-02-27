#!/usr/bin/perl

# straight up magic for including modules in same dir
# as main.pl
use File::Basename;
use lib dirname (__FILE__);

use XMLParser;

$INPUT_XML_FILE = "simple.xml";

$xml_parser = new XMLParser();

$xml_parser->parse($INPUT_XML_FILE);

