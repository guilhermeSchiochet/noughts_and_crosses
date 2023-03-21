import 'package:noughts_and_crosses/data/game_repository.dart';

class MakeMove {
  final GameRepository _gameRepository;

  MakeMove(this._gameRepository);

  void call(int x, int y) {
    _gameRepository.makeMove(x, y);
  }
}