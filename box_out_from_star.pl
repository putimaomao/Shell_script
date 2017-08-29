#!/usr/bin/perl -w
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

my $box_size = $ARGV[2];

my %record;

open(IN, "$star_in") or die;
while (<IN>) {
    if ($_ =~ /^\s+\d+/) {
        my @arr =split(/\s+/, $_);
        my $coorx = trim($arr[11]);
        my $coory = trim($arr[12]);
        $coorx = substr($coorx, 0, length($coorx)-7) - ($box_size/2);
        $coory = substr($coory, 0, length($coory)-7) - ($box_size/2);
        my $path = trim($arr[14]);
        print $path."\n";
        my $file = basename($path);
        print $file."\n";
        push (@{$record{$file}}, "$coorx\t$coory\t$box_size\t$box_size\n");        
    }
}
close IN;

chdir($box_out);
my @key = keys(%record);
foreach my $name (@key){
    my $box_name = substr ($name ,0, length($name)-4);
    open(OUT, ">$box_name.box") or die;
    foreach my $i (@{$record{$name}}){
        print OUT $i;
    }
    close OUT;
}   
chdir("..");

