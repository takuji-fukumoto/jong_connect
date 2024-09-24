import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jong_connect/presentation/common_widgets/user_profile_dialog.dart';

import '../../domain/model/app_user.dart';
import '../../util/constants.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({super.key, required this.user, required this.isFriend});

  final AppUser user;
  final bool isFriend;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 40,
        height: 40,
        child: CachedNetworkImage(
          imageUrl: user.avatarUrl,
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
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => unknownUserIcon,
        ),
      ),
      title: Text(user.name),
      subtitle: Text(user.profile),
      onTap: () async {
        await showDialog(
          context: context,
          builder: (context) => UserProfileDialog(
            user: user,
            isFriend: isFriend,
          ),
        );
      },
    );
  }
}
