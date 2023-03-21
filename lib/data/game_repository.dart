import 'package:flutter/material.dart';

class GameRepository {

  /// Variable that stores the current player ('X' or 'O').
  /// Variável que armazena o jogador atual ('X' ou 'O').
  late String _currentPlayer;
    
  /// Variable that stores the board state in a 3x3 matrix.
  /// Variável que armazena o estado do tabuleiro em uma matriz 3x3.
  late List<List<String>> _board;

  /// ValueNotifier used to notify changes in the board state.
  /// ValueNotifier usado para notificar as mudanças no estado do tabuleiro.
  final ValueNotifier<List<List<String>>> boardNotifier;

  /// Constructor that initializes the board state and ValueNotifier.
  /// Construtor que inicializa o estado do tabuleiro e o ValueNotifier.
  GameRepository() : boardNotifier = ValueNotifier<List<List<String>>>(List.generate(3, (_) => List.filled(3, ''))) {
    _resetBoard();
  }

  /// Resets the board state to an empty 3x3 matrix and sets the current player to 'X'.
  /// Redefine o estado do tabuleiro para uma matriz 3x3 vazia e define o jogador atual como 'X'.
  void _resetBoard() {
    _board = List.generate(3, (_) => List.filled(3, ''));
    _currentPlayer = 'X';
    boardNotifier.value = List.generate(3, (i) => List.from(_board[i]));
  }

  /// Getter to access the current board state.
  /// Getter para acessar o estado atual do tabuleiro.
  List<List<String>> get board => _board;

  /// Getter to access the current player.
  /// Getter para acessar o jogador atual. 
  String get currentPlayer => _currentPlayer;

  /// Makes a move at the given position (x, y) if the cell is empty and updates the current player.
  /// Realiza uma jogada na posição fornecida (x, y) se a célula estiver vazia e atualiza o jogador atual.
  void makeMove(int x, int y) {
    if (_board[x][y].isEmpty) {
      _board[x][y] = _currentPlayer;
      _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
      boardNotifier.value = List.generate(3, (i) => List.from(_board[i]));
    }
  }

  /// Helper function that checks if a list of three strings is a winning row, column, or diagonal.
  /// Função auxiliar que verifica se uma lista de três strings é uma linha, coluna ou diagonal vencedora.
  bool _isWinningLine(List<String> line) {
    return line[0] == line[1] && line[1] == line[2] && line[0] != '';
  }

  /// Checks if there is a winner on the current board state.
  /// Verifica se há um vencedor no estado atual do tabuleiro.
  bool checkWin() {
    for (int i = 0; i < 3; i++) {
      // Check rows and columns for a win.
      // Verifica linhas e colunas em busca de uma vitória.
      if (_isWinningLine(_board[i]) || _isWinningLine([_board[0][i], _board[1][i], _board[2][i]])) {
        return true;
      }
    }

    // Check diagonals for a win.
    // Verifica diagonais em busca de uma vitória.
    if (_isWinningLine([_board[0][0], _board[1][1], _board[2][2]]) ||
        _isWinningLine([_board[0][2], _board[1][1], _board[2][0]])) {
      return true;
    }

    // If no winner is found, return false.
    // Se nenhum vencedor for encontrado, retorna falso.
    return false;
  }

  /// Restarts the game by resetting the board state and notifying the change.
  /// Reinicia o jogo, redefinindo o estado do tabuleiro e notificando a mudança.
  void restartGame() {
    _resetBoard();
    boardNotifier.value = _board;
  }
}
