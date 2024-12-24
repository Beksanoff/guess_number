// lib/screens/widgets/game_initial_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/game_bloc.dart';
import '../../bloc/game_event.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final TextEditingController _maxNumberController = TextEditingController();
  final TextEditingController _maxAttemptsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _maxNumberController.text = '100';
    _maxAttemptsController.text = '10';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Настройки игры',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _maxNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Максимальное число (n)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.numbers),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _maxAttemptsController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Количество попыток (m)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.replay_rounded),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    final maxNumber =
                        int.tryParse(_maxNumberController.text) ?? 100;
                    final maxAttempts =
                        int.tryParse(_maxAttemptsController.text) ?? 10;
                    context.read<GameBloc>().add(StartNewGame(
                          maxNumber: maxNumber,
                          maxAttempts: maxAttempts,
                        ));
                  },
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Начать игру'),
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

  @override
  void dispose() {
    _maxNumberController.dispose();
    _maxAttemptsController.dispose();
    super.dispose();
  }
}
