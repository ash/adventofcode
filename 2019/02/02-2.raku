#!/usr/bin/env raku

my @orig-program = 'program.txt'.IO.slurp.split(',');


for 0..99 X 0..99 -> ($noun, $verb) {
    my @program = @orig-program;
    @program[1] = $noun;
    @program[2] = $verb;

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

    if @program[0] == 19690720 {
        say 100 * $noun + $verb;
        last;
    }
}

# 7603
