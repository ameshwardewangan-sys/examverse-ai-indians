import 'package:flutter/material.dart';

class SuperXScreen extends StatefulWidget {
  const SuperXScreen({super.key});

  @override
  State<SuperXScreen> createState() => _SuperXScreenState();
}

class _SuperXScreenState extends State<SuperXScreen> {
  final TextEditingController _pnrController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D12),
      appBar: AppBar(
        title: const Text('SUPER-X UTILITIES', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. AI Document Vault Section
            const Text('AI Document Vault 📂', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF00FFC6))),
            const SizedBox(height: 10),
            const Text('Upload Admit Cards, Syllabus, or Tickets. AI will organize them automatically.', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            
            // Upload Button
            InkWell(
              onTap: () {
                // Phone gallery open karne ka logic
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A24),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF6C63FF), width: 2, style: BorderStyle.solid),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.document_scanner_outlined, size: 50, color: Color(0xFF6C63FF)),
                    SizedBox(height: 10),
                    Text('Tap to Scan via AI', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 40),
            const Divider(color: Colors.white24),
            const SizedBox(height: 20),

            // 2. Live Transit Tracker Section
            const Text('Live Transit Tracker 🚆✈️', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF00FFC6))),
            const SizedBox(height: 10),
            const Text('Enter PNR to track your Train or Flight in real-time.', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),

            // PNR Input
            TextField(
              controller: _pnrController,
              style: const TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 2),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'ENTER 10-DIGIT PNR',
                hintStyle: const TextStyle(color: Colors.white30, letterSpacing: 1),
                filled: true,
                fillColor: const Color(0xFF1A1A24),
                prefixIcon: const Icon(Icons.confirmation_number, color: Color(0xFF6C63FF)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 20),

            // Track Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // Call Tracking API
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C63FF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('TRACK LIVE LOCATION', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
