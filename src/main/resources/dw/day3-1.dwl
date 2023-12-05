%dw 2.0
output application/java
import * from dw::core::Strings
import * from dw::core::Numbers
var data = readUrl('classpath://day3-1.txt', 'text/plain')
var linez = lines(data)
var grid = linez map ($ splitBy '')
fun notSymbol(char) = not ((not isNumeric(char)) and  char !='.')
fun arrayContainsNoSymbol(array) = (array default [] reduce ((it, acc=0) -> if ( notSymbol(it) ) acc else acc +1)) > 0
---
sum(
		flatten(linez map ((it, index) -> 
	(it find(/[0-9]+(\b)/)) map ((it2, index2) ->
		do {
	var number = substring((linez[index]),it2[0],it2[1])
	var hCoStart = it2[0]
	var hCoEnd = it2[1]
	var immediateLeft = if ( notSymbol(grid[index][(if ( hCoStart == 0 ) 0 else (hCoStart -1))]) ) false else true
	var immediateRight =  if ( notSymbol(grid[index][(hCoEnd)] default '.') ) false else true
	var adjacentAbv =  if ( arrayContainsNoSymbol(grid[index-1][(if ( hCoStart == 0 ) hCoStart else  hCoStart-1) to (hCoEnd)]) ) true else false
	var adjacentBlw =  if ( arrayContainsNoSymbol(grid[index +1][(if ( hCoStart == 0 ) hCoStart else  hCoStart-1) to (hCoEnd)]) ) true else false
	var isPartNumber = [immediateLeft, immediateRight,  adjacentAbv, adjacentBlw] contains true
	---
	if ( isPartNumber == true ) number else 0
}
	))
	)
	)
 


