import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/game_bloc.dart';
import 'screen/game_screen.dart';

void main() {
  runApp(const GuessNumberGame());
}

class GuessNumberGame extends StatelessWidget {
  const GuessNumberGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Угадай число',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => GameBloc(),
        child: const GameScreen(),
      ),
    );
  }
}
