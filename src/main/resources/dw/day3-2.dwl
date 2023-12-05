%dw 2.0
output application/java
import * from dw::core::Strings
import * from dw::core::Numbers
var data = readUrl('classpath://day3-1.txt', 'text/plain')
var linez = lines(data) 
var grid = linez map ($ splitBy '')
fun notSymbol(char) = not ( char !='*')
fun arrayContainsSymbol(array) = (array default [] reduce ((it, acc=0) -> if (notSymbol(it)) acc+1 else acc)) > 0

fun arrayContainsNumbers(array) = (array default [] reduce ((it, acc=0) -> if (isNumeric(it)) acc+1 else acc)) > 0
fun getStart(hCoStart)= (if (hCoStart == 0) hCoStart else  hCoStart-1)
---


	//sum(
		flatten(linez map ((it, index) -> 
	(it  find(/[0-9]+(\b)/)) map ((it2, index2) ->
		do {
		var number = substring((linez[index]),it2[0],it2[1])  
		var hCoStart = it2[0]
		var hCoEnd = it2[1]
		var immediateLeft = if(notSymbol(grid[index][getStart(hCoStart)])) true else false
		var immediateRight =  if(notSymbol(grid[index][(hCoEnd)] default '.')) true else false
		var adjacentAbv =  if(arrayContainsSymbol(grid[index-1][getStart(hCoStart) to ( hCoEnd )])) true else false
		var adjacentBlw =  if(arrayContainsSymbol(grid[index+1][getStart(hCoStart) to (hCoEnd)])) true else false
		var isPartNumber = [immediateLeft, immediateRight,  adjacentAbv, adjacentBlw] contains true
		var dVal = grid[index+1][getStart(hCoStart) to (hCoEnd)]
		var uVal = grid[index-1][getStart(hCoStart) to (hCoEnd)]
		var lV = grid[index][getStart(hCoStart)]
		var rV = grid[index][(hCoEnd)]
		var indy = ((index+1) ++ "," ++ getStart(hCoStart) + indexOf(dVal, '*'))
		var indu = ((index-1) ++ "," ++ getStart(hCoStart) + indexOf(uVal, '*'))
		---
		if (adjacentBlw) ({i:indy, v:number}) else  {}
		then 
		if (adjacentAbv)  {i:indu , v:number} else  {}
		then
		if (immediateRight) ({i:(index)++ "," ++ (hCoEnd), v:number}) else {} 
		then
		if (immediateLeft) ({i:(index)++ "," ++ (hCoStart-1), v:number}) else {} 
		
		
		} 
	)
	)
	) filter($ !={}) groupBy ($.i) pluck ($) reduce((it, acc=0) -> if(sizeOf(it) > 1) ( acc + (it[0].v * it[1].v))  else acc)
	//( acc + (it[0].v * it[1].v) as String) 
	//)
 


