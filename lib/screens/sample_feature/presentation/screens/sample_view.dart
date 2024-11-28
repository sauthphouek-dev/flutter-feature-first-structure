import 'package:flutter/material.dart';

/// {@template sample_feature_view}
/// Sample Feature View
/// {@endtemplate}
class SampleFeatureView extends StatelessWidget {
  /// {@macro sample_feature_view}
  const SampleFeatureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Feature'),
      ),
      body: const Center(
        child: Text('Sample Feature'),
      ),
    );
  }
}
