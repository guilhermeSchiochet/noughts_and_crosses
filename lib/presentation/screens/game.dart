import 'package:flutter/material.dart';
import 'package:noughts_and_crosses/data/game_repository.dart';
import 'package:noughts_and_crosses/domain/usecases/check_win.dart';
import 'package:noughts_and_crosses/domain/usecases/make_move.dart';
import 'package:noughts_and_crosses/domain/usecases/restart_game.dart';
import 'package:noughts_and_crosses/presentation/widgets/colors_app.dart';
import 'package:noughts_and_crosses/presentation/widgets/game_cell.dart';
import 'package:noughts_and_crosses/presentation/widgets/grid_view_app.dart';
import 'package:noughts_and_crosses/presentation/widgets/winner_dialog.dart';

/// The Game widget is responsible for managing the state and user interaction
/// of the Tic Tac Toe game. It displays the game board and handles user input
/// by updating the game state and checking for a winner.
///
/// O widget Game é responsável por gerenciar o estado e a interação do usuário
/// no jogo da velha. Ele exibe o tabuleiro do jogo e lida com a entrada do usuário
/// atualizando o estado do jogo e verificando se há um vencedor.
class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {

  late MakeMove _makeMove;
  late CheckWin _checkWin;
  late RestartGame _restartGame;
  late GameRepository _gameRepository;

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  /// Initializes the game state, setting up the game repository and use cases.
  ///
  /// Inicializa o estado do jogo, configurando o repositório de jogo e os casos de uso.
  void _initializeGame() {
    _gameRepository = GameRepository();
    _makeMove = MakeMove(_gameRepository);
    _checkWin = CheckWin(_gameRepository);
    _restartGame = RestartGame(_gameRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: ColorsApp.colorsApp,
      body: _buildGameBoard(),
      bottomNavigationBar: _buildRestartButton(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Noughts And Crosses',
        style: TextStyle(
          color: Colors.white
        ),
      ),
      backgroundColor: ColorsApp.colorsApp,
    );
  }

  /// Builds the Tic Tac Toe game board using an AnimatedBuilder and auxiliary
  /// functions to handle user input and game state updates.
  ///
  /// Constrói o tabuleiro do jogo da velha usando um AnimatedBuilder e funções
  /// auxiliares para lidar com a entrada do usuário e atualizações do estado do jogo.
  Widget _buildGameBoard() {
    return _createAnimatedBuilder();
  }

  /// Creates an AnimatedBuilder that responds to changes in the game board state.
  ///
  /// Cria um AnimatedBuilder que responde às mudanças no estado do tabuleiro do jogo.
  Widget _createAnimatedBuilder() {
    return AnimatedBuilder(
      animation: _gameRepository.boardNotifier,
      builder: (BuildContext context, _) {
        return _createGridViewApp();
      },
    );
  }

  /// Creates a GridViewApp widget that displays the game board cells.
  ///
  /// Cria um widget GridViewApp que exibe as células do tabuleiro do jogo.
  Widget _createGridViewApp() {
    return  Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AspectRatio(
          aspectRatio: 1,
          child: GridViewApp(
            itemCoun: 9,
            crossAxisCount: 3,
            component: (context, idx) {
              int x = idx ~/ 3;
              int y = idx % 3;

              return _createGameCell(x, y);
            },
          ),
        ),
      )
    );
  }

  /// Creates a GameCell widget with the appropriate player symbol and onTap behavior.
  ///
  /// Cria um widget GameCell com o símbolo do jogador apropriado e comportamento onTap.
  Widget _createGameCell(int x, int y) {
    return GameCell(
      player: _gameRepository.board[x][y],
      onTap: () {
        _handleCellTap(x, y);
      },
    );
  }

  /// Handles user input when a cell is tapped, updating the game state,
  /// checking for a winner, and displaying a dialog if there's a winner.
  ///
  /// Lida com a entrada do usuário quando uma célula é tocada, atualizando o estado do jogo,
  /// verificando se há um vencedor e exibindo um diálogo se houver um vencedor.
  void _handleCellTap(int x, int y) {
    _makeMove.call(x, y);
    if (_checkWin.call()) {
      _showWinnerDialog();
    }
  }

  /// Displays a dialog announcing the winner and providing an option to restart the game.
  ///
  /// Exibe um diálogo anunciando o vencedor e fornecendo uma opção para reiniciar o jogo.
  void _showWinnerDialog() {
    WinnerDialog.show(context, _gameRepository.currentPlayer == 'X' ? 'O' : 'X', () {
      _restartGame.call();
    });
  }

  Widget _buildRestartButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(  
        onPressed: () {
          setState(() {
            _restartGame.call();
          });
        },
        child: Text(
          'Reiniciar Jogo',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsApp.darkBlueGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 12.0
          ),
        ),
      ),
    );
  }
}