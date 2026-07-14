import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/subject_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/navigation_provider.dart';
import 'themes/app_themes.dart';
import 'screens/add_subject_screen.dart';
import 'screens/subject_list_screen.dart';
import 'screens/summary_screen.dart';

void main() {
  runApp(const GradeTrackerApp());
}

class GradeTrackerApp extends StatelessWidget {
  const GradeTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SubjectProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'Student Grade Tracker',
            debugShowCheckedModeBanner: false,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: themeProvider.themeMode,
            home: const HomeShell(),
          );
        },
      ),
    );
  }
}

/// Hosts the shared AppBar (with the theme toggle) and the
/// BottomNavigationBar that switches between the 3 screens.
/// The selected tab is stored in [NavigationProvider], not setState.
class HomeShell extends StatelessWidget {
  const HomeShell({super.key});

  static const _titles = ['Add Subject', 'Subject List', 'Summary'];
  static const _screens = [
    AddSubjectScreen(),
    SubjectListScreen(),
    SummaryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final nav = context.watch<NavigationProvider>();
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[nav.currentIndex]),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDark ? Icons.dark_mode : Icons.light_mode,
            ),
            tooltip: 'Toggle light/dark theme',
            onPressed: () => context.read<ThemeProvider>().toggleTheme(),
          ),
        ],
      ),
      body: IndexedStack(
        index: nav.currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: nav.currentIndex,
        onTap: (index) => context.read<NavigationProvider>().setIndex(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.summarize_outlined),
            label: 'Summary',
          ),
        ],
      ),
    );
  }
}
