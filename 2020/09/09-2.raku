#!/usr/bin/env raku

my $window = 25;

my @data = 'input.txt'.IO.lines.map: *.Int;

my $i = ($window ..^ @data).first({
    @data[$_] != any(@data[$_ - $window ..^ $_].combinations(2).map: *.sum)
});

# say $i;
# say @data[$i];
my $n = @data[$i];

for ^$i -> $j {
    ([\,] @data[$j ..^ $i]).first: *.sum == $n
    andthen .sort.minmax andthen .head + .tail andthen .say
    
}

# 4389369
