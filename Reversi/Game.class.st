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
	| currentCell legalMoves tempPath |
	
	legalMoves := OrderedCollection  new.
	tempPath := OrderedCollection new.
	
	aCell colorCode = currentPlayerTurn color ifTrue: [
	
	currentCell := self gameBoard cells at: ((aCell location at: 1) - 1) at: ((aCell location at: 2) + 1).
	currentCell colorCode ~= 0 ifTrue: [
		currentCell colorCode ~= currentPlayerTurn color ifTrue: [ 
			[((currentCell location at: 1) < self gameBoard size) & 
				((currentCell location at: 2) < self gameBoard size) & 
					(currentCell colorCode ~= currentPlayerTurn color) &
					(currentCell colorCode ~= 0)] whileTrue: [ 
						tempPath add: currentCell.
						currentCell := self gameBoard cells at: ((currentCell location at: 1) - 1) at: ((currentCell location at: 2) + 1).
			].
			currentCell addToPath: tempPath.
			legalMoves add: currentCell.
		]
	].

	tempPath := OrderedCollection new.

	currentCell := self gameBoard cells at: (aCell location at: 1) at: ((aCell location at: 2) + 1).
		currentCell colorCode ~= 0 ifTrue: [
		currentCell colorCode ~= currentPlayerTurn color ifTrue: [ 
			[((currentCell location at: 2) < self gameBoard size) & 
				(currentCell colorCode ~= currentPlayerTurn color) &
				(currentCell colorCode ~= 0)] whileTrue: [ 
				tempPath add: currentCell.
				currentCell := self gameBoard cells at: (currentCell location at: 1) at: ((currentCell location at: 2) + 1).
			].
			currentCell addToPath: tempPath.
			legalMoves add: currentCell.
		]
	].

	tempPath := OrderedCollection new.
	
	currentCell := self gameBoard cells at: ((aCell location at: 1) + 1) at: ((aCell location at: 2) + 1).
	currentCell colorCode ~= 0 ifTrue: [
		currentCell colorCode ~= currentPlayerTurn color ifTrue: [ 
			[((currentCell location at: 1) < self gameBoard size) & 
				((currentCell location at: 2) < self gameBoard size) & 
					(currentCell colorCode ~= currentPlayerTurn color) &
					(currentCell colorCode ~= 0)] whileTrue: [ 
					tempPath add: currentCell.
				currentCell := self gameBoard cells at: ((currentCell location at: 1) + 1) at: ((currentCell location at: 2) + 1).
			].
			currentCell addToPath: tempPath.
			legalMoves add: currentCell.
		]
	].

	tempPath := OrderedCollection new.
	
	currentCell := self gameBoard cells at: ((aCell location at: 1) + 1) at: (aCell location at: 2).
	currentCell colorCode ~= 0 ifTrue: [
		currentCell colorCode ~= currentPlayerTurn color ifTrue: [ 
			[((currentCell location at: 1) < self gameBoard size) & 
				(currentCell colorCode ~= currentPlayerTurn color) &
				(currentCell colorCode ~= 0)] whileTrue: [ 
				tempPath add: currentCell.
				currentCell := self gameBoard cells at: ((currentCell location at: 1) + 1) at: (currentCell location at: 2).
			].
			currentCell addToPath: tempPath.
			legalMoves add: currentCell.
		]
	].

	tempPath := OrderedCollection new.
	
	currentCell := self gameBoard cells at: ((aCell location at: 1) + 1) at: ((aCell location at: 2) - 1).
	currentCell colorCode ~= 0 ifTrue: [
		currentCell colorCode ~= currentPlayerTurn color ifTrue: [ 
			[((currentCell location at: 1) < self gameBoard size) & 
				((currentCell location at: 2) < self gameBoard size) & 
					(currentCell colorCode ~= currentPlayerTurn color) &
					(currentCell colorCode ~= 0)] whileTrue: [ 
					tempPath add: currentCell.
					currentCell := self gameBoard cells at: ((currentCell location at: 1) + 1) at: ((currentCell location at: 2) - 1).
			].
			currentCell addToPath: tempPath.
			legalMoves add: currentCell.
		]
	].

	tempPath := OrderedCollection new.
	
	currentCell := self gameBoard cells at: (aCell location at: 1) at: ((aCell location at: 2) - 1).
	currentCell colorCode ~= 0 ifTrue: [
		currentCell colorCode ~= currentPlayerTurn color ifTrue: [ 
			[((currentCell location at: 2) < self gameBoard size) & 
				(currentCell colorCode ~= currentPlayerTurn color) &
				(currentCell colorCode ~= 0)] whileTrue: [ 
				tempPath add: currentCell.
				currentCell := self gameBoard cells at: (currentCell location at: 1) at: ((currentCell location at: 2) - 1).
			].
			currentCell addToPath: tempPath.
			legalMoves add: currentCell.
		]
	].

	tempPath := OrderedCollection new.
	
	currentCell := self gameBoard cells at: ((aCell location at: 1) - 1) at: ((aCell location at: 2) - 1).
	currentCell colorCode ~= 0 ifTrue: [
		currentCell colorCode ~= currentPlayerTurn color ifTrue: [ 
			[((currentCell location at: 1) < self gameBoard size) & 
				((currentCell location at: 2) < self gameBoard size) & 
					(currentCell colorCode ~= currentPlayerTurn color) &
					(currentCell colorCode ~= 0)] whileTrue: [ 
					tempPath add: currentCell.
					currentCell := self gameBoard cells at: ((currentCell location at: 1) - 1) at: ((currentCell location at: 2) - 1).
			].
			currentCell addToPath: tempPath.
			legalMoves add: currentCell.
		]
	].

	tempPath := OrderedCollection new.
	
	currentCell := self gameBoard cells at: ((aCell location at: 1) - 1) at: (aCell location at: 2).
	currentCell colorCode ~= 0 ifTrue: [
		currentCell colorCode ~= currentPlayerTurn color ifTrue: [ 
			[((currentCell location at: 1) < self gameBoard size) & 
				(currentCell colorCode ~= currentPlayerTurn color) &
				(currentCell colorCode ~= 0)] whileTrue: [ 
				tempPath add: currentCell.
				currentCell := self gameBoard cells at: ((currentCell location at: 1) - 1) at: (currentCell location at: 2).
			].
			currentCell addToPath: tempPath.
			legalMoves add: currentCell.
		]
	].
	
	^legalMoves
	] ifFalse: [ ^false ]
]

