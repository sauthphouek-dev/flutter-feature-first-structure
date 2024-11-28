part of 'sample_feature_cubit.dart';

sealed class SampleFeatureState extends Equatable {
  const SampleFeatureState();
}

final class SampleFeatureInitial extends SampleFeatureState {
  @override
  List<Object> get props => [];
}
