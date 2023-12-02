%dw 2.0
output application/java
import * from dw::core::Strings
import * from dw::core::Numbers
var data = readUrl('classpath://day2-1.txt', 'text/plain')
var limit= {red: 12, green: 13, blue: 14}
---
((lines(data) map((it, index) ->
	do {
	var parts = it splitBy(': ')
	var games = parts[1]
	var gameId = parts[0] substringAfter  'Game '	
	var subsets = games splitBy('; ')
	var colorSubsets = subsets map ($ splitBy(', ') 
		map ($ splitBy(' ') 
			
			)reduce((it, acc={}) -> (acc ++ {(it[1]):it[0] as Number}))
		)
		
	
	---
	flatten(colorSubsets map ((item, index) -> keysOf(item) map ((item2, index) -> if (limit[item2] >= item[item2]) true else false))) 
	}
	
) )  reduce ((item, acc={index:1, sum:0}) ->  (if (not (item contains false)) ({sum: acc.sum + acc.index, index:  acc.index+1}) else {sum: acc.sum, index:  acc.index+1}))).sum