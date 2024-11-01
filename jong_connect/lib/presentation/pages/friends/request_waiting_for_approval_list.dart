import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/provider/friend_requests_waiting_for_approval.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/usecase/friend_use_case.dart';
import 'package:jong_connect/util/app_sizes.dart';

import '../../../util/constants.dart';

class RequestWaitingForApprovalList extends ConsumerWidget {
  const RequestWaitingForApprovalList({super.key});

  Future<void> acceptRequest(
      WidgetRef ref, int friendRequestId, String name) async {
    await ref.read(friendUseCaseProvider).acceptFriendRequest(friendRequestId);

    SnackBarService.showSnackBar(content: '$nameさんとフレンドになりました');
  }

  Future<void> rejectRequest(
      WidgetRef ref, int friendRequestId, String name) async {
    await ref.read(friendUseCaseProvider).rejectFriendRequest(friendRequestId);

    SnackBarService.showSnackBar(content: '$nameさんのフレンド申請を却下しました');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(friendRequestsWaitingForApprovalProvider);
      },
      child: AsyncValueWidget(
        asyncValue: ref.watch(friendRequestsWaitingForApprovalProvider),
        data: (requests) {
          if (requests.isEmpty) {
            return const Center(
              child: Text('承認待ちのユーザーはいません'),
            );
          }

          return ListView(
            padding: paddingV8H8,
            children: [
              for (var request in requests)
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: SizedBox(
                          width: 40,
                          height: 40,
                          child: CachedNetworkImage(
                            imageUrl: request.targetUser!.avatarUrl,
                            imageBuilder: (context, imageProvider) =>
                                CircleAvatar(
                              radius: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                unknownUserIcon,
                          ),
                        ),
                        title: Text(request.targetUser!.name),
                        subtitle: Text(request.targetUser!.profile),
                      ),
                    ),
                    TextButton(
                      onPressed: () => acceptRequest(
                          ref, request.id, request.targetUser!.name),
                      child: const Text('承認'),
                    ),
                    TextButton(
                      onPressed: () => rejectRequest(
                          ref, request.id, request.targetUser!.name),
                      child: Text(
                        '拒否',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error),
                      ),
                    ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
