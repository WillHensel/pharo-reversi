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
	size := 8.
	cells := Array2D new: size.
	1 to: size do: [ :row | 1 to: size do: 
			[ :column | cells at: row at: column put: Cell new ] 
		]
]
