import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:feature_first_structure/features/sample_feature/data/models/sample_model.dart';
import 'package:feature_first_structure/features/sample_feature/data/repositories/sample_repository.dart';

part 'sample_feature_state.dart';

class SampleFeatureCubit extends Cubit<SampleFeatureState> {
  SampleFeatureCubit(this._sampleRepository) : super(SampleFeatureInitial());

  final SampleRepository _sampleRepository;

  Future<void> fetchSample() async {
    emit(const SampleFeatureLoading());
    try {
      final response = await _sampleRepository.getSample();
      emit(
        response.fold(
          (l) => SampleFeatureError(error: l),
          (r) => SampleFeatureLoaded(sample: r),
        ),
      );
    } catch (e) {
      emit(SampleFeatureError(error: e.toString()));
    }
  }
}
