#!/usr/bin/perl

use XMLTokenizer;
package XMLParser;
sub new {
  my $class = shift;
  my $self = {
    _filename => "",
    _tags => {},
  };
  bless $self, $class;
  return $self;
}

sub parse {
  my ( $self, $filename ) = @_;
  $self->{_filename} = $filename if defined($filename);
  open(XML_DATA, "<$self->{_filename}") or die "[ERROR]: Failed to open $self->{_filename}, $!";
  
  my @xml_data_lines = <XML_DATA>;
  my @tokens = ();
  foreach $line (@xml_data_lines) {
    my @line_tokens = split(' ', $line);
    foreach $token (@line_tokens) {
      push(@tokens, $token);
    }
  }

  foreach $token (@tokens) {
    print("$token\n");
  }
  
  close(XML_DATA) || die "[ERROR]: Couldn't close $self->{_filename} properly";
}

1;
