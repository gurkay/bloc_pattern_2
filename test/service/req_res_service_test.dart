import 'dart:convert';

import 'package:bloc_pattern_2/bacik/303/reqres_resource/model/req_res_unknown_data.dart';
import 'package:bloc_pattern_2/bacik/303/reqres_resource/service/req_res_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final Dio dio;
  late ReqResService reqResService;

  setUp(() {
    reqResService =
        ReqResService(Dio(BaseOptions(baseUrl: 'https://reqres.in/api')));
  });

  test('ReqResService : ', () async {
    JsonCodec codec = JsonCodec();
    final response = await Dio(
      BaseOptions(
        baseUrl: 'https://reqres.in/api',
        responseType: ResponseType.json,
      ),
    ).get('/unknown');
    print('response: $response');
    final total = response.data['total'];
    print('total: $total');
    final String data = response.data['data'].toString();
    final data1 = jsonEncode(response.data['data']);
    print('data1 : $data1');
    // final decodeData = codec.decode(data);
    print('data: decodeData');
    // final jsonBody = response.data['data'];
    final parsed = jsonDecode(data1).cast<Map<String, dynamic>>();
    if (kDebugMode) {
      print('parsed: $parsed');
    }
    List<ReqResUnknownData> listReqResUnknownData = parsed
        .map<ReqResUnknownData>((json) => ReqResUnknownData.fromJson(json))
        .toList();
    for (var element in listReqResUnknownData) {
      print(element.name);
    }
  });
}
