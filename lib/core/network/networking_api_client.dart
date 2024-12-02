import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:feature_first_structure/core/network/http_client.dart';
import 'package:feature_first_structure/features/sample_feature/data/models/sample_model.dart';

/// A base type for all API client responses.
/// Represents either a failure ([Left]) or a success ([Right]).
typedef Response<L, R> = Future<Either<L, R>>;

/// Extension on [Either] to handle success and failure cases in [Response].
extension ResponseExtension<L, R> on Either<L, R> {
  /// Executes the appropriate callback based on whether the [Response] is
  /// a success ([Right]) or a failure ([Left]).
  ///
  /// - [success]: Called when the [Response] is a [Right], with the success value.
  /// - [failure]: Called when the [Response] is a [Left], with the failure value.

  Future<T> when<T>({
    required Future<T> Function(R) success,
    required Future<T> Function(L) failure,
  }) async {
    return fold(
      (left) => failure(left),
      (right) => success(right),
    );
  }
}

class NetworkingApiClient {
  /// Creates a new instance of [NetworkingApiClient].
  NetworkingApiClient({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  final HttpClient _httpClient;

  /// Fetches the sample data from the API.
  ///
  /// Returns a `Map<String, dynamic>` containing the API response.
  /// Throws an `ApiException` if the response indicates an error.
  Future<Either<String, List<SampleModel>>> getSample() async {
    try {
      // Make the GET request
      // final response = await _httpClient.get('/sample');
      //
      // // Check for success status code
      // final sampleResponse = SampleResponse.fromJson(response);

      // example of list of objects
      final listSample = List<SampleModel>.from([
        // example of object
        SampleModel(
          id: 1,
          name: 'Sample 1',
          description: 'Sample description 1',
        ),
        // example of object
        SampleModel(
          id: 2,
          name: 'Sample 2',
          description: 'Sample description 2',
        ),
        // example of object
        SampleModel(
          id: 3,
          name: 'Sample 3',
          description: 'Sample description 3',
        ),
        // example of object
        SampleModel(
          id: 4,
          name: 'Sample 4',
          description: 'Sample description 4',
        ),
      ]);

      return Right(listSample);

      // if (listSampleResponse.success) {
      //   return Right(SampleResponse.fromJson(response));
      // }
      // return Left(sampleResponse.message);

      //
    } on DioException catch (dioError) {
      // Handle DioException
      if (dioError.response != null) {
        // Check for status code in the response
        if (dioError.response!.statusCode == 401) {
          // Handle unauthorized error
          return const Left('Unauthorized');
        }
        if (dioError.response!.statusCode == 404) {
          // Handle not found error
          return const Left('Not found');
        }
        // Handle other status codes
        return const Left('An error occurred');
      }

      // Handle other exceptions
      return const Left('An error occurred');
    } catch (e, stackTrace) {
      // Log unexpected errors for debugging
      log('Unexpected error: $e\n$stackTrace');
      // Rethrow as a custom exception
      throw ApiException('An unexpected error occurred.');
    }
  }
}

/// A custom exception class for API-related errors.
class ApiException implements Exception {
  /// Creates a new instance of [ApiException].
  ApiException(this.message, {this.statusCode});

  /// The error message.
  final String message;

  /// The HTTP status code associated with the error.
  final int? statusCode;

  @override
  String toString() => 'ApiException: $message';
}
