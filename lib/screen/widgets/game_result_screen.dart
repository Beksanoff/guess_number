import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/game_bloc.dart';
import '../../bloc/game_event.dart';
import '../../bloc/game_state.dart';

class ResultScreen extends StatelessWidget {
  final String message;

  const ResultScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isWin = context.read<GameBloc>().state is GameWon;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isWin ? Icons.emoji_events : Icons.mood_bad,
                  size: 64,
                  color: isWin
                      ? Colors.amber
                      : Theme.of(context).colorScheme.error,
                ),
                const SizedBox(height: 16),
                Text(
                  message,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: isWin
                            ? Colors.green
                            : Theme.of(context).colorScheme.error,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    context.read<GameBloc>().add(StartNewGame(
                          maxNumber: 100,
                          maxAttempts: 10,
                        ));
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Начать новую игру'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
