import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sample_feature_state.dart';

class SampleFeatureCubit extends Cubit<SampleFeatureState> {
  SampleFeatureCubit() : super(SampleFeatureInitial());
}
