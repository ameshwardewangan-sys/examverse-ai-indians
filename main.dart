import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Aapki banayi hui saari screens yahan import ho rahi hain
import 'screens/SecureLoginScreen.dart';
import 'screens/AdminDashboardScreen.dart';
import 'screens/GenAIQuizScreen.dart';
import 'screens/ChillZoneScreen.dart';

void main() {
  // UI ko smooth aur status bar ko transparent karne ke liye
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(const ExamVerseSuperApp());
}

class ExamVerseSuperApp extends StatelessWidget {
  const ExamVerseSuperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExamVerse AI v3.0',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D0D12), // Deep Cyber Dark
        primaryColor: const Color(0xFF6C63FF), // Neon Purple AI Theme
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6C63FF),
          secondary: Color(0xFF00FFC6), // Mint Green for progress
        ),
        fontFamily: 'Roboto', // Modern readable font
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0D0D12),
          elevation: 0,
          centerTitle: true,
        ),
      ),
      // APP SABSE PEHLE LOGIN SCREEN PAR JAYEGA 👇
      home: const SecureLoginScreen(),
    );
  }
}

class DashboardShell extends StatefulWidget {
  const DashboardShell({super.key});

  @override
  State<DashboardShell> createState() => _DashboardShellState();
}

class _DashboardShellState extends State<DashboardShell> {
  int _selectedIndex = 0;

  // Final List: Yahan saari screens properly link ho gayi hain!
  final List<Widget> _modules = [
    const Center(child: Text('🧠 AI Anticipatory Home\n(Daily GK, Revisions & Voice Mode)', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.white70))),
    const GenAIQuizScreen(), // 2nd Button (Prep Zone)
    const Center(child: Text('🎫 Super-X Utilities\n(Train/Flight Tracking & Doc AI)', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.white70))),
    const ChillZoneScreen(), // 4th Button (Chill Zone)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EXAMVERSE AI', 
          style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.w900, color: Colors.white)
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shield_moon_outlined, color: Color(0xFF00FFC6)),
            tooltip: 'God Mode (Admin)',
            onPressed: () {
              // God Mode open karne ka code 👇
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AdminDashboardScreen()),
              );
            },
          )
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _modules[_selectedIndex], // Smooth transition between screens
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 10, spreadRadius: 2)
          ]
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          backgroundColor: const Color(0xFF1A1A24),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF00FFC6),
          unselectedItemColor: Colors.white54,
          selectedFontSize: 12,
          unselectedFontSize: 11,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.auto_awesome), label: 'AI Home'),
            BottomNavigationBarItem(icon: Icon(Icons.school_rounded), label: 'Prep Zone'),
            BottomNavigationBarItem(icon: Icon(Icons.confirmation_number_outlined), label: 'Super-X'),
            BottomNavigationBarItem(icon: Icon(Icons.play_circle_filled_rounded), label: 'Chill'), // Typo fix kar diya
          ],
        ),
      ),
    );
  }
}
