// class sample model for the sample feature

import 'package:json_annotation/json_annotation.dart';

import '../../../../core/helpers/base_response.dart';

part 'sample_model.g.dart';

@JsonSerializable()
class SampleModel {
  const SampleModel({
    required this.id,
    required this.name,
    required this.description,
  });

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory SampleModel.fromJson(Map<String, dynamic> json) =>
      _$SampleModelFromJson(json);

  final int id;
  final String name;
  final String description;

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SampleModelToJson(this);
}

class SampleResponse extends BaseResponse {
  SampleResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    data = json.getListOrDefault('data').cast<SampleModel>();
  }

  late List<SampleModel> data;

  @override
  String toString() {
    return 'SampleResponse{data: $data, success: $success, message: $message}';
  }
}
