Class {
	#name : #TestGame,
	#superclass : #TestCase,
	#instVars : [
		'testGame'
	],
	#category : #Reversi
}

{ #category : #running }
TestGame >> setUp [
	super setUp.
	testGame := Game new.


]

{ #category : #tests }
TestGame >> testAddPlayers [

	testGame addPlayer: (Player new name: 'testPlayer' color: 1).
	testGame addPlayer: (Player new name: 'testPlayer2' color: 2).
	
	self assert: (testGame players size) equals: 2.
	self assert: (testGame players at: 1) name equals: 'testPlayer'.
	self assert: (testGame players at: 2) name equals: 'testPlayer2'.
	self assert: (testGame players at: 1) color equals: 1.
	self assert: (testGame players at: 2) color equals: 2
]

{ #category : #running }
TestGame >> testInitializeGameBoard [
	testGame initializeGameBoard.
	self assert: (testGame gameBoard class) equals: Board
]
