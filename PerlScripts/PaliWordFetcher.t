#!/usr/bin/perl
use Test::Simple tests => 3;
use Moose::Autobox;
use List::MoreUtils ':all';
require "PaliWordFetcher2.pm";

my $wordFetcher = PaliWordFetcher2->new();
my @words = $wordFetcher->GetUniqueWords('http://www.tipitaka.org/khmr/cscd/abh01a.att0.xml');
#Run tests
ok(@words->length()>0, "Word array greater than 0");
ok((all { defined($_) } @words), "All words defined");
ok((all{$_ =~/\A\S+\z/} @words),"No empty words founds");