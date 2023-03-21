import 'package:noughts_and_crosses/data/game_repository.dart';

class RestartGame {
  final GameRepository _gameRepository;

  RestartGame(this._gameRepository);

  void call() {
    _gameRepository.restartGame();
  }
}