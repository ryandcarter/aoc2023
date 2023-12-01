%dw 2.0
output application/java
import * from dw::core::Strings
import * from dw::core::Numbers
var data = readUrl('classpath://day1-1.txt', 'text/plain')
fun getFirstDigit(chars) = (chars reduce ((char, acc=0) ->
	acc + if ( acc == 0 ) (if ( isNumeric(char) ) char else 0)
 else 0
))
---
sum(lines(data) map((it, index) -> 
	(getFirstDigit(it) as String ++ (getFirstDigit(reverse(it)) as String))
) )