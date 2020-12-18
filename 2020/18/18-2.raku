#!/usr/bin/env raku

use MONKEY-SEE-NO-EVAL;
 
sub infix:<m>($a, $b) is looser<+> { $a * $b }

say [+] ('input.txt'.IO.lines.race.map: *.trans('*' => 'm')).map: {EVAL($_)}

# 33331817392479
