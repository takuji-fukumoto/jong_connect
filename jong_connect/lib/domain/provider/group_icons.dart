import 'dart:async';

import 'package:jong_connect/data/group_icons_repository.dart';
import 'package:jong_connect/domain/model/group_icon.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_icons.g.dart';

@Riverpod(keepAlive: true)
Future<List<GroupIcon>> groupIcons(GroupIconsRef ref) async {
  return await ref.read(groupIconsRepositoryProvider).get();
}
