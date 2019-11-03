"
TODO
"
Class {
	#name : #Cell,
	#superclass : #Board,
	#instVars : [
		'location',
		'colorCode',
		'path'
	],
	#category : #Reversi
}

{ #category : #adding }
Cell >> addToPath: aCollection [

	self path addAll: aCollection.
]

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

{ #category : #initialization }
Cell >> initialize [
	self path: OrderedCollection new.
	^self
]

{ #category : #accessing }
Cell >> location [
	^ location
]

{ #category : #accessing }
Cell >> location: anObject [
	location := anObject
]

{ #category : #accessing }
Cell >> path [
	^ path
]

{ #category : #accessing }
Cell >> path: anObject [
	path := anObject
]
