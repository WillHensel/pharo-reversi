"
TODO
"
Class {
	#name : #Player,
	#superclass : #Game,
	#instVars : [
		'name',
		'color'
	],
	#category : #Reversi
}

{ #category : #accessing }
Player >> color [
	^ color
]

{ #category : #accessing }
Player >> color: anObject [
	color := anObject
]

{ #category : #accessing }
Player >> name [
	^ name
]

{ #category : #accessing }
Player >> name: aString [ 
	name := aString
]

{ #category : #accessing }
Player >> name: aString color: anInteger [ 
	self name: aString.
	self color: anInteger.
]

{ #category : #action }
Player >> takeTurn: aCell [
	aCell colorCode: self color
	
]
