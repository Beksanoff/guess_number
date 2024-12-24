import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_solva/bloc/game_bloc.dart';
import '../../bloc/game_event.dart';

class ResultScreen extends StatelessWidget {
  final String message;

  const ResultScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              context.read<GameBloc>().add(StartNewGame(
                    maxNumber: 100,
                    maxAttempts: 10,
                  ));
            },
            child: const Text('Начать игру заново'),
          ),
        ],
      ),
    );
  }
}
