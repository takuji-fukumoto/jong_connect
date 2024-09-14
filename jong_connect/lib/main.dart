import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/provider/router.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:jong_connect/util/text_theme.dart';
import 'package:jong_connect/util/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kDebugMode) {
    final localUrl = !kIsWeb && Platform.isAndroid
        ? 'http://10.0.2.2:54321'
        : 'http://127.0.0.1:54321';
    await Supabase.initialize(
      url: localUrl,
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0',
    );
  } else {
    await Supabase.initialize(
      url: 'https://nauixhzrluaiydfkhlch.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5hdWl4aHpybHVhaXlkZmtobGNoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjMxNjQ5NjgsImV4cCI6MjAzODc0MDk2OH0.wwRP4lCjNrUkjjqD1E-GH2deW1Jv1JTHwVMV3-X9wFo',
    );
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme =
        MaterialTheme(createTextTheme(context, 'Noto Sans JP', 'Noto Sans JP'));
    return MaterialApp.router(
      theme: theme.light(),
      darkTheme: theme.dark(),
      routerConfig: ref.watch(routerProvider),
      scaffoldMessengerKey: SnackBarService.scaffoldKey,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja', ''), //日本語
      ],
    );
  }
}
