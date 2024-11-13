abstract final class RoutingPath {
  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
  static const String profile = '/profile';

  static const String home = '/home';
  static const String inviteFriend = 'invite_friend';
  static const String friends = 'friends';

  static const String rooms = '/rooms';
  static const String createGroup = 'new_group';
  static const String groupDetails = 'groups/:groupId';
  static const String groupMembers = 'members';
  static const String editGroup = 'edit_group';
  static const String groupMatch = 'group_match/:groupMatchId';
  static const String inputGroupMatchScore = 'scores/new';
  static const String editGroupMatchScore = 'scores/:matchOrder/edit';

  static const String record = '/record';

  static const String settings = '/settings';
  static const String gameConfig = 'game_config';
  static const String editProfile = 'profile/edit';
}

abstract final class QueryParameters {
  static const String defaultFriendId = 'default_friend_id';
}
