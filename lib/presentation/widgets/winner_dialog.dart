import 'package:flutter/material.dart';

class WinnerDialog {
  static void show(BuildContext context, String winner, VoidCallback onRestart) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Vencedor!'),
          content: Text('O jogador $winner venceu!'),
          actions: [
            TextButton(
              onPressed: () {
                onRestart();
                Navigator.of(context).pop();
              },
              child: Text('Reiniciar'),
            ),
          ],
        );
      },
    );
  }
}