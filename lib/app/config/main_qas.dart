import 'package:dio/dio.dart';
import 'package:feature_first_structure/app/app.dart';
import 'package:feature_first_structure/app/bootstrap.dart';
import 'package:feature_first_structure/core/network/http_client.dart';
import 'package:feature_first_structure/core/network/networking_api_client.dart';
import 'package:feature_first_structure/core/storage/persisten_storage.dart';
import 'package:feature_first_structure/core/storage/token_storage.dart';
import 'package:feature_first_structure/environment/model/environment_model.dart';
import 'package:feature_first_structure/features/sample_feature/data/repositories/sample_repository.dart';

void main() {
  bootstrap((sharedPreferences) async {
    final persistentStorage = PersistentStorage(
      sharedPreferences: sharedPreferences,
    );

    final environment = EnvironmentModel.from(Environment.qas);

    final tokenStorage = TokenStorage(
      storage: persistentStorage,
    );

    final httpClient = DioHttpClient(
      dio: Dio(),
      baseUrl: environment.baseUrl,
      tokenStorage: tokenStorage,
    );

    final apiClient = NetworkingApiClient(httpClient: httpClient);

    final sampleRepository = SampleRepository(apiClient);

    return App(environment: environment, sampleRepository: sampleRepository);
  });
}
