#!/usr/bin/env raku

my @data = 'input.txt'.IO.slurp.split(',').map: *.trim;

my $direction = 'N';
my ($x, $y) = (0, 0);

for @data -> $data {
    $data ~~ / (.) (\d+) /;

    my $turn = $/[0].Str;
    my $step = $/[1].Int;

    given $turn {
        when 'R' {            
            given $direction {
                when 'N' {$direction = 'E'}
                when 'W' {$direction = 'N'}
                when 'S' {$direction = 'W'}
                when 'E' {$direction = 'S'}
            }
        }
        when 'L' {
            given $direction {
                when 'N' {$direction = 'W'}
                when 'W' {$direction = 'S'}
                when 'S' {$direction = 'E'}
                when 'E' {$direction = 'N'}
            }
        }
    }

    given $direction {
        when 'N' {$y += $step}
        when 'W' {$x -= $step}
        when 'S' {$y -= $step}
        when 'E' {$x += $step}
    }        
}

say abs($x) + abs($y); # 332
