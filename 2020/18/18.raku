#!/usr/bin/env raku

use MONKEY-SEE-NO-EVAL;
 
sub infix:<m>($a, $b) { $a * $b }

say [+] ('input.txt'.IO.lines.race.map: *.trans('*' => 'm')).map: {EVAL($_)}

# 209335026987
