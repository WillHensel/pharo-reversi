Class {
	#name : #TestBoard,
	#superclass : #TestCase,
	#instVars : [
		'testBoard'
	],
	#category : #Reversi
}

{ #category : #running }
TestBoard >> setUp [
	super setUp.
	testBoard := Board new
	

]

{ #category : #tests }
TestBoard >> testFillBoardWithCells [
	
	| darkStarterCells lightStarterCells |
	
	darkStarterCells := { { 4. 5 }. { 5. 4 } }.
	lightStarterCells := { { 4. 4 }. { 5. 5 } }.

	testBoard fillBoardWithCells.
	self assert: (testBoard cells size) equals: 64.
	
	1 to: testBoard size do: [ :row | 
		1 to: testBoard size do: [ :col |
		self assert: ((testBoard cells at: row at: col) class) equals: Cell.
		
		1 to: darkStarterCells size do: [ :darkStarterLocation | 
			({ row. col } = darkStarterLocation) ifTrue: [ (self assert: (testBoard cells at: row at: col)) colorCode equals: 1 ]
																ifFalse: (self assert: (testBoard cells at: row at: col) colorCode equals: 0) ].
		
		1 to: lightStarterCells size do: [ :lightStarterLocation |
		( { row. col } = lightStarterLocation) ifTrue: [ (self assert: (testBoard cells at: row at: col)) colorCode equals: 2 ] 
																ifFalse: (self assert: (testBoard cells at: row at: col) colorCode equals: 0) ].
			
		]
	].
	
	
]
