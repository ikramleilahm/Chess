Class {
	#name : 'MyWhitePawn',
	#superclass : 'MyPawn',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyWhitePawn >> firstForwardSquare [
    ^ self square up.
]

{ #category : 'as yet unclassified' }
MyWhitePawn >> leftCaptureSquare [
    "Retourne la case de capture en diagonale haut-gauche"
    ^ self square + (-1 @ 1).
]

{ #category : 'accessing' }
MyWhitePawn >> nextForwardSquare: aSquare [
    ^ aSquare up.
]

{ #category : 'rendering' }
MyWhitePawn >> renderPieceOn: aSquare [

	^ aSquare renderWhitePawn
]

{ #category : 'as yet unclassified' }
MyWhitePawn >> rightCaptureSquare [
    "Retourne la case de capture en diagonale haut-droite"
    ^ self square + (1 @ 1).
]
