part of 'environment_cubit.dart';

sealed class EnvironmentState extends Equatable {
  const EnvironmentState();
}

final class EnvironmentInitial extends EnvironmentState {
  @override
  List<Object> get props => [];
}

final class EnvironmentLoaded extends EnvironmentState {
  const EnvironmentLoaded({required this.environment});

  final EnvironmentModel environment;

  @override
  List<Object> get props => [environment];
}

final class EnvironmentError extends EnvironmentState {
  const EnvironmentError({required this.error});

  final String error;

  @override
  List<Object> get props => [error];
}
