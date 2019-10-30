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
	testBoard := testGame gameBoard.
	testBoard fillBoardWithCells

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
ReversiTest >> testCheckLegalMove [
	| falseCell trueCell |
	
	falseCell := testBoard cells at: 1 at: 1.
	trueCell := testBoard cells at: 3 at: 4.
	
	self assert: (testGame checkLegalMove: falseCell) equals: false.
	self assert: (testGame checkLegalMove: trueCell) equals: true
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
	testPlayer takeTurn: (testBoard cells at: 1 at: 1).
	self assert: (testBoard cells at: 1 at: 1) colorCode equals: 1
]
