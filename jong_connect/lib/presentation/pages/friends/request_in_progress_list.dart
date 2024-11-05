import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/provider/friend_requests_in_progress.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/usecase/friend_use_case.dart';
import 'package:jong_connect/util/app_sizes.dart';

import '../../../util/constants.dart';

class RequestInProgressList extends ConsumerWidget {
  const RequestInProgressList({super.key});

  Future<void> cancelToSendRequest(
      BuildContext context, WidgetRef ref, int friendRequestId) async {
    final result = await showOkCancelAlertDialog(
        context: context, message: 'フレンド申請をキャンセルしますか？');

    if (result.name != 'ok') {
      return;
    }

    await ref.read(friendUseCaseProvider).deleteFriendRequest(friendRequestId);
    ref.invalidate(friendRequestsInProgressProvider);

    SnackBarService.showSnackBar(content: '申請をキャンセルしました');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      asyncValue: ref.watch(friendRequestsInProgressProvider),
      data: (requests) {
        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(friendRequestsInProgressProvider);
          },
          child: ListView(
            padding: paddingV8H8,
            children: [
              if (requests.isEmpty) ...[
                gapH16,
                const Center(
                  child: Text('申請中のユーザーはいません'),
                ),
              ],
              for (var request in requests)
                ListTile(
                  leading: SizedBox(
                    width: 40,
                    height: 40,
                    child: CachedNetworkImage(
                      imageUrl: request.targetUser!.avatarUrl,
                      imageBuilder: (context, imageProvider) => CircleAvatar(
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
                      errorWidget: (context, url, error) => unknownUserIcon,
                    ),
                  ),
                  title: Text(request.targetUser!.name),
                  subtitle: Text(request.targetUser!.profile),
                  trailing: TextButton(
                    onPressed: () =>
                        cancelToSendRequest(context, ref, request.id),
                    child: const Text('キャンセル'),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
