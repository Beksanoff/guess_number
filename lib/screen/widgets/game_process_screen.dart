import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_solva/bloc/game_bloc.dart';

import '../../bloc/game_event.dart';
import '../../bloc/game_state.dart';

class GameProgressScreen extends StatefulWidget {
  final GameInProgress state;

  const GameProgressScreen({super.key, required this.state});

  @override
  State<GameProgressScreen> createState() => _GameProgressScreenState();
}

class _GameProgressScreenState extends State<GameProgressScreen> {
  final TextEditingController _guessController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Осталось попыток: ${widget.state.remainingAttempts}'),
        const SizedBox(height: 16),
        if (widget.state.hint != null) ...[
          Text('Подсказка: ${widget.state.hint}'),
          const SizedBox(height: 16),
        ],
        TextField(
          controller: _guessController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Введите число',
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            final guess = int.tryParse(_guessController.text);
            if (guess != null) {
              context.read<GameBloc>().add(MakeGuess(guess: guess));
              _guessController.clear();
            }
          },
          child: const Text('Угадать'),
        ),
        const SizedBox(height: 24),
        Text('Предыдущие попытки: ${widget.state.previousGuesses.join(", ")}'),
      ],
    );
  }

  @override
  void dispose() {
    _guessController.dispose();
    super.dispose();
  }
}
