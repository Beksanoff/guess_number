import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_solva/bloc/game_bloc.dart';

import '../../bloc/game_event.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final TextEditingController _maxNumberController =
      TextEditingController(text: '100');
  final TextEditingController _maxAttemptsController =
      TextEditingController(text: '10');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _maxNumberController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Максимальное число (n)',
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _maxAttemptsController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Количество попыток (m)',
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            final maxNumber = int.tryParse(_maxNumberController.text) ?? 100;
            final maxAttempts = int.tryParse(_maxAttemptsController.text) ?? 10;
            context.read<GameBloc>().add(StartNewGame(
                  maxNumber: maxNumber,
                  maxAttempts: maxAttempts,
                ));
          },
          child: const Text('Начать игру'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _maxNumberController.dispose();
    _maxAttemptsController.dispose();
    super.dispose();
  }
}
