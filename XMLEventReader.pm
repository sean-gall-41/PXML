#!/usr/bin/perl

use XMLEvent;

package XMLEventReader;

sub new {
  my $class = shift;
  my $self = {};
  my $file_name = shift; # expect arg to be a reference to an array, I think
  open(XML_DATA, $file_name) or die "[ERROR]: Failed to open $file_name, $!";

  my @line_buf = <XML_DATA>;
  my $buf_id = 0;
  foreach $line (@line_buf) {
    my $line_id = 0;
    my $line_len = length($line);
    my $tag_open_id = 0;
    my $tag_close_id = 0;
    my @line_tags;
    my %line_tags_ids;
    while ($line_id < $line_len) {
      $char = substr($line, $line_id, 1);
      if ($char eq "<") {
        $tag_open_id = $line_id;
      } elsif ($char eq ">") {
        $tag_close_id = $line_id;
        my $tag_len = $tag_close_id - $tag_open_id;
        my $tag = substr($line, $tag_open_id, $tag_len+1);
        push(@line_tags, $tag);
        $line_tags_ids{$tag} = [$tag_open_id, $tag_close_id];
      }
      $line_id += 1;
    }
    my $num_tags = @line_tags;
    for $tag (@line_tags) { # looping over line_tags works for both single and double tag lines
      if (substr($tag, 1, 1) eq "/") {
        $self{substr($tag, 2, length($tag)-3)} = new EndElement(new OwnedName("", "", ""));
      } else {
        $self{substr($tag, 1, length($tag)-2)} = new StartElement(new OwnedName("", "", ""), [], new NameSpace);
      }
    }
    if ($num_tags == 2) { # only for two tags on a line do we emit a characters event
      my $content_start = @{$line_tags_ids{@line_tags[0]}}[1]+1;
      my $content_end = @{$line_tags_ids{@line_tags[1]}}[0];
      my $content_len = $content_end - $content_start;
      my $line_content = substr($line, $content_start, $content_len);
      $self{$line_content} = new Characters($line_content);
    }
  }
  close(XML_DATA);
  bless $self, $class;
  return $self;
}

1;
