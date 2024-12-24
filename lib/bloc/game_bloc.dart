import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  late int _targetNumber;
  late int _maxAttempts;
  late List<int> _previousGuesses;

  GameBloc() : super(GameInitial()) {
    on<StartNewGame>(_onStartNewGame);
    on<MakeGuess>(_onMakeGuess);
  }

  _onStartNewGame(StartNewGame event, Emitter<GameState> emit) {
    _maxAttempts = event.maxAttempts;
    _targetNumber = Random().nextInt(event.maxNumber) + 1;
    _previousGuesses = [];

    emit(GameInProgress(
      maxNumber: event.maxNumber,
      remainingAttempts: _maxAttempts,
      previousGuesses: _previousGuesses,
    ));
  }

  _onMakeGuess(MakeGuess event, Emitter<GameState> emit) {
    if (state is GameInProgress) {
      _previousGuesses.add(event.guess);

      if (event.guess == _targetNumber) {
        emit(GameWon(
          targetNumber: _targetNumber,
          attempts:
              _maxAttempts - (state as GameInProgress).remainingAttempts + 1,
        ));
        return;
      }

      final remainingAttempts = (state as GameInProgress).remainingAttempts - 1;

      if (remainingAttempts == 0) {
        emit(GameLost(targetNumber: _targetNumber));
        return;
      }

      String hint = event.guess < _targetNumber ? 'Больше' : 'Меньше';

      emit(GameInProgress(
        maxNumber: (state as GameInProgress).maxNumber,
        remainingAttempts: remainingAttempts,
        previousGuesses: _previousGuesses,
        hint: hint,
      ));
    }
  }
}
