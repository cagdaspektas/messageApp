import 'dart:io';

import 'package:dio/dio.dart';
import 'package:message_app/core/constants/app_constant.dart';
import 'package:message_app/features/model/post_model.dart';
import 'package:mobx/mobx.dart';
part 'post_view_model.g.dart';

class PostViewModel = _PostViewModelBase with _$PostViewModel;

abstract class _PostViewModelBase with Store {
  @observable
  List<Post> posts = [];
  final url = ApplicationConstant.instance.baseUrl.toString();
  @observable
  bool isServiceRequestLoading = false;

  @action
  Future<void> fetchData() async {
    dataChanged();
    final response = await Dio().get(url);
    if (response.statusCode == HttpStatus.ok) {
      final responseData = response.data as List;
      posts = responseData.map((e) => Post.fromMap(e)).toList();
    }
    dataChanged();
  }

  @action
  dataChanged() {
    isServiceRequestLoading = !isServiceRequestLoading;
  }
}
