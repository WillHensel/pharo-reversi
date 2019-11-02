"
TODO
"
Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'players',
		'gameBoard',
		'currentPlayerTurn'
	],
	#category : #Reversi
}

{ #category : #accessing }
Game >> addPlayer: aPlayer [ 
	self players add: aPlayer
]

{ #category : #check }
Game >> checkAdjacentCells: aCell [
"Failing tests"
	| currentCell legalMoves |
	
	legalMoves := OrderedCollection  new.
	
	aCell colorCode = currentPlayerTurn color ifTrue: [
	
	currentCell := self gameBoard cells at: ((aCell location at: 1) - 1) at: ((aCell location at: 2) + 1).
	currentCell colorCode ~= 0 ifTrue: [
		currentCell colorCode ~= currentPlayerTurn color ifTrue: [ 
			[((currentCell location at: 1) < self gameBoard size) & 
				((currentCell location at: 2) < self gameBoard size) & 
					(currentCell colorCode ~= 0)] whileTrue: [ 
				currentCell := self gameBoard cells at: ((currentCell location at: 1) - 1) at: ((currentCell location at: 2) + 1).
			].
		].
		legalMoves add: currentCell.
	].

	currentCell := self gameBoard cells at: (aCell location at: 1) at: ((aCell location at: 2) + 1).
		currentCell colorCode ~= 0 ifTrue: [
		currentCell colorCode ~= currentPlayerTurn color ifTrue: [ 
			[((currentCell location at: 2) < self gameBoard size) & 
				(currentCell colorCode ~= 0)] whileTrue: [ 
				currentCell := self gameBoard cells at: (currentCell location at: 1) at: ((currentCell location at: 2) + 1).
			].
		].
		legalMoves add: currentCell.
	].

	currentCell := self gameBoard cells at: ((aCell location at: 1) + 1) at: ((aCell location at: 2) + 1).
	currentCell colorCode ~= 0 ifTrue: [
		currentCell colorCode ~= currentPlayerTurn color ifTrue: [ 
			[((currentCell location at: 1) < self gameBoard size) & 
				((currentCell location at: 2) < self gameBoard size) & 
					(currentCell colorCode ~= 0)] whileTrue: [ 
				currentCell := self gameBoard cells at: ((currentCell location at: 1) + 1) at: ((currentCell location at: 2) + 1).
			].
		].
		legalMoves add: currentCell.
	].
	
	currentCell := self gameBoard cells at: ((aCell location at: 1) + 1) at: (aCell location at: 2).
	currentCell colorCode ~= 0 ifTrue: [
		currentCell colorCode ~= currentPlayerTurn color ifTrue: [ 
			[((currentCell location at: 1) < self gameBoard size) & 
				(currentCell colorCode ~= 0)] whileTrue: [ 
				currentCell := self gameBoard cells at: ((currentCell location at: 1) - 1) at: (currentCell location at: 2).
			].
		].
		legalMoves add: currentCell.
	].
	
	currentCell := self gameBoard cells at: ((aCell location at: 1) + 1) at: ((aCell location at: 2) - 1).
	currentCell colorCode ~= 0 ifTrue: [
		currentCell colorCode ~= currentPlayerTurn color ifTrue: [ 
			[((currentCell location at: 1) < self gameBoard size) & 
				((currentCell location at: 2) < self gameBoard size) & 
					(currentCell colorCode ~= 0)] whileTrue: [ 
				currentCell := self gameBoard cells at: ((currentCell location at: 1) + 1) at: ((currentCell location at: 2) - 1).
			].
		].
		legalMoves add: currentCell.
	].
	
	currentCell := self gameBoard cells at: (aCell location at: 1) at: ((aCell location at: 2) - 1).
	currentCell colorCode ~= 0 ifTrue: [
		currentCell colorCode ~= currentPlayerTurn color ifTrue: [ 
			[((currentCell location at: 2) < self gameBoard size) & 
				(currentCell colorCode ~= 0)] whileTrue: [ 
				currentCell := self gameBoard cells at: (currentCell location at: 1) at: ((currentCell location at: 2) - 1).
			].
		].
		legalMoves add: currentCell.
	].
	
	currentCell := self gameBoard cells at: ((aCell location at: 1) - 1) at: ((aCell location at: 2) - 1).
	currentCell colorCode ~= 0 ifTrue: [
		currentCell colorCode ~= currentPlayerTurn color ifTrue: [ 
			[((currentCell location at: 1) < self gameBoard size) & 
				((currentCell location at: 2) < self gameBoard size) & 
					(currentCell colorCode ~= 0)] whileTrue: [ 
				currentCell := self gameBoard cells at: ((currentCell location at: 1) - 1) at: ((currentCell location at: 2) - 1).
			].
		].
		legalMoves add: currentCell.
	].
	
	currentCell := self gameBoard cells at: ((aCell location at: 1) - 1) at: (aCell location at: 2).
	currentCell colorCode ~= 0 ifTrue: [
		currentCell colorCode ~= currentPlayerTurn color ifTrue: [ 
			[((currentCell location at: 1) < self gameBoard size) & 
				(currentCell colorCode ~= 0)] whileTrue: [ 
				currentCell := self gameBoard cells at: ((currentCell location at: 1) - 1) at: (currentCell location at: 2).
			].
		].
		legalMoves add: currentCell.
	].
	
	^legalMoves
	] ifFalse: [ ^false ]
]

{ #category : #check }
Game >> checkLegalMoves: aCell [
	"check cells around specified cell, if num dark cells > 1 and num light cells > 1 return true"
	"TODO: test"
	| adjacentCellOutput allLegalMoves |
	allLegalMoves := OrderedCollection new.
	
	self gameBoard cells do: [ :cell | cell colorCode = currentPlayerTurn color ifTrue: [ 
			adjacentCellOutput := self checkAdjacentCells: cell.
			adjacentCellOutput collect: [ :outputCell ] as:allLegalMoves.
		] 
	]
]

{ #category : #accessing }
Game >> currentPlayerTurn [
	^ currentPlayerTurn
]

{ #category : #accessing }
Game >> currentPlayerTurn: anObject [
	currentPlayerTurn := anObject
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
