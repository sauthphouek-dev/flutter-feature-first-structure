import 'package:feature_first_structure/core/constants/app_sizing.dart';
import 'package:feature_first_structure/features/sample_feature/data/repositories/sample_repository.dart';
import 'package:feature_first_structure/features/sample_feature/logic/sample_feature_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SampleView extends StatelessWidget {
  const SampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SampleFeatureCubit(
        RepositoryProvider.of<SampleRepository>(context),
      )..fetchSample(),
      child: const SampleFeatureView(),
    );
  }
}

class SampleFeatureView extends StatelessWidget {
  /// {@macro sample_feature_view}
  const SampleFeatureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Feature'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSizing.appPadding),
          Text(
            'Sample Feature',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: AppSizing.appPadding),
          Expanded(
            child: BlocBuilder<SampleFeatureCubit, SampleFeatureState>(
              builder: (context, state) {
                if (state is SampleFeatureLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SampleFeatureLoaded) {
                  return ListView.builder(
                    itemCount: state.sample.length,
                    padding: const EdgeInsets.all(AppSizing.appPadding),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.sample[index].name),
                        subtitle: Text(state.sample[index].description),
                      );
                    },
                  );
                } else if (state is SampleFeatureError) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
