%dw 2.0
output application/json
import * from dw::core::Strings
import * from dw::core::Numbers
var data = readUrl('classpath://day1-1.txt', 'text/plain')

var regex = "[1-9]"
---
sum(lines(data) map((it, index) -> 
 	do {
		var replacedOverlapString = it replace "one" with "one1one" replace "two" with "two2two" replace "three" with "three3three" replace "four" with "four4four" replace "five" with "five5five" replace "six" with "six6six" replace "seven" with "seven7seven" replace "eight" with "eight8eight" replace "nine" with "nine9nine"
		var results =  replacedOverlapString scan regex
		---
		(results[0][0]) as String ++ (results[-1][0] as String) as Number
	}	
 ))