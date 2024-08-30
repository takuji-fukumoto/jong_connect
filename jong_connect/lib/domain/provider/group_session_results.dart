import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/group.dart';

part 'group_session_results.g.dart';

@riverpod
Future<List<Group>> groupSessionResults(GroupSessionResultsRef ref,
    {required int groupId, required int pageNum, int itemsPerPage = 30}) async {
  // TODO: ページネーションして取ってくる
  // TODO: 戦績が追加されたらリロードする
  throw UnimplementedError();
}
