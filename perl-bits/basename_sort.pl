#!/usr/bin/env perl

use strict;

my @lines = <STDIN>;
@lines = sort basename_sort @lines;
foreach( @lines ) {
    print $_;
}

sub basename_sort() {
    my $i = 0;
    my @data1 = split('/', $a);
    my @data2 = split('/', $b);
    my $res;
    
    do {
        $i += 1;
        my $name1 = $data1[@data1 - $i];
        my $name2 = $data2[@data2 - $i];
        $res = lc($name1) cmp lc($name2);
    } while ($res == 0);
    
    return $res;
}
