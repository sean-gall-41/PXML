#!/usr/bin/perl

use XMLEvent;

package XMLEventReader;

sub new {
  my $class = shift;
  my $self = {};
  my $file_name = shift; # expect arg to be a reference to an array, I think
  open(XML_DATA, $file_name) or die "[ERROR]: Failed to open $file_name, $!";

  @line_buf = <XML_DATA>;
  # TODO: populate self withXMLEvents, ie parse the file in terms of events
  # described in XMLEvent type
  foreach $line (@line_buf) {
    print("$line\n");
  }
  close(XML_DATA);
  bless $self, $class;
  return $self;
}

1;
