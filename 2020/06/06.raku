#!/usr/bin/env raku

say [+] 'input.txt'.IO.slurp.split("\n\n").map: *.subst("\n", '', :g).comb.unique.elems;

# 6947
