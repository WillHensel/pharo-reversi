"
TODO
"
Class {
	#name : #Cell,
	#superclass : #Board,
	#instVars : [
		'location',
		'colorCode'
	],
	#category : #Reversi
}

{ #category : #accessing }
Cell >> colorCode [
	^ colorCode
]

{ #category : #accessing }
Cell >> colorCode: anObject [
	colorCode := anObject
]

{ #category : #setting }
Cell >> colorCode: aColorCode location: aLocation [
	colorCode := aColorCode.
	location := aLocation
]

{ #category : #accessing }
Cell >> location [
	^ location
]

{ #category : #accessing }
Cell >> location: anObject [
	location := anObject
]
