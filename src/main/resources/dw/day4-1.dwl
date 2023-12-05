%dw 2.0
output application/java
import * from dw::core::Strings
import * from dw::core::Numbers
var data = readUrl('classpath://day4-1.txt', 'text/plain')
var linez = lines(data) 
var split = linez map ($ splitBy '|')
var cards = split reduce ((it,acc=[]) -> acc + trim(substringAfter(it[0], ':'))) map (($ splitBy ' ') filter (not isEmpty($))map (trim($) as Number)) 
var winningNumbers = split reduce ((it,acc=[]) -> acc + trim(it[1]))  map (($ splitBy ' ') filter (not isEmpty($))map (trim($) as Number)) 

fun processCards(cards) = cards map ((item, index) -> 
	do {
		var x = sizeOf(item) -  sizeOf(item -- winningNumbers[index])
		---
	
	if(x==0) 0 else
	(1 to x) reduce ((it, acc=0) -> if (acc == 0) acc + 1 else acc * 2)
	}
)
---



sum(processCards(cards))