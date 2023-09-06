import 'package:bloc_pattern_2/bacik/303/loading_statefull.dart';
import 'package:bloc_pattern_2/bacik/303/reqres_resource/model/req_res_unknown_data.dart';
import 'package:bloc_pattern_2/bacik/303/reqres_resource/service/req_res_service.dart';
import 'package:bloc_pattern_2/bacik/product/service/project_dio.dart';
import 'package:flutter/material.dart';

import '../view/req_res_view.dart';

abstract class ReqResViewModel extends State<ReqResView>
    with ProjectDio, LoadingStatefull {
  late final IReqResService iReqResService;

  List<ReqResUnknownData> items = [];

  @override
  void initState() {
    super.initState();
    iReqResService = ReqResService(getDio());
    _fetch();
  }

  Future<void> _fetch() async {
    changeIsLoading();
    items = await iReqResService.fetchReqResUnknownData() ?? [];
    changeIsLoading();
  }
}
