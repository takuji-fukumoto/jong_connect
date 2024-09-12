import 'app_user.dart';

class GroupMatchResultRaw {
  const GroupMatchResultRaw({
    required this.user,
    required this.score,
    required this.rank,
    required this.totalPoints,
  });

  final AppUser user;
  final int score;
  final int rank;
  final int totalPoints;
}
