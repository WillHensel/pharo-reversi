"
Holds game cells and move state.
"
Class {
	#name : #Board,
	#superclass : #Game,
	#instVars : [
		'cells',
		'size'
	],
	#category : #Reversi
}

{ #category : #initialize }
Board >> Initialize [
	"Set size of game board to 8 and initialize the game board with cells"
	self size: 8.
	self cells: (Array2D new: size).
	
	1 to: size do: [ :row | 1 to: size do: 
			[ :column | cells at: row at: column put: (Cell new row: row column: column; isOccupied: false) ] 
		].
]

{ #category : #accessing }
Board >> cells [

	^self cells
]

{ #category : #setting }
Board >> cells: a2DArray [
	cells := a2DArray
	
]

{ #category : #drawing }
Board >> draw [

	| topRow gameBoard|
	
	topRow := String streamContents: [ :stream |	stream nextPutAll: '| + | '.
		1 to: size do: [ :column | 
			stream nextPutAll: column asString; 
						nextPutAll: ' | '
		].
		stream nextPut: Character cr
	].

	gameBoard := String streamContents: [ :stream |
		1 to: size do: [ :row | 
			stream nextPutAll: '| '; 
					 	nextPutAll: row asString; 
						nextPutAll: ' | ']
	].

	Transcript show: topRow.
	Transcript show: gameBoard
	



]

{ #category : #accessing }
Board >> size [ 

	^self size
]

{ #category : #setting }
Board >> size: aNumber [
	size := aNumber
	
]
