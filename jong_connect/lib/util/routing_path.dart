abstract final class RoutingPath {
  static const String home = '/home';
  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
  static const String editProfile = '/edit_profile';
  static const String rooms = '/rooms';
  static const String record = '/record';
  static const String settings = '/settings';
  static const String inviteFriend = 'invite_friend';
  static const String createGroup = 'new_group';
  static const String groupDetails = 'groups/:groupId';
  static const String editGroup = 'edit_group';
  static const String groupMatch = 'group_match/:groupMatchId';
  static const String inputGroupMatchScore =
      'scores/new'; // TODO: クエリパラメータでmatchOrderつける
  static const String editGroupMatchScore = 'scores/:matchOrder/edit';
}
