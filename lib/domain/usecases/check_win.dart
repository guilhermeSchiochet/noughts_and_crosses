import 'package:noughts_and_crosses/data/game_repository.dart';

class CheckWin {
  final GameRepository _gameRepository;

  CheckWin(this._gameRepository);

  bool call() {
    return _gameRepository.checkWin();
  }
}