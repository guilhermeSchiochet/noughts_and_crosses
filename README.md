## 🕹 Tic Tac Toe

This is a simple tic tac toe game developed in Flutter.

*   Flutter version 3.7.6

*   Dart version 2.19.3

*   Material design used

Device information used to create the game:

*   Dimensions: 164.19 x 76.1 x 8.12 mm

*   Resolution: 1080 x 2400 pixels

*   Screen size: 6.67 inches

*   Processor: 2x 2.05 GHz Cortex-A76 + 6x 2.0 GHz Cortex-A55

*   RAM: 6 GB

### ⛏ Installation

To install and run the game, follow these steps:

1.  Clone the repository to your local machine.

2.  Open the project in your favorite code editor or IDE.

3.  Run the game using the Flutter SDK.

### ▶ How to Play

To play the game, follow these steps:

1.  Launch the game on your device.

2.  Tap a cell on the board to make a move.

3.  Try to get three of your symbols in a row to win the game.

### 🗺 Architecture and Function Explanations

The game was developed using a clean and modular architecture that makes it easy to maintain and understand the code. Some of the main components of the application are:

*   GameRepository: This class is responsible for storing and managing the game state, such as the current board and the current player. It also contains methods for making moves and checking for a winner.

*   MakeMove, CheckWin, RestartGame: These are domain use cases that encapsulate game logic. They interact with the GameRepository and are used to make moves, check for a winner, and restart the game, respectively.

*   GameCell: This is a custom widget that represents a cell on the game board. It is responsible for displaying the player's symbol ('X' or 'O') and detecting user taps.

*   GridViewApp: This custom widget creates a GridView to display the game cells. It receives an itemBuilder to build each cell, as well as additional parameters to customize the GridView layout.

*   WinnerDialog: This custom widget displays a dialog when a player wins the game. It shows which player won and provides an option to restart the game.

By following these steps, you should be able to install and play the Tic Tac Toe game on your device. Enjoy!

***

## 🕹 Jogo da Velha

Este é um simples jogo da velha desenvolvido em Flutter.

*   Versão do Flutter: 3.7.6

*   Versão do Dart: 2.19.3

*   Material design utilizado

Informações do dispositivo utilizadas para criar o jogo:

*   Dimensões: 164,19 x 76,1 x 8,12 mm

*   Resolução: 1080 x 2400 pixels

*   Tamanho da tela: 6,67 polegadas

*   Processador: 2x 2.05 GHz Cortex-A76 + 6x 2.0 GHz Cortex-A55

*   RAM: 6 GB

### ⛏ Instalação

Para instalar e executar o jogo, siga estas etapas:

1.  Clone o repositório em sua máquina local.

2.  Abra o projeto em seu editor ou ambiente de desenvolvimento favorito.

3.  Execute o jogo usando o Flutter SDK.

### ▶ Como jogar

Para jogar, siga estas etapas:

1.  Inicie o jogo em seu dispositivo.

2.  Toque em uma célula do tabuleiro para fazer uma jogada.

3.  Tente obter três de seus símbolos em uma linha para vencer o jogo.

### 🗺 Explicação da Arquitetura e Funções

O jogo foi desenvolvido usando uma arquitetura limpa e modular que torna fácil manter e entender o código. Alguns dos principais componentes do aplicativo são:

GameRepository: Esta classe é responsável por armazenar e gerenciar o estado do jogo, como o tabuleiro atual e o jogador atual. Também contém métodos para fazer jogadas e verificar se há um vencedor.

MakeMove, CheckWin, RestartGame: Estes são casos de uso de domínio que encapsulam a lógica do jogo. Eles interagem com o GameRepository e são usados para fazer jogadas, verificar se há um vencedor e reiniciar o jogo, respectivamente.

GameCell: Este é um widget personalizado que representa uma célula no tabuleiro do jogo. Ele é responsável por exibir o símbolo do jogador ('X' ou 'O') e detectar toques do usuário.

GridViewApp: Este widget personalizado cria um GridView para exibir as células do jogo. Ele recebe um itemBuilder para construir cada célula, além de parâmetros adicionais para personalizar o layout do GridView.

WinnerDialog: Este widget personalizado exibe um diálogo quando um jogador vence o jogo. Ele mostra qual jogador venceu e fornece uma opção para reiniciar o jogo.

Seguindo estas etapas, você deve ser capaz de instalar e jogar o Jogo da Velha em seu dispositivo. Divirta-se!
