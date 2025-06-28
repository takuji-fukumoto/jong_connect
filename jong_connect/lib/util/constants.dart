import 'package:flutter/material.dart';
import 'package:hashids2/hashids2.dart';
import 'package:jong_connect/util/app_sizes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase client
final supabase = Supabase.instance.client;

/// ハッシュ化用のクライアント
final hashids = HashIds(
  salt: 'mahjong connects salt',
  minHashLength: 8,
  alphabet: 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ123456789',
);

/// Simple preloader inside a Center widget
const preloader =
    Center(child: CircularProgressIndicator(color: Colors.orange));

/// Some padding for all the forms to use
const formPadding = EdgeInsets.symmetric(vertical: 20, horizontal: 16);

/// Error message to display the user when unexpected error occurs.
const unexpectedErrorMessage = '不明なエラーが発生しました';

const unknownUserIcon = Icon(Icons.account_circle);
const unknownGroupIcon = Icon(Icons.groups);

abstract final class SnackBarService {
  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar({required String content, Widget? icon}) {
    scaffoldKey.currentState?.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            if (icon != null) ...[
              icon,
              gapW8,
            ],
            Text(content),
          ],
        ),
      ),
    );
  }

  static void showSuccessSnackBar({required String content}) {
    scaffoldKey.currentState?.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.greenAccent,
            ),
            gapW8,
            Text(content),
          ],
        ),
      ),
    );
  }

  static void showErrorSnackBar({required String content}) {
    scaffoldKey.currentState?.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.error,
              color: Colors.red,
            ),
            gapW8,
            Text(content),
          ],
        ),
      ),
    );
  }
}

enum FriendRequestStatus {
  pending,
  accepted,
  rejected,
}

enum MatchType {
  four('4麻', 4),
  three('3麻', 3),
  ;

  const MatchType(this.displayName, this.playableNumber);

  final String displayName;
  final int playableNumber;
}

enum GroupRankingCategory {
  totalPoints('総ポイント'),
  averageRank('平均順位'),
  totalGames('総対戦数');

  const GroupRankingCategory(this.displayName);

  final String displayName;
}

/// Set of extension methods to easily display a snackbar
extension ShowSnackBar on BuildContext {
  /// Displays a basic snackbar
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.white,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ));
  }

  /// Displays a red snackbar indicating error
  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message, backgroundColor: Colors.red);
  }
}
