"
Holds game logic. All other game elements are subclasses.
"
Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'gameBoard',
		'players'
	],
	#category : #Reversi
}

{ #category : #adding }
Game >> addPlayer: aPlayer [
	
	self players add: aPlayer
]

{ #category : #accessing }
Game >> gameBoard [
	^ gameBoard
]

{ #category : #accessing }
Game >> gameBoard: anObject [
	gameBoard := anObject
]

{ #category : #'game logic' }
Game >> gameLoop [

	| answerName answerColor |
	
	self gameBoard clear.
	self gameBoard draw.
	
	answerName := UIManager default request: 'Enter player 1 name:'.
	answerColor := UIManager default chooseFrom: #('dark (D)' 'light (L)') values: #('dark' 'light').
	self addPlayer: (Player new name: answerName color: answerColor number: 1).
	


]

{ #category : #initialization }
Game >> initializeGame [
	
	self gameBoard: Board new Initialize.
	self players: OrderedCollection new.
	self gameLoop
]

{ #category : #accessing }
Game >> players [
	^ players
]

{ #category : #accessing }
Game >> players: anObject [
	players := anObject
]
