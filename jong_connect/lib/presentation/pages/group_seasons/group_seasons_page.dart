import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/domain/model/season.dart';
import 'package:jong_connect/domain/provider/group_seasons.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/util/app_sizes.dart';
import 'package:jong_connect/util/routing_path.dart';

class GroupSeasonsPage extends ConsumerWidget {
  const GroupSeasonsPage({super.key, required this.groupId});

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('シーズン一覧'),
      ),
      body: AsyncValueWidget(
        asyncValue: ref.watch(groupSeasonsProvider(groupId: groupId)),
        data: (seasons) {
          return Padding(
            padding: paddingV8H8,
            child: ListView(
              children: [
                for (var season in seasons)
                  SeasonListTile(
                    groupId: groupId,
                    season: season,
                  ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        onPressed: () => context.goNamed(
          RoutingPath.createSeason,
          pathParameters: {
            'groupId': groupId.toString(),
          },
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SeasonListTile extends StatelessWidget {
  const SeasonListTile(
      {super.key, required this.groupId, required this.season});

  final int groupId;
  final Season season;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(season.name),
      subtitle: Text(season.description),
      onTap: () async {
        context.goNamed(
          RoutingPath.editSeason,
          pathParameters: {
            'groupId': groupId.toString(),
            'seasonId': season.id.toString(),
          },
        );
      },
    );
  }
}
