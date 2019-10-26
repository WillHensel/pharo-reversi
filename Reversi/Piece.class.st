"
Has two states, Dark and Light.
"
Class {
	#name : #Piece,
	#superclass : #Game,
	#instVars : [
		'currentState'
	],
	#category : #Reversi
}

{ #category : #setting }
Piece >> changeState [

	(self currentState equals: 'light') ifTrue: [ self currentState: 'dark' ].
	(self currentState equals: 'dark') ifTrue: [ self currentState: 'light' ]
]

{ #category : #accessing }
Piece >> currentState [
	^ currentState
]

{ #category : #accessing }
Piece >> currentState: anObject [
	currentState := anObject
]
