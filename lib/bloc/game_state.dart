abstract class GameState {}

class GameInitial extends GameState {}

class GameInProgress extends GameState {
  final int maxNumber;
  final int remainingAttempts;
  final List<int> previousGuesses;
  final String? hint;

  GameInProgress({
    required this.maxNumber,
    required this.remainingAttempts,
    required this.previousGuesses,
    this.hint,
  });
}

class GameWon extends GameState {
  final int targetNumber;
  final int attempts;

  GameWon({required this.targetNumber, required this.attempts});
}

class GameLost extends GameState {
  final int targetNumber;

  GameLost({required this.targetNumber});
}
