"
TODO
"
Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'players',
		'gameBoard'
	],
	#category : #Reversi
}

{ #category : #accessing }
Game >> addPlayer: aPlayer [ 
	self players add: aPlayer
]

{ #category : #'as yet unclassified' }
Game >> checkLegalMove: aCell [
	"check cells around specified cell, if num dark cells > 1 and num light cells > 1 return true"
	
	| row col numLight numDark currentCell |
	
	row := aCell location at: 1.
	col := aCell location at: 2.
	numDark := 0.
	numLight := 0.
	
	(row < self gameBoard size) ifTrue: [
		currentCell := self gameBoard cells at: row + 1 at: col.
		currentCell colorCode ~= 0 ifTrue: [ currentCell colorCode = 1 ifTrue: [ numDark := numDark + 1 ]. currentCell colorCode = 2 ifTrue: [ numLight := numLight + 1 ] ].
	].
	
	(row < self gameBoard size) & (col < self gameBoard size) ifTrue: [
		currentCell := self gameBoard cells at: row + 1 at: col + 1.
		currentCell colorCode ~= 0 ifTrue: [ currentCell colorCode = 1 ifTrue: [ numDark := numDark + 1 ]. currentCell colorCode = 2 ifTrue: [ numLight := numLight + 1 ] ].
	].
	
	(col < self gameBoard size) ifTrue: [
		currentCell := self gameBoard cells at: row at: col + 1.
		currentCell colorCode ~= 0 ifTrue: [ currentCell colorCode = 1 ifTrue: [ numDark := numDark + 1 ]. currentCell colorCode = 2 ifTrue: [ numLight := numLight + 1 ] ].
	].
	
	(row > self gameBoard size) & (col < self gameBoard size) ifTrue: [
		currentCell := gameBoard cells at: row - 1 at: col + 1.
		currentCell colorCode ~= 0 ifTrue: [ currentCell colorCode = 1 ifTrue: [ numDark := numDark + 1 ]. currentCell colorCode = 2 ifTrue: [ numLight := numLight + 1 ] ].
	].
	
	(row > self gameBoard size) ifTrue: [
		currentCell := self gameBoard cells at: row - 1 at: col.
		currentCell colorCode ~= 0 ifTrue: [ currentCell colorCode = 1 ifTrue: [ numDark := numDark + 1 ]. currentCell colorCode = 2 ifTrue: [ numLight := numLight + 1 ] ].
	].
	
	(row > self gameBoard size) & (col > self gameBoard size) ifTrue: [
		currentCell := self gameBoard cells at: row - 1 at: col - 1.
		currentCell colorCode ~= 0 ifTrue: [ currentCell colorCode = 1 ifTrue: [ numDark := numDark + 1 ]. currentCell colorCode = 2 ifTrue: [ numLight := numLight + 1 ] ].
	].
	
	(col > self gameBoard size) ifTrue: [
		currentCell := self gameBoard cells at: row at: col - 1.
		currentCell colorCode ~= 0 ifTrue: [ currentCell colorCode = 1 ifTrue: [ numDark := numDark + 1 ]. currentCell colorCode = 2 ifTrue: [ numLight := numLight + 1 ] ].
	].
	
	(row < self gameBoard size) & (col > self gameBoard size) ifTrue: [
		currentCell := self gameBoard cells at: row + 1 at: col - 1.
		currentCell colorCode ~= 0 ifTrue: [ currentCell colorCode = 1 ifTrue: [ numDark := numDark + 1 ]. currentCell colorCode = 2 ifTrue: [ numLight := numLight + 1 ] ].
	].

	(numDark > 1) ifTrue: [ (numLight > 1) ifTrue: [ ^true ] ] ifFalse: [ ^false ]
]

{ #category : #accessing }
Game >> gameBoard [
	^ gameBoard
]

{ #category : #accessing }
Game >> gameBoard: anObject [
	gameBoard := anObject
]

{ #category : #initialization }
Game >> initialize [
	super initialize.
	self players: (OrderedCollection new: 2).
	self initializeGameBoard
]

{ #category : #initialization }
Game >> initializeGameBoard [
	self gameBoard: Board new.
]

{ #category : #accessing }
Game >> players [
	^ players
]

{ #category : #accessing }
Game >> players: anObject [
	players := anObject
]
