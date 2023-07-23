Class {
	#name : #HistoryTest,
	#superclass : #TestCase,
	#category : #'PBE-History'
}

{ #category : #tests }
HistoryTest >> testSimplelWay [

	self
		assert: (History new
				 goTo: #page1;
				 goTo: #page2;
				 goTo: #page3;
				 goBackward;
				 goBackward;
				 goTo: #page4;
				 contents)
		equals: #( #page1 #page4 nil nil )
]
