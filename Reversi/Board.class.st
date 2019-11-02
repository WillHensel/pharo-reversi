"
TODO
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

{ #category : #accessing }
Board >> cells [
	^ cells
]

{ #category : #accessing }
Board >> cells: anObject [
	cells := anObject
]

{ #category : #drawing }
Board >> draw [ 

	
	| drawTopRow drawGameBoard|
	
	drawTopRow := String streamContents: [ :stream |	stream nextPutAll: '| + | '.
		1 to: size do: [ :each | 
			stream nextPutAll: each asString; 
						nextPutAll: ' | '
		].
		stream nextPut: Character cr
	].

	drawGameBoard := String streamContents: [ :stream |
		1 to: size do: [ :row | 
			stream nextPutAll: '| '; 
					 	nextPutAll: row asString;
						nextPutAll: ' | '.
						
						1 to: size do: [ :col | stream nextPutAll: ((cells at: row at: col) colorCode) ].
						
						stream nextPut: Character cr ]
	].

	Transcript show: drawTopRow.
	Transcript show: drawGameBoard
]

{ #category : #initialization }
Board >> fillBoardWithCells [
	
	| darkStarterCells lightStarterCells |
	
	darkStarterCells := { { 4. 5 }. { 5. 4 } }.
	lightStarterCells := { { 4. 4 }. { 5. 5 } }.
		
	 1 to: self size do: [ :row |
		1 to: self size do: [ :col |
			
			self cells at: row at: col put: (Cell new colorCode: 0 location: {row. col}).
			
			darkStarterCells do: [ :darkStarterLocation | 
				({ row. col } = darkStarterLocation) ifTrue: [ (self cells at: row at: col) colorCode: 1 ] ].
		
			lightStarterCells do: [ :lightStarterLocation |
				({ row. col } = lightStarterLocation) ifTrue: [ (self cells at: row at: col) colorCode: 2 ] ].
			
			]
		]
]

{ #category : #initialization }
Board >> initialize [
	self size: 8.
	self cells: (Array2D new: size)
]

{ #category : #accessing }
Board >> size [
	^ size
]

{ #category : #accessing }
Board >> size: anObject [
	size := anObject
]
