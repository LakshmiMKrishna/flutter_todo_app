import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list/presentation/pages/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Only load .env file if not running on Web
  if (!kIsWeb) {
    await dotenv.load(fileName: ".env");
  }

  // Use environment values for mobile, constants for web
  const webSupabaseUrl = "https://tlfkbtefxxbbyaneobga.supabase.co";
  const webSupabaseAnonKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRsZmtidGVmeHhiYnlhbmVvYmdhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjE1ODUzOTMsImV4cCI6MjA3NzE2MTM5M30.F7tp0tt4Mmco-aQ7cK4n6XcSFi_MZ0DSA2I7_caVBuk";

  await Supabase.initialize(
    url: kIsWeb ? webSupabaseUrl : dotenv.env['SUPABASE_URL']!,
    anonKey: kIsWeb ? webSupabaseAnonKey : dotenv.env['SUPABASE_ANON_KEY']!,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const SplashPage(),
    );
  }
}
