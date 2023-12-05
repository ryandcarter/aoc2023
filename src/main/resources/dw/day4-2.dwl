%dw 2.0
output application/java
import * from dw::core::Strings
import * from dw::core::Numbers
var data = readUrl('classpath://day4-1.txt', 'text/plain')
var linez = lines(data) 
var split = linez map ($ splitBy '|')
var cards = split reduce ((it,acc=[]) -> acc + trim(substringAfter(it[0], ':'))) map (($ splitBy ' ') filter (not isEmpty($))map (trim($) as Number)) 
---

??? 