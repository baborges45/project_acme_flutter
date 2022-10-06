import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'list_verbos.dart';

class HomeRepository {
  Future<ListVerbos> getVerbosList() async {
    final String response =
        await rootBundle.loadString('assets/json_files/list_verbos.json');

    final data = await json.decode(response);

    var stateModel = ListVerbos.fromJson(data);

    return stateModel;
  }

  late List data;
  late List imagesUrl = imagesUrl
      .map((image) => NetworkImage('www.imagelink.com/${image.file}'))
      .toList();
}
