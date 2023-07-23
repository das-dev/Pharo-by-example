Class {
	#name : #History,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #'PBE-History'
}

{ #category : #private }
History >> canGoBackward [

	^ stream position > 1
]

{ #category : #private }
History >> canGoForward [

	^ stream atEnd not and: [ stream peek notNil ]
]

{ #category : #api }
History >> contents [

	^ stream contents
]

{ #category : #api }
History >> goBackward [

	self canGoBackward ifFalse: [ 
		self error: 'Already on the first element' ].
	stream skip: -2.
	^ stream next
]

{ #category : #api }
History >> goForward [

	self canGoForward ifFalse: [ 
		self error: 'Already on the last element' ].
	^ stream next
]

{ #category : #api }
History >> goTo: aPage [

	stream nextPut: aPage.
	stream nextPut: nil.
	stream back
]

{ #category : #initialization }
History >> initialize [

	super initialize.
	stream := ReadWriteStream on: Array new
]
