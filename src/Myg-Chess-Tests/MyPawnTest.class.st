Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testBlackEnPassantCapturePossible [
    | whitePawn blackPawn board squares |
    board := MyChessBoard empty.
    "Place a black pawn on e4"
    board at: 'e4' put: (blackPawn := MyPawn black).
    "Place a white pawn on d4 that just moved two squares"
    board at: 'd4' put: (whitePawn := MyPawn white).
    board lastMovedPawn: whitePawn.
    "Verify that black pawn can capture en passant to d3"
    squares := blackPawn targetSquaresLegal: true.
    self assert: (squares includes: (board at: 'd3'))
]

{ #category : 'tests' }
MyPawnTest >> testBlackPawnCaptureMovesPossible [
    | blackPawn whitePawn board squares |
    board := MyChessBoard empty.

    "Place a black pawn on d5"
    board at: 'd5' put: (blackPawn := MyPawn black).

    "Place a white piece on c4 (to be captured)"
    board at: 'c4' put: (whitePawn := MyPawn white).

    "Verify that the pawn can capture the white piece on c4"
    squares := blackPawn targetSquaresLegal: true.
    self assert: (squares includes: (board at: 'c4')).

]

{ #category : 'tests' }
MyPawnTest >> testCannotMoveOffBoard [
    | pawn board squares |
    board := MyChessBoard empty.
    board at: 'e1' put: (pawn := MyPawn white).  "Pawn is at the edge of the board"
    
    "Check that the pawn cannot move up beyond the board"
    squares := pawn targetSquaresLegal: true.
    self deny: (squares includes: (board at: 'e0')).  "Cannot move off the board"

]

{ #category : 'tests' }
MyPawnTest >> testCannotMoveOffBoardB [
    | pawn board squares |
    board := MyChessBoard empty.
    board at: 'e8' put: (pawn := MyPawn black).  "Pawn is at the edge of the board"
    
    "Check that the pawn cannot move up beyond the board"
    squares := pawn targetSquaresLegal: true.
    self deny: (squares includes: (board at: 'e9')).  "Cannot move off the board"

]

{ #category : 'tests' }
MyPawnTest >> testEnPassantOnlyForAdjacentPawns [
    | whitePawn blackPawn board squares |
    board := MyChessBoard empty.
    "Setup pawns that aren't adjacent"
    board at: 'e5' put: (whitePawn := MyPawn white).
    board at: 'h5' put: (blackPawn := MyPawn black).
    board lastMovedPawn: blackPawn.
    "Verify that en passant is not possible"
    squares := whitePawn targetSquaresLegal: true.
    self deny: (squares includes: (board at: 'h6'))
]

{ #category : 'tests' }
MyPawnTest >> testEnPassantOnlyOnCorrectRank [
    | whitePawn blackPawn board squares |
    board := MyChessBoard empty.
    "Setup pawns on wrong rank for en passant"
    board at: 'e3' put: (whitePawn := MyPawn white).
    board at: 'f3' put: (blackPawn := MyPawn black).
    board lastMovedPawn: blackPawn.
    "Verify that en passant is not possible"
    squares := whitePawn targetSquaresLegal: true.
    self deny: (squares includes: (board at: 'f4'))
]

{ #category : 'tests' }
MyPawnTest >> testEnPassantOnlyPossibleImmediately [
    | whitePawn blackPawn board squares |
    board := MyChessBoard empty.
    "Setup initial position"
    board at: 'e5' put: (whitePawn := MyPawn white).
    board at: 'f5' put: (blackPawn := MyPawn black).
    board lastMovedPawn: blackPawn.
    "Clear lastMovedPawn to simulate a different move being made"
    board lastMovedPawn: nil.
    "Verify that en passant is no longer possible"
    squares := whitePawn targetSquaresLegal: true.
    self deny: (squares includes: (board at: 'f6'))
]

{ #category : 'tests' }
MyPawnTest >> testEnPassantRequiresTwoSquareAdvance [
    | whitePawn blackPawn board squares |
    board := MyChessBoard empty.
    "Setup pawns where black didn't move two squares"
    board at: 'e5' put: (whitePawn := MyPawn white).
    board at: 'f5' put: (blackPawn := MyPawn black).
    blackPawn hasMoved: true.
    board lastMovedPawn: blackPawn.
    "Verify that en passant is not possible"
    squares := whitePawn targetSquaresLegal: true.
    self deny: (squares includes: (board at: 'f6'))
]

{ #category : 'tests' }
MyPawnTest >> testId [

	self assert: MyPawn new id equals: 'P'
]

{ #category : 'tests' }
MyPawnTest >> testLengthOneFirstMovesIsPossible [

	| pawn board squares |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).

	"Vérifier que le pion peut se déplacer de deux cases pour la premiere fois"
	squares := pawn targetSquaresLegal: true.
	self assert: (squares includes: (board at: 'e3'))
]

{ #category : 'tests' }
MyPawnTest >> testLengthOneFirstMovesIsPossibleB [

	| pawn board squares |
	board := MyChessBoard empty.
	board at: 'e7' put: (pawn := MyPawn black).

	"Vérifier que le pion peut se déplacer de deux cases pour la premiere fois"
	squares := pawn targetSquaresLegal: true.
	self assert: (squares includes: (board at: 'e6'))
]

{ #category : 'tests' }
MyPawnTest >> testLengthTwoFirstMovesIsPossible [

	| pawn board squares |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).

	"Vérifier que le pion peut se déplacer de deux cases pour la premiere fois"
	squares := pawn targetSquaresLegal: true.
	self assert: (squares includes: (board at: 'e4'))
]

{ #category : 'tests' }
MyPawnTest >> testLengthTwoFirstMovesIsPossibleB [

	| pawn board squares |
	board := MyChessBoard empty.
	board at: 'e7' put: (pawn := MyPawn black).

	"Vérifier que le pion peut se déplacer de deux cases pour la premiere fois"
	squares := pawn targetSquaresLegal: true.
	self assert: (squares includes: (board at: 'e5'))
]

{ #category : 'tests' }
MyPawnTest >> testSubsequentMovesOneSquareOnly [
    | pawn board squares |
    board := MyChessBoard empty.
    board at: 'e3' put: (pawn := MyPawn white).
    pawn hasMoved: true.

    "Check that the pawn can move only one square after its first move"
    squares := pawn targetSquaresLegal: true.
    self assert: (squares includes: (board at: 'e4')).
    self deny: (squares includes: (board at: 'e5')).  "Should not be able to move two squares anymore"

]

{ #category : 'tests' }
MyPawnTest >> testSubsequentMovesOneSquareOnlyB [

	| pawn board squares |
	board := MyChessBoard empty.
	board at: 'e5' put: (pawn := MyPawn black).
	pawn hasMoved: true.

	"Check that the pawn can move only one square after its first move"
	squares := pawn targetSquaresLegal: true.
	self assert: (squares includes: (board at: 'e4')).
	self deny: (squares includes: (board at: 'e3')) "Should not be able to move two squares anymore"
]

{ #category : 'tests' }
MyPawnTest >> testWhiteEnPassantCaptureExecution [
    | whitePawn blackPawn board |
    board := MyChessBoard empty.
    "Setup initial position"
    board at: 'e5' put: (whitePawn := MyPawn white).
    board at: 'f5' put: (blackPawn := MyPawn black).
    board lastMovedPawn: blackPawn.
    "Execute en passant capture"
    whitePawn moveTo: (board at: 'f6').
    "Verify captured pawn is removed and capturing pawn moved"
    self assert: (board at: 'f5') contents isNil.
    self assert: (board at: 'f6') contents equals: whitePawn
]

{ #category : 'tests' }
MyPawnTest >> testWhiteEnPassantCapturePossible [
    | whitePawn blackPawn board squares |
    board := MyChessBoard empty.
    
    "Place a white pawn on e5 (crucial - must be on 5th rank)"
    board at: 'e5' put: (whitePawn := MyPawn white).
    
    "Place a black pawn on f7 and move it two squares to f5"
    board at: 'f7' put: (blackPawn := MyPawn black).
    blackPawn moveTo: (board at: 'f5').
    
    "Now white should be able to capture en passant to f6"
    squares := whitePawn targetSquaresLegal: true.
    
    "Debug output"
    Transcript show: 'Available moves: '; show: squares asString; cr.
    Transcript show: 'Last moved pawn: '; show: board lastMovedPawn asString; cr.
    
    self assert: (squares includes: (board at: 'f6'))
]

{ #category : 'tests' }
MyPawnTest >> testWhitePawnCaptureMovesPossible [

	| whitePawn blackPawn board squares |
	board := MyChessBoard empty.

	"Place a white pawn on e4"
	board at: 'e4' put: (whitePawn := MyPawn white).

	"Place a black piece on d5 (to be captured)"
	board at: 'd5' put: (blackPawn := MyPawn black).

	"Verify that the pawn can capture the black piece on d5"

	squares := whitePawn targetSquaresLegal: true.
	self assert: (squares includes: (board at: 'd5'))
]
