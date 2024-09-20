import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

extension CacheForExtension on AutoDisposeRef<Object?> {
  /// [duration] の間 providerを維持する。
  void cacheFor(Duration duration) {
    // stateが破壊されるのを防ぐ。
    final link = keepAlive();
    // 期間経過後、自動破棄を再度有効にする。
    final timer = Timer(duration, link.close);

    // オプション：providerが再計算される場合（ref.watch など）、
    // 保留中のタイマーをキャンセルする.
    onDispose(timer.cancel);
  }
}
