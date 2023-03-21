import 'package:flutter/material.dart';

class GameCell extends StatelessWidget {
  final String player;
  final VoidCallback onTap;

  const GameCell({Key? key, required this.player, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            player,
            style: TextStyle(
              fontSize: 48,
              color: Colors.black
            ),
          ),
        ),
      ),
    );
  }
}