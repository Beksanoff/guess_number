import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_solva/bloc/game_bloc.dart';
import '../bloc/game_state.dart';
import 'widgets/game_initial_screen.dart';
import 'widgets/game_process_screen.dart';
import 'widgets/game_result_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Угадай число'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<GameBloc, GameState>(
          builder: (context, state) {
            if (state is GameInitial) {
              return const InitialScreen();
            } else if (state is GameInProgress) {
              return GameProgressScreen(state: state);
            } else if (state is GameWon) {
              return ResultScreen(
                message:
                    'Поздравляем! Вы угадали число ${state.targetNumber} за ${state.attempts} попыток!',
              );
            } else if (state is GameLost) {
              return ResultScreen(
                message:
                    'Игра окончена! Загаданное число было: ${state.targetNumber}',
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
