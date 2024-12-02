part of 'sample_feature_cubit.dart';

sealed class SampleFeatureState extends Equatable {
  const SampleFeatureState();
}

final class SampleFeatureInitial extends SampleFeatureState {
  @override
  List<Object> get props => [];
}

final class SampleFeatureLoading extends SampleFeatureState {
  const SampleFeatureLoading();

  @override
  List<Object?> get props => [];
}

final class SampleFeatureLoaded extends SampleFeatureState {
  const SampleFeatureLoaded({required this.sample});

  final List<SampleModel> sample;

  @override
  List<Object> get props => [sample];
}

final class SampleFeatureError extends SampleFeatureState {
  const SampleFeatureError({required this.error});

  final String error;

  @override
  List<Object> get props => [error];
}
