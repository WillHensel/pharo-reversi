"
Player is associated with a piece state. Player can interact with pieces.
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
Player >> name: anObject [
	name := anObject
]

{ #category : #accessing }
Player >> name: aName color: aColor [
	
	self name: aName.
	self color: aColor
]
