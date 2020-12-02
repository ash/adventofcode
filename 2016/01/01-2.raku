#!/usr/bin/env raku

my @data = 'input.txt'.IO.slurp.split(',').map: *.trim;

my $direction = 'N';
my ($x, $y) = (0, 0);
my %map;

move();
say abs($x) + abs($y); # 166

sub move {
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
            when 'N' {
                for ^$step {
                    return if ++%map{$x => ++$y} == 2;
                }
            }
            when 'W' {
                for ^$step {
                    return if ++%map{--$x => $y} == 2;
                }
            }
            when 'S' {
                for ^$step {
                    return if ++%map{$x => --$y} == 2;
                }
            }
            when 'E' {
                for ^$step {
                    return if ++%map{++$x => $y} == 2;
                }
            }
        }
    }
}
