import 'package:flutter/material.dart';

///  Environment enum for the app
enum Environment { dev, qas, staging, demo, prod }

///  Environment model for the app
class EnvironmentModel {
  const EnvironmentModel({
    required this.environment,
    required this.baseUrl,
    required this.version,
    required this.api,
    required this.name,
    this.color,
  }); // production color is null by default

  /// factory method to create an instance of [EnvironmentModel]
  factory EnvironmentModel.from(Environment environment) {
    switch (environment) {
      case Environment.dev:
        return const EnvironmentModel(
          environment: Environment.dev,
          baseUrl: 'https://dev.api.com',
          version: 'v1',
          api: 'api',
          color: Colors.red,
          name: 'dev',
        );
      case Environment.qas:
        return const EnvironmentModel(
          environment: Environment.qas,
          baseUrl: 'https://qa.api.com',
          version: 'v1',
          api: 'api',
          color: Colors.green,
          name: 'qas',
        );
      case Environment.staging:
        return const EnvironmentModel(
          environment: Environment.staging,
          baseUrl: 'https://staging.api.com',
          version: 'v1',
          api: 'api',
          color: Colors.blue,
          name: 'stag',
        );
      case Environment.demo:
        return const EnvironmentModel(
          environment: Environment.demo,
          baseUrl: 'https://demo.api.com',
          version: 'v1',
          api: 'api',
          color: Colors.yellow,
          name: 'demo',
        );
      case Environment.prod:
        return const EnvironmentModel(
          environment: Environment.prod,
          baseUrl: 'https://prod.api.com',
          version: 'v1',
          api: 'api',
          color: Colors.orange,
          name: 'prod',
        );
    }
  }

  List<Object?> get props => [
        environment,
        baseUrl,
        version,
        api,
        color,
        name,
      ];

  final Environment environment;
  final String baseUrl;
  final String version;
  final String api;
  final Color? color;
  final String name;
}
