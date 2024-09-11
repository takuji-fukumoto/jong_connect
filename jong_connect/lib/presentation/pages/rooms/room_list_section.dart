import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/domain/provider/joined_groups.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/util/routing_path.dart';

import '../../../util/constants.dart';

class RoomListSection extends ConsumerWidget {
  const RoomListSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      asyncValue: ref.watch(joinedGroupsProvider),
      data: (groups) {
        if (groups.isEmpty) {
          return const Center(child: Text('早速ルームを作ってみましょう！'));
        }
        return ListView(
          children: [
            for (final group in groups)
              ListTile(
                // leading: SizedBox(
                //   width: 40,
                //   height: 40,
                //   child: CachedNetworkImage(
                //     imageUrl: group.imageUrl,
                //     imageBuilder: (context, imageProvider) => CircleAvatar(
                //       radius: 40,
                //       child: Container(
                //         decoration: BoxDecoration(
                //           image: DecorationImage(
                //             image: imageProvider,
                //             fit: BoxFit.cover,
                //           ),
                //         ),
                //       ),
                //     ),
                //     placeholder: (context, url) =>
                //         const CircularProgressIndicator(),
                //     errorWidget: (context, url, error) => unknownGroupIcon,
                //   ),
                // ),
                title: Text(group.name),
                subtitle: Text(group.description),
                onTap: () => context.goNamed(
                  RoutingPath.groupDetails,
                  pathParameters: <String, String>{
                    'groupId': group.id.toString(),
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
