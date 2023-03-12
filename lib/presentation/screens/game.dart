import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _componente
    );
  }

  Widget get _componente {
    return GridView.builder(
      gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: 9,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            // Lógica para lidar com o clique na célula do jogo.
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Center(
              child: Text(
                '',
                style: TextStyle(fontSize: 48.0),
              ),
            ),
          ),
        );
      },
    );
  }

}