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
	self players: (OrderedCollection new: 2)
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
