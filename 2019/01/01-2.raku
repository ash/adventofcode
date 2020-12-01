#!/usr/bin/env raku

my @data = 'data.txt'.IO.lines;

multi sub fuel($mass where * <= 0) {
    return -$mass;
}

multi sub fuel($mass) {
    my $fuel = ($mass / 3).Int - 2;

    return $fuel + fuel($fuel);
}

say [+] @data.map({fuel($_)}); # 5230169
