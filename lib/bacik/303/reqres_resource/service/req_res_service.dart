import 'dart:convert';
import 'dart:io';

import 'package:bloc_pattern_2/bacik/303/reqres_resource/model/req_res_unknown_data.dart';
import 'package:dio/dio.dart';

abstract class IReqResService {
  final Dio dio;

  IReqResService(this.dio);

  Future<List<ReqResUnknownData>?> fetchReqResUnknownData();
}

enum _ReqResPath { unknown }

class ReqResService extends IReqResService {
  ReqResService(super.dio);

  @override
  Future<List<ReqResUnknownData>?> fetchReqResUnknownData() async {
    final response = await dio.get('/${_ReqResPath.unknown.name}');

    if (response.statusCode == HttpStatus.ok) {
      if (response.data is Map) {
        final data = jsonEncode(response.data['data']);
        final parsed = jsonDecode(data).cast<Map<String, dynamic>>();
        return parsed
            .map<ReqResUnknownData>((json) => ReqResUnknownData.fromJson(json))
            .toList(); //jsonBody.map((e) => ReqResUnknownData.fromJson(e)).toList();
      }
    }
    return null;
  }
}
