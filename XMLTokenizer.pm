#!/usr/bin/perl

package XMLTokenizer;

sub new {
  my $class = shift;
  my $self = {
    _filename => "",
    _tags => {},
  };
  bless $self, $class;
  return $self;
}

1;
