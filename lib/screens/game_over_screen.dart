/* import 'package:flappy_bird_game/game/assets.dart';
 */
import 'package:flappy_bird_game/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = "gameOver";

  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Score: ${game.bird.score}',
              style: const TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontFamily: 'Game',
              ),
            ),
            const SizedBox(height: 20),
            Image.asset('assets/images/gameOver1.png'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => onRestart(game),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              child: const Text(
                'Restart',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void onRestart(FlappyBirdGame game) {
  game.bird.reset();
  game.overlays.remove('gameOver');
  game.resumeEngine();
}
