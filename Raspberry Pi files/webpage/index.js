/*
    Name:       index.js
    Created:    18.08.2019
    Author:     Viperinius
*/

var board;

//create chess board
//$(document).ready(function () {
    board = Chessboard('chessBoard', 'start');
//});


// doesnt work yet
$('#resetBoard').on('click', board.start);

$('#clear').on('click', board.clear);