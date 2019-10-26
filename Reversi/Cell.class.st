"
Holds a piece a location on the game board.
"
Class {
	#name : #Cell,
	#superclass : #Board,
	#type : #variable,
	#instVars : [
		'occupiedBy',
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

{ #category : #accessing }
Cell >> isOccupied: aBoolean [

	isOccupied := aBoolean
]

{ #category : #accessing }
Cell >> locationX [

	^self locationX
]

{ #category : #accessing }
Cell >> locationX: aNumber [
	
	locationX := aNumber
]

{ #category : #accessing }
Cell >> locationY [

	^self locationY
]

{ #category : #accessing }
Cell >> locationY: aNumber [

	locationY := aNumber
]

{ #category : #accessing }
Cell >> occupiedBy [
	^ occupiedBy
]

{ #category : #accessing }
Cell >> occupiedBy: anObject [

	occupiedBy := anObject
]

{ #category : #accessing }
Cell >> row: row column: column [

	self locationY: row.
	self locationX: column
]

{ #category : #initialization }
Cell >> setEmpty [

	self occupiedBy: ' '
]
