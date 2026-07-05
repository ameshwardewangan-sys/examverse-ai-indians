import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D12),
      appBar: AppBar(
        title: const Text('⚡ GOD MODE (Admin)', style: TextStyle(fontWeight: FontWeight.w900, color: Color(0xFF00FFC6), letterSpacing: 2)),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Live Stats Grid
            const Text('LIVE SERVER STATS', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.5,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildStatCard('Active Users', '14,205', Icons.people_alt, const Color(0xFF6C63FF)),
                _buildStatCard('AI Queries/min', '842', Icons.auto_awesome, const Color(0xFF00FFC6)),
                _buildStatCard('Live Matches', '2', Icons.stream, Colors.redAccent),
                _buildStatCard('Revenue Today', '₹45k', Icons.account_balance_wallet, Colors.greenAccent),
              ],
            ),
            
            const SizedBox(height: 30),
            
            // 2. India Live Heatmap (Placeholder for Maps API)
            const Text('LIVE USER HEATMAP 🇮🇳', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A24),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF6C63FF).withOpacity(0.5)),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map, size: 60, color: Colors.white24),
                  SizedBox(height: 10),
                  Text('UP: 4k | MP: 2.5k | Bihar: 3.2k', style: TextStyle(color: Color(0xFF00FFC6), fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 3. Quick Actions
            const Text('COMMAND CENTER', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            _buildActionTile('Broadcast Urgent Notification', Icons.campaign, Colors.orangeAccent),
            const SizedBox(height: 10),
            _buildActionTile('Update Exam Syllabus via AI', Icons.update, const Color(0xFF6C63FF)),
            const SizedBox(height: 10),
            _buildActionTile('Ban Suspicious User', Icons.block, Colors.redAccent),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A24),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: color, size: 24),
              Text(value, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildActionTile(String title, IconData icon, Color color) {
    return ListTile(
      tileColor: const Color(0xFF1A1A24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      leading: Icon(icon, color: color),
      title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white30, size: 16),
      onTap: () {
        // Action Trigger
      },
    );
  }
}
