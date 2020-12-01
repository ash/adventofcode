#!/usr/bin/env raku

my @program = 'program.txt'.IO.slurp.split(',');

@program[1] = 12;
@program[2] = 2;

my $pos = 0;

while @program[$pos] != 99 && $pos < @program.elems {
    given @program[$pos] {
        when 1 {
            @program[@program[$pos + 3]] = @program[@program[$pos + 1]] + @program[@program[$pos + 2]];
        }
        when 2 {
            @program[@program[$pos + 3]] = @program[@program[$pos + 1]] * @program[@program[$pos + 2]];
        }
    }
    $pos += 4;
}

say @program[0]; # 5534943
