import 'package:flutter/material.dart';

class GenAIQuizScreen extends StatefulWidget {
  const GenAIQuizScreen({super.key});

  @override
  State<GenAIQuizScreen> createState() => _GenAIQuizScreenState();
}

class _GenAIQuizScreenState extends State<GenAIQuizScreen> {
  final TextEditingController _topicController = TextEditingController();
  String _selectedTheme = 'Harry Potter';
  bool _isLoading = false;

  final List<String> _universes = ['Harry Potter', 'Marvel Universe', 'Space Exploration', 'Cyberpunk 2077', 'Indian Mythology'];

  void _generateQuiz() {
    setState(() => _isLoading = true);
    // Yahan Backend API call hogi
    Future.delayed(const Duration(seconds: 3), () {
      setState(() => _isLoading = false);
      // Navigate to Quiz Playing Screen
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Welcome to $_selectedTheme Universe! 🚀'), backgroundColor: const Color(0xFF6C63FF)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D12),
      appBar: AppBar(title: const Text('Create Custom Universe', style: TextStyle(color: Color(0xFF00FFC6)))),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('What do you want to study today?', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 20),
            
            // Topic Input
            TextField(
              controller: _topicController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'e.g., Fundamental Rights, Newton\'s Laws',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF1A1A24),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 30),
            
            const Text('Choose Your Universe (Theme)', style: TextStyle(fontSize: 18, color: Colors.white70)),
            const SizedBox(height: 10),
            
            // Theme Selector Dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(color: const Color(0xFF1A1A24), borderRadius: BorderRadius.circular(12)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedTheme,
                  isExpanded: true,
                  dropdownColor: const Color(0xFF1A1A24),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF00FFC6)),
                  items: _universes.map((String theme) {
                    return DropdownMenuItem<String>(value: theme, child: Text(theme));
                  }).toList(),
                  onChanged: (newValue) => setState(() => _selectedTheme = newValue!),
                ),
              ),
            ),
            const Spacer(),
            
            // Generate Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _generateQuiz,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C63FF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: _isLoading 
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('GENERATE MAGIC QUIZ ✨', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