{ #category : #check }
Game >> checkGameOver [
	
	self gameBoard cells do: [ :cell | cell colorCode = 0 ifTrue: [ ^false ] ].
	^true
]

{ #category : #check }
Game >> checkLegalMoves [
	"check cells around specified cell, if num dark cells > 1 and num light cells > 1 return true"
	"TODO: test"
	| adjacentCellOutput allLegalMoves |
	allLegalMoves := OrderedCollection new.
	
	self gameBoard cells do: [ :cell | cell colorCode = currentPlayerTurn color ifTrue: [ 
			adjacentCellOutput := self checkAdjacentCells: cell.
			"Complains about each ~= false ifTrue:. This is necessary as the other elements are Cells, not Booleans"
			adjacentCellOutput do: [ :each | each ~= false ifTrue: [ allLegalMoves add: each ] ]
		] 
	].
	
	^allLegalMoves
]

{ #category : #accessing }
Game >> currentPlayerTurn [
	^ currentPlayerTurn
]

{ #category : #accessing }
Game >> currentPlayerTurn: anObject [
	currentPlayerTurn := anObject
]

{ #category : #'as yet unclassified' }
Game >> flipCells: aCell [
	aCell path do: [ :cell | cell colorCode: self currentPlayerTurn color ]

	
]

{ #category : #accessing }
Game >> gameBoard [
	^ gameBoard
]

{ #category : #accessing }
Game >> gameBoard: anObject [
	gameBoard := anObject
]

{ #category : #'interaction loop' }
Game >> gameLoop [
	
	| legalMoves move |
	[ self checkGameOver = false ] whileTrue: [ 
		self currentPlayerTurn: (self players at: 1).
		legalMoves := self checkLegalMoves.
		move := self getNextMove.
		move := self gameBoard cells at: (move at: 1) at: (move at: 2).
		[(legalMoves includes: move) = false] whileTrue: [
					move := self getNextMove.
					move := self gameBoard cells at: (move at: 1) at: (move at: 2).
		].
		self currentPlayerTurn takeTurn: move.
		self flipCells: move.
	
		Transcript clear.
		self gameBoard draw.
	
		self currentPlayerTurn: (self players at: 2).
		legalMoves := self checkLegalMoves.
		move := self getNextMove.
		move := self gameBoard cells at: (move at: 1) at: (move at: 2).
		[(legalMoves includes: move) = false] whileTrue: [
					move := self getNextMove.
					move := self gameBoard cells at: (move at: 1) at: (move at: 2).
		].
		self currentPlayerTurn takeTurn: move.
		self flipCells: move.
	
		Transcript clear.
		self gameBoard draw.
	].
	
	Transcript show: self getWinner.
]

{ #category : #accessing }
Game >> getNextMove [
	
	| input |
	input := UIManager default request: 'Enter cell in format row, column'.
	[(input matchesRegex: '\d[,]\s\d') = false ] whileTrue: [ 
			input := UIManager default request: 'Enter cell in format row, column'
	].
	input := (input splitOn: ', ').
	input at: 1 put: (input at: 1) asInteger.
	input at: 2 put: (input at: 2) asInteger.
	^input
	
]

{ #category : #accessing }
Game >> getPlayers [
	| playerName |
	playerName := UIManager default request: 'Enter player 1 name'.
	self addPlayer: (Player new name: playerName color: 1).
	
	playerName := UIManager default request: 'Enter player 2 name'.
	self addPlayer: (Player new name: playerName color: 2)
]

{ #category : #accessing }
Game >> getWinner [
	| darkCount lightCount |
	
	darkCount := 0.
	lightCount := 0.
	
	self gameBoard cells do: [ :cell | 
		(cell colorCode: 1) ifTrue: [darkCount := darkCount + 1].
		(cell colorCode: 2) ifTrue: [lightCount := lightCount + 2]
	].

	darkCount > lightCount ifTrue: [ ^(self players at: 1) name ].
	lightCount > darkCount ifTrue: [ ^(self players at: 2) name ].
	darkCount = lightCount ifTrue: [ ^'Tie' ]
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

{ #category : #accessing }
Game >> start [
	Transcript clear.
	self getPlayers.
	self gameBoard draw.
	self gameLoop.
]
