Class {
	#name : 'MyBlackPawn',
	#superclass : 'MyPawn',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyBlackPawn >> firstForwardSquare [
    ^ self square down.
]

{ #category : 'as yet unclassified' }
MyBlackPawn >> leftCaptureSquare [
    "Retourne la case de capture en diagonale bas-gauche"
    ^ self square + (-1 @ -1).
]

{ #category : 'accessing' }
MyBlackPawn >> nextForwardSquare: aSquare [
    ^ aSquare down.
]

{ #category : 'rendering' }
MyBlackPawn >> renderPieceOn: aSquare [

	^ aSquare renderBlackPawn
]

{ #category : 'as yet unclassified' }
MyBlackPawn >> rightCaptureSquare [
    "Retourne la case de capture en diagonale bas-droite"
    ^ self square + (1 @ -1).
]
