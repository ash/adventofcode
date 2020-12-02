#!/usr/bin/env raku

my @digits = 'input.txt'.IO.slurp.comb;

my $size = @digits.elems;
my $step = ($size / 2).Int;

my $count = 0;
for ^@digits.elems -> $n {
    $count += @digits[$n] if @digits[$n] == @digits[($n + $step) % $size];
}

say $count; # 1244
