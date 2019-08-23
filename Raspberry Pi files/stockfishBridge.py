"""
    Name:       stockfishBridge.py
    Created:    23.08.2019
    Author:     Viperinius
"""

import config

from stockfish import Stockfish

params = {
    "Write Debug Log": config.STOCKFISH_LOG,
    "Contempt": config.STOCKFISH_CONTEMPT,
    "Min Split Depth": 0,
    "Threads": config.STOCKFISH_THREADS,
    "Ponder": config.STOCKFISH_PONDER,
    "Hash": config.STOCKFISH_HASH,
    "MultiPV": config.STOCKFISH_MULTIPV,
    "Skill Level": config.STOCKFISH_SKILL,
    "Move Overhead": config.STOCKFISH_OVERHEAD,
    "Minimum Thinking Time": config.STOCKFISH_THINKING,
    "Slow Mover": config.STOCKFISH_SLOW,
    "UCI_Chess960": config.STOCKFISH_CHESS960
}


def startNewGame():
    return Stockfish(path=config.STOCKFISH_PATH, param=params)


def doAiMoving():
    """
    Calculates best move and executes it
    
    Returns old and new position of the moved piece as tuple
    If move was somehow misconstructed, returns empty string
    """
    move = getBestMove()
    stockfish.set_position([move])
    return deconstructAlgebNotation(move)


def getBestMove():
    return stockfish.get_best_move()


def doPlayerMoving(oldPos, newPos):
    """
    Move Piece from oldPos to newPos

    Returns bool, if move successful/possible
    """
    move = constructAlgebNotation(oldPos, newPos)

    if stockfish.is_move_correct(move):
        stockfish.set_position([move])
        return True
    else:
        return False


def constructAlgebNotation(oldPos, newPos):
    return oldPos + newPos

def deconstructAlgebNotation(move):
    chars = list(move)
    if len(chars) == 4:
        return (chars[0] + chars[1]), (chars[2] + chars[3])
    else:
        return ""

stockfish = startNewGame()