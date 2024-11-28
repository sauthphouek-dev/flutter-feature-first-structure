import 'package:go_router/go_router.dart';

import '../screens/sample_feature/presentation/screens/sample_view.dart';

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
        builder: (context, state) => const SampleFeatureView(),
      ),
    ],
  );
}
