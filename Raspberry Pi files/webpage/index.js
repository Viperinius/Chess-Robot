/*
    Name:       index.js
    Created:    18.08.2019
    Author:     Viperinius
*/

var game = new Chess();
var $status = $('#status');

var whiteSquareGrey = '#a9a9a9';
var blackSquareGrey = '#696969';

var board = Chessboard('chessBoard', {
    position: 'start',
    draggable: true,
    moveSpeed: 'slow',
    snapbackSpeed: 500,
    snapSpeed: 100,
    onSnapEnd: onPieceSnapEnd,
    onDrop: onPieceDrop,
    onDragStart: onDragPieceStart,
    onMouseoutSquare: onMouseOutSquare,
    onMouseoverSquare: onMouseOverSquare
});

$(window).resize(board.resize);

$('#btnFlipSide').on('click', function() {
    if (board.orientation() == 'white') {
        board.orientation('black');
        //send to python
    }
    else {
        board.orientation('white');
        //send to python
    }
});

$('#btnResetBoard').on('click', function() {
    //set start position
    board.position('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR');
    game.reset();
    updateStatus();
    //send to python
});

$('#btnToggleValidMoves').on('click', function() {
    
});


//-----------------------------------------------------

updateStatus();

//-----------------------------------------------------

function onPieceDrop(source, target, piece, newPos, oldPos, orientation) {
    removeHighlighting();

    // if promotion is needed, always promotes to queen (!)
    var move = game.move({
        from: source,
        to: target,
        promotion: 'q'
    });

    if (move === null) {
        return 'snapback';
    }

    console.log("Moved " + piece + " from " + source + " to " + target);
    updateStatus();
}

function onPieceSnapEnd() {
    board.position(game.fen());
}

function onDragPieceStart(source, piece, position, orientation) {
    if (game.game_over()) {
        //game is over
        return false;
    }

    //if ((orientation === 'white' && piece.search(/^w/) === -1) | (orientation === 'black' && piece.search(/^b/) === -1)) {
    if ((game.turn() === 'w' && piece.search(/^w/) === -1) | (game.turn() === 'b' && piece.search(/^b/) === -1)) {
        //tried to drag non player piece
        return false;
    }
}

function onMouseOverSquare (square, piece) {
    var moves = game.moves({
        square: square,
        verbose: true
    });

    if (moves.length === 0) {
        return;
    }

    highlighting(square);
    for (let i = 0; i < moves.length; i++) {
        highlighting(moves[i].to);        
    }
}

function onMouseOutSquare(square, piece) {
    removeHighlighting();
}

function updateStatus() {
    var status = '';
    var moveColour = 'White';
    if (game.turn() === 'b') {
        moveColour = 'Black';
    }

    if (game.in_checkmate()) {
        status = 'Game over, ' + moveColour + ' is in checkmate!';
    }
    else if (game.in_draw()) {
        status = "Game over, it's a draw!";
    }
    else {
        status = moveColour + ' to move';

        if (game.in_check()) {
            status += ', ' + moveColour + ' in check.';
        }
        else {
            status += '.';
        }
    }

    $status.html(status);
}

function removeHighlighting() {
    $('#chessBoard .square-55d63').css('background', '');
}

function highlighting(square) {
    var $square = $('#chessBoard .square-' + square);
    var bg = whiteSquareGrey;
    if ($square.hasClass('black-3c85d')) {
        bg = blackSquareGrey;
    }

    $square.css('background', bg);
}


function movePiece(oldPos, newPos) {
    board.move(oldPos + '-' + newPos);
}