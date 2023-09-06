import 'package:json_annotation/json_annotation.dart';

part 'req_res_unknown_data.g.dart';

@JsonSerializable()
class ReqResUnknownResourceModel {
  final List<ReqResUnknownData>? data;

  ReqResUnknownResourceModel({this.data});

  factory ReqResUnknownResourceModel.fromJson(Map<String, dynamic> json) {
    return _$ReqResUnknownResourceModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ReqResUnknownResourceModelToJson(this);
  }
}

@JsonSerializable()
class ReqResUnknownData {
  final int? id;
  final String? name;
  final int? year;
  final String? color;
  final String? pantoneValue;
  final double? price;

  ReqResUnknownData({
    this.id,
    this.name,
    this.year,
    this.color,
    this.pantoneValue,
    this.price,
  });

  factory ReqResUnknownData.fromJson(Map<String, dynamic> json) {
    return _$ReqResUnknownDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ReqResUnknownDataToJson(this);
  }
}
