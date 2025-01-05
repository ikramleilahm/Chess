Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#instVars : [
		'hasMoved',
		'enPassantTarget'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyPawn >> captureMovesFor: aPawn [

	| captureMoves |
	"Déterminer les cases diagonales/ -1@1 est gauche diagonale/ 1@1 est droite diagonale"
	captureMoves := {
		                (aPawn square + (-1 @ (aPawn isWhite
			                   ifTrue: [ 1 ]
			                   ifFalse: [ -1 ]))).
		                (aPawn square + (1 @ (aPawn isWhite
			                   ifTrue: [ 1 ]
			                   ifFalse: [ -1 ]))) }. "on remplace par -1 dans l'axe y pour le black"

	captureMoves := captureMoves select: [ :s |
		                s notNil and: [
			                s hasPiece and: [ s contents color ~= aPawn color ] ] ].
	^ captureMoves
]

{ #category : 'as yet unclassified' }
MyPawn >> enPassantTargetSquares [
	| enPassantMoves lastMove enemySquare targetSquare |
    enPassantTarget ifNotNil: [ ^ OrderedCollection with: enPassantTarget ].

    enPassantMoves := OrderedCollection new.
    lastMove := square board game lastMove.

    lastMove ifNotNil: [
        (lastMove piece isPawn
            and: ([ (lastMove startSquare file asInteger - lastMove endSquare file asInteger) abs = 2 ]))
					ifTrue: [
						self isInEnPassantLine 
						ifTrue: [  
                enemySquare := lastMove endSquare.
                (self square columnDifference: enemySquare) abs = 1
                    ifTrue: [
                        targetSquare := (self isWhite
                            ifTrue: [ enemySquare up ]
                            ifFalse: [ enemySquare down ]).
                        enPassantTarget := targetSquare. "Stocker la case pour un accès ultérieur"
                        enPassantMoves add: targetSquare.
                    ].
					].
            ].
    ].
    ^ enPassantMoves
]

{ #category : 'as yet unclassified' }
MyPawn >> forwardMovesFor: aPawn [

	| forwardMoves nextSquare |
	forwardMoves := OrderedCollection new.

	"Determine the first square"
	nextSquare := aPawn isWhite
		              ifTrue: [ aPawn square up ]
		              ifFalse: [ aPawn square down ].

	"Check the first square"
	nextSquare notNil and: [
		nextSquare hasPiece ifFalse: [
			forwardMoves add: nextSquare.

			"Determine the second square only if the first square is empty and the pawn has not moved"
			aPawn hasMoved ifFalse: [ "voir si le pion a déja fait un move ou pas"
				nextSquare := aPawn isWhite
					              ifTrue: [ nextSquare up ]
					              ifFalse: [ nextSquare down ].
				"check une autre fois"
				nextSquare notNil and: [
					nextSquare hasPiece ifFalse: [ forwardMoves add: nextSquare ] ] ] ] ].

	^ forwardMoves
]

{ #category : 'accessing' }
MyPawn >> hasMoved [
	^ hasMoved 
]

{ #category : 'accessing' }
MyPawn >> hasMoved: aBoolean [
	hasMoved := aBoolean 
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'initialization' }
MyPawn >> initialize [

	super initialize.
	hasMoved := false.
	enPassantTarget := nil
]

{ #category : 'testing' }
MyPawn >> isInEnPassantLine [ 
	^ self isWhite 
		ifTrue: [ square file = $5 ] 
		ifFalse: [ square file = $4 ] 
]

{ #category : 'testing' }
MyPawn >> isPawn [ 
^ true
]

{ #category : 'path commands' }
MyPawn >> moveTo: aSquare [
    | enPassantTargetSquare |

    "Vérifie si le mouvement est légal avant de procéder"
    ((self targetSquaresLegal: true) includes: aSquare) ifFalse: [ ^ self ].

    "Détermine si le déplacement correspond à une capture en passant"
    enPassantTargetSquare := (self enPassantTargetSquares includes: aSquare)
        ifTrue: [
            "Si la capture en passant est possible, détermine la nouvelle position"
            self isWhite
                ifTrue: [aSquare down] 
                ifFalse: [aSquare up].
        ].

    "Effectue la capture en passant si une cible a été déterminée"
    enPassantTargetSquare ifNotNil: [
        enPassantTargetSquare emptyContents. "Vide le contenu de la case capturée"
    ].

    "Effectue le déplacement du pion vers la case cible"
    super moveTo: aSquare.

    "Réinitialise la cible de capture en passant après le déplacement"
    enPassantTarget := nil.
    hasMoved := true.


]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	| forwardMoves captureMoves enPassantMoves |
	"Obtenir les mouvements en avant"
	forwardMoves := self forwardMovesFor: self.

	"Obtenir les mouvements de capture"
	captureMoves := self captureMovesFor: self.

	"Obtenir les mouvements en passant, calculé une seule fois si nécessaire"
	enPassantMoves := enPassantMoves ifNil: [ self enPassantTargetSquares ].

	"Combiner les trois types de mouvements"
	^ captureMoves , forwardMoves , enPassantMoves
]
