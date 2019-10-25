"
Holds a piece a location on the game board.
"
Class {
	#name : #Cell,
	#superclass : #Board,
	#type : #variable,
	#instVars : [
		'isOccupied',
		'locationX',
		'locationY'
	],
	#category : #Reversi
}

{ #category : #accessing }
Cell >> isOccupied [

	^self isOccupied
]

{ #category : #setting }
Cell >> isOccupied: aBoolean [

	isOccupied := aBoolean
]

{ #category : #accessing }
Cell >> locationX [

	^self locationX
]

{ #category : #setting }
Cell >> locationX: aNumber [
	
	locationX := aNumber
]

{ #category : #accessing }
Cell >> locationY [

	^self locationY
]

{ #category : #setting }
Cell >> locationY: aNumber [

	locationY := aNumber
]

{ #category : #setting }
Cell >> row: row column: column [

	self locationY: row.
	self locationX: column.
]
