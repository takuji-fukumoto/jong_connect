import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/provider/game_record.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../domain/provider/user_session.dart';
import '../../../util/constants.dart';

class RecordPage extends ConsumerWidget {
  const RecordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(userSessionProvider);
    if (session == null) {
      return Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: Colors.grey,
          size: 50,
        ),
      );
    }

    final userId = session.user.id;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.surface,
          title: const Text('戦績'),
        ),
        body: AsyncValueWidget(
            asyncValue: ref.watch(gameRecordProvider(
                userId: userId, matchTypeName: MatchType.four.name)),
            data: (record) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(record.totalGames.toString()),
                  Text(record.averageRank.toString()),
                  Text(record.totalPoints.toString()),
                  Text(record.averagePoints.toString()),
                  Text(record.topTwoRate.toString()),
                ],
              );
            }));
  }
}
