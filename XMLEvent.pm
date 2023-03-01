#!/usr/bin/perl

use constant {
  vers10 => 'vers10',
  vers11 => 'vers11',
};

use constant {
  None => 'None',
  Some => 'Some',
};

package StartDocument;

sub new {
  my $class = shift;
  my $self = {
    _version => shift, # use constant above, either vers10, or vers11
    _encoding => shift, # a string
    _standalone => shift, # a string
  };
  bless $self, $class;
  return $self;
}

# really just a string, but make object so fits into same framework
package EndDocument;

sub new {
  my $class = shift;
  my $self = {};
  bless $self, $class;
  return $self;
}

package ProcessingInstruction;

sub new {
  my $class = shift;
  my $self = {
    _name => shift, # a string
    _data => shift, # a string
  };
  bless $self, $class;
  return $self;
}

package OwnedName;

sub new {
  my $class = shift;
  my $self = {
    _local_name => shift, # a astring
    _namespace => shift, # a string
    _prefix => shift, # a string
  };
  bless $self, $class;
  return $self;
}

package OwnedAttrib;

sub new {
  my $class = shift;
  my $self = {
    _name => shift, # an Owned name
    _value => shift, # a string
  };
  bless $self, $class;
  return $self;
}

package Namespace;

sub new {
  my $class = shift;
  my $self = {}; # just a hash, will be between strings, will have methods to add things
  bless $self, $class;
  return $self;
}

package StartElement;

sub new {
  my $class = shift;
  my $self = {
    _name => shift, # an Owned Name
    _attribs => shift, # array of Owned Attribs
    _namespace => shift, # a namespace
  };
  bless $self, $class;
  return $self;
}

package EndElement;

sub new {
  my $class = shift;
  my $self = {
    _name => shift, # an Owned Name
  };
  bless $self, $class;
  return $self;
}

package CData;

sub new {
  my $class = shift;
  my $self = {
    _name => shift, # a string
  };
  bless $self, $class;
  return $self;
}

package Comment;

sub new {
  my $class = shift;
  my $self = {
    _name => shift, # a string
  };
  bless $self, $class;
  return $self;
}

package Characters;

sub new {
  my $class = shift;
  my $self = {
    _name => shift, # a string
  };
  bless $self, $class;
  return $self;
}

package Whitespace;

sub new {
  my $class = shift;
  my $self = {
    _name => shift, # a string
  };
  bless $self, $class;
  return $self;
}

1;
