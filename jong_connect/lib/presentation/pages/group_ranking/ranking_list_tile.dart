import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jong_connect/presentation/common_widgets/user_profile_dialog.dart';
import 'package:jong_connect/util/app_sizes.dart';

import '../../../domain/model/app_user.dart';

class RankingListTile extends StatelessWidget {
  const RankingListTile(
      {super.key, required this.user, required this.rank, required this.score});

  final AppUser? user;
  final int rank;
  final String score;
  static const Map<int, Color> rankColors = {
    1: Color(0xFFFFD700), // 金
    2: Color(0xFFC0C0C0), // 銀
    3: Color(0xFFCD7F32), // 銅
  };

  @override
  Widget build(BuildContext context) {
    // グループにユーザーが存在しない場合はランキングに表示しない
    if (user == null) {
      return const SizedBox();
    }

    return ListTile(
      tileColor: Theme.of(context).colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Row(
        children: [
          if (rank <= 3)
            Expanded(
              flex: 1,
              child: Icon(
                Icons.emoji_events,
                size: Sizes.p24,
                color: rankColors[rank],
              ),
            )
          else
            const Expanded(flex: 1, child: SizedBox()),
          gapW8,
          Expanded(
            flex: 1,
            child: Text(
              rank.toString(),
              style: TextStyle(
                fontSize: Sizes.p20,
                fontWeight: rank <= 3 ? FontWeight.bold : FontWeight.w300,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: CachedNetworkImage(
              width: Sizes.p48,
              height: Sizes.p48,
              imageUrl: rank == 1 ? user!.goodFaceAvatarUrl : user!.avatarUrl,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 40,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          gapW16,
          Expanded(
            flex: 5,
            child: Text(user!.name),
          ),
        ],
      ),
      trailing: Text(
        score,
        style: TextStyle(
          fontSize: Sizes.p16,
          fontWeight: rank <= 3 ? FontWeight.bold : FontWeight.w200,
        ),
      ),
      onTap: () async {
        await showDialog(
          context: context,
          builder: (context) => UserProfileDialog(
            user: user!,
          ),
        );
      },
    );
  }
}
