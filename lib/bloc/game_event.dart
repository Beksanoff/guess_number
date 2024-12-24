abstract class GameEvent {}

class StartNewGame extends GameEvent {
  final int maxNumber;
  final int maxAttempts;

  StartNewGame({required this.maxNumber, required this.maxAttempts});
}

class MakeGuess extends GameEvent {
  final int guess;

  MakeGuess({required this.guess});
}
