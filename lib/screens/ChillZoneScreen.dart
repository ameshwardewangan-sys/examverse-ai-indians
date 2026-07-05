import 'package:flutter/material.dart';

class ChillZoneScreen extends StatefulWidget {
  const ChillZoneScreen({super.key});

  @override
  State<ChillZoneScreen> createState() => _ChillZoneScreenState();
}

class _ChillZoneScreenState extends State<ChillZoneScreen> {
  // Tabs ko control karne ke liye
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D12),
      appBar: AppBar(
        title: const Text('INFINITY CHILL 🍿', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Custom Top Tab Bar (Reels vs Live/Movies)
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A24),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedTab = 0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: _selectedTab == 0 ? const Color(0xFF6C63FF) : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(child: Text('Edu-Reels', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedTab = 1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: _selectedTab == 1 ? const Color(0xFF00FFC6) : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text('Live & Movies', 
                          style: TextStyle(color: _selectedTab == 1 ? Colors.black : Colors.white, fontWeight: FontWeight.bold)
                        )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Content Area (Tabs ke hisaab se change hoga)
          Expanded(
            child: _selectedTab == 0 ? _buildReelsSection() : _buildLiveMoviesSection(),
          ),
        ],
      ),
    );
  }

  // 1. TikTok Style Reels Section (Vertical PageView)
  Widget _buildReelsSection() {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A24),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white12),
          ),
          child: Stack(
            children: [
              // Dummy Video Placeholder
              const Center(child: Icon(Icons.play_circle_outline, size: 80, color: Colors.white30)),
              
              // Text and Info Overlay
              Positioned(
                bottom: 20, left: 20, right: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('UPSC Fact #${index + 1} 🔥', style: const TextStyle(color: Color(0xFF00FFC6), fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('Did you know about the secret clauses in the Indian Constitution? Watch till the end!', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              
              // Side Buttons (Like, Share, Quiz)
              Positioned(
                bottom: 20, right: 10,
                child: Column(
                  children: [
                    IconButton(icon: const Icon(Icons.favorite, color: Colors.white), onPressed: () {}),
                    const Text('12k', style: TextStyle(color: Colors.white, fontSize: 12)),
                    const SizedBox(height: 15),
                    IconButton(icon: const Icon(Icons.question_answer, color: Color(0xFF6C63FF)), onPressed: () {}),
                    const Text('Quiz', style: TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // 2. Live Matches & Movies Section
  Widget _buildLiveMoviesSection() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('🔴 LIVE NOW', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 10),
        Container(
          height: 200,
          decoration: BoxDecoration(color: const Color(0xFF1A1A24), borderRadius: BorderRadius.circular(16)),
          child: const Center(child: Text('🏏 IND vs AUS - Live Stream (Web-View)', style: TextStyle(color: Colors.white70))),
        ),
        const SizedBox(height: 30),
        const Text('Trending Movies / Series 🎬', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                width: 110,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(color: const Color(0xFF1A1A24), borderRadius: BorderRadius.circular(12)),
                child: const Center(child: Icon(Icons.movie, color: Colors.grey, size: 40)),
              );
            },
          ),
        )
      ],
    );
  }
}
