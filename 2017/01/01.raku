#!/usr/bin/env raku

my @digits = 'input.txt'.IO.slurp.comb;

@digits.push(@digits[0]);

my $count = 0;
for 0 .. @digits.elems - 2 -> $n {
    $count += @digits[$n] if @digits[$n] == @digits[$n + 1];
}

say $count; # 1251
