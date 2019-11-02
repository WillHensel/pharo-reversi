Class {
	#name : #ReversiTest,
	#superclass : #TestCase,
	#instVars : [
		'testBoard',
		'testPlayer',
		'testGame'
	],
	#category : #Reversi
}

{ #category : #running }
ReversiTest >> setUp [
	super setUp.
	
	testPlayer := Player new name: 'testPlayer' color: 1.
	testGame := Game new.
	testGame currentPlayerTurn: testPlayer.
	testGame initializeGameBoard.
	testGame gameBoard fillBoardWithCells.
	testBoard := testGame gameBoard.
	testBoard fillBoardWithCells.
]

{ #category : #tests }
ReversiTest >> testAddPlayers [

	testGame addPlayer: (Player new name: 'testPlayer' color: 1).
	testGame addPlayer: (Player new name: 'testPlayer2' color: 2).
	
	self assert: (testGame players size) equals: 2.
	self assert: (testGame players at: 1) name equals: 'testPlayer'.
	self assert: (testGame players at: 2) name equals: 'testPlayer2'.
	self assert: (testGame players at: 1) color equals: 1.
	self assert: (testGame players at: 2) color equals: 2
]

{ #category : #tests }
ReversiTest >> testCheckGameOver [
	
	| tempGame |
	tempGame := testGame.
	tempGame gameBoard cells do: [ :cell | cell colorCode: 1 ].
	self assert: tempGame checkGameOver equals: true.
]

{ #category : #tests }
ReversiTest >> testCheckLegalMoves [
	
	| outputs expectedOutputs |
	
	outputs := testGame checkLegalMoves.
	expectedOutputs := OrderedCollection with: (testGame gameBoard cells at: 4 at: 3) with: (testGame gameBoard cells at: 6 at: 5) with: (testGame gameBoard cells at: 3 at: 4) with: (testGame gameBoard cells at: 5 at: 6).
	
	self assert: (outputs includes: (expectedOutputs at: 1)) equals: true.
	self assert: (outputs includes: (expectedOutputs at: 2)) equals: true.
	self assert: (outputs includes: (expectedOutputs at: 3)) equals: true.
	self assert: (outputs includes: (expectedOutputs at: 4)) equals: true.

]

{ #category : #tests }
ReversiTest >> testDraw [

	testGame gameBoard draw.
]

{ #category : #tests }
ReversiTest >> testFillBoardWithCells [
	
	| darkStarterCells lightStarterCells |
	
	darkStarterCells := { { 4. 5 }. { 5. 4 } }.
	lightStarterCells := { { 4. 4 }. { 5. 5 } }.

	self assert: (testBoard cells size) equals: 64.
	
	1 to: testBoard size do: [ :row | 
		1 to: testBoard size do: [ :col |
		self assert: ((testBoard cells at: row at: col) class) equals: Cell.
		
		darkStarterCells do: [ :darkStarterLocation | 
			({ row. col } = darkStarterLocation) ifTrue: [ self assert: (testBoard cells at: row at: col) colorCode equals: 1 ]
			].
		
		lightStarterCells do: [ :lightStarterLocation |
			({ row. col } = lightStarterLocation) ifTrue: [ self assert: (testBoard cells at: row at: col) colorCode equals: 2 ]
			]
		]
	]
]

{ #category : #running }
ReversiTest >> testInitializeGameBoard [
	testGame initializeGameBoard.
	self assert: (testGame gameBoard class) equals: Board
]

{ #category : #tests }
ReversiTest >> testTakeTurn [
	testPlayer takeTurn: (testGame gameBoard cells at: 1 at: 1).
	self assert: (testGame gameBoard cells at: 1 at: 1) colorCode equals: 1
]
