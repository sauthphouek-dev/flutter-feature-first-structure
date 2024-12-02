import 'package:feature_first_structure/features/sample_feature/presentation/screens/sample_view.dart';
import 'package:go_router/go_router.dart';

/// {@template router}
/// Router for the app.
/// {@endtemplate}
class RouteConfigure {
  /// {@macro router}

  static final GoRouter router = GoRouter(
    routes: [
      // Sample Feature
      GoRoute(
        path: '/',
        builder: (context, state) => const SampleView(),
      ),
    ],
  );
}
