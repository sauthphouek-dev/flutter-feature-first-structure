import 'package:feature_first_structure/app/router.dart';
import 'package:feature_first_structure/core/theme/app_theme.dart';
import 'package:feature_first_structure/environment/logic/environment_cubit.dart';
import 'package:feature_first_structure/environment/model/environment_model.dart';
import 'package:feature_first_structure/features/sample_feature/data/repositories/sample_repository.dart';
import 'package:feature_first_structure/l10n/l10n.dart';
import 'package:feature_first_structure/shared/widgets/global_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    required EnvironmentModel environment,
    required SampleRepository sampleRepository,
    super.key,
  })  : _environment = environment,
        _sampleRepository = sampleRepository;

  final EnvironmentModel _environment;
  final SampleRepository _sampleRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _environment),
        RepositoryProvider.value(value: _sampleRepository),
      ],
      child: MultiBlocProviders(
        environment: _environment,
      ),
    );
  }
}

/// The Default App [Widget]. This is the main entry point for the app.
class MultiBlocProviders extends StatelessWidget {
  const MultiBlocProviders({
    required EnvironmentModel environment,
    super.key,
  }) : _environment = environment;

  final EnvironmentModel _environment;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EnvironmentCubit>(
          create: (context) =>
              EnvironmentCubit()..loadEnvironment(_environment),
        ),
      ],
      child: const MaterialRouterApp(),
    );
  }
}

/// The Default App [Widget].
class MaterialRouterApp extends StatelessWidget {
  const MaterialRouterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: const AppTheme().themeData,
      darkTheme: const AppDarkTheme().themeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: RouteConfigure.router,
      builder: (context, child) {
        return buildGlobalLoaderOverlyWidget(child);
      },
    );
  }

  GlobalLoaderOverlyWidget buildGlobalLoaderOverlyWidget(Widget? child) {
    return GlobalLoaderOverlyWidget(
      child: child!,
    );
  }
}
