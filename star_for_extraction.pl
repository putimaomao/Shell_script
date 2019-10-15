#!/usr/bin/perl -w
# perl sccript star outfolder
use strict;
use File::Basename;

sub trim($)
{
        my $string = shift;
        $string =~ s/^\s+//;
        $string =~ s/\s+$//;
        return $string;
}

my $star_in = $ARGV[0];
my $box_out = $ARGV[1];
mkdir($box_out);

my %record;

open(IN, "$star_in") or die;
while (<IN>) {
    if ($_ =~ /\.mrc /) {
        my @arr =split(/\s+/, $_);
        my $coorx = trim($arr[1]);
        my $coory = trim($arr[2]);
        my $path = trim($arr[0]);
        #print $path."\n";
        my $file = basename($path);
        print $file."\n";
        push (@{$record{$file}}, "$coorx\t$coory\n");        
    }
}
close IN;

chdir($box_out);
my @key = keys(%record);
foreach my $name (@key){
    my $box_name = substr ($name ,0, length($name)-4);
    open(OUT, ">$box_name.star") or die;
    print OUT "# RELION; version 3.0-beta-2

data_

loop_ 
_rlnCoordinateX #1 
_rlnCoordinateY #2 \n";
    foreach my $i (@{$record{$name}}){
        print OUT " $i";
    }
    close OUT;
}   
chdir("..");

