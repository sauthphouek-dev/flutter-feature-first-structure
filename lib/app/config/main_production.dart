import 'package:feature_first_structure/app/app.dart';
import 'package:feature_first_structure/app/bootstrap.dart';
import 'package:feature_first_structure/environment/model/environment_model.dart';

void main() {
  bootstrap(() {
    final environment = EnvironmentModel.from(Environment.prod);
    return App(environment: environment);
  });
}
