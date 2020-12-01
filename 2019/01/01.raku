#!/usr/bin/env raku

my @data = 'data.txt'.IO.lines;

say [+] @data.map((* / 3).Int - 2); # 3488702

