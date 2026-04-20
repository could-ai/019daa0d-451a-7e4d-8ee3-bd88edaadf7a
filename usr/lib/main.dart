import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/shell_screen.dart';

void main() {
  runApp(const MarketplaceAnalyticsApp());
}

class MarketplaceAnalyticsApp extends StatelessWidget {
  const MarketplaceAnalyticsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketplace Analytics',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const ShellScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}