// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'req_res_unknown_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReqResUnknownResourceModel _$ReqResUnknownResourceModelFromJson(
        Map<String, dynamic> json) =>
    ReqResUnknownResourceModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ReqResUnknownData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReqResUnknownResourceModelToJson(
        ReqResUnknownResourceModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ReqResUnknownData _$ReqResUnknownDataFromJson(Map<String, dynamic> json) =>
    ReqResUnknownData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      year: json['year'] as int?,
      color: json['color'] as String?,
      pantoneValue: json['pantoneValue'] as String?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ReqResUnknownDataToJson(ReqResUnknownData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'year': instance.year,
      'color': instance.color,
      'pantoneValue': instance.pantoneValue,
      'price': instance.price,
    };
