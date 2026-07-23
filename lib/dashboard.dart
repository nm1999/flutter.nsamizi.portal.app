import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './Scan/DocumentScanScreen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final int currentYear = DateTime.now().year;

  final List<_DashboardItem> _items = const [
    _DashboardItem(
      title: 'Scan Document',
      subtitle: 'Capture and store files',
      icon: Icons.document_scanner,
      color: Color(0xFF6C63FF),
    ),
    _DashboardItem(
      title: 'View Results',
      subtitle: 'Check recent scans',
      icon: Icons.analytics,
      color: Color(0xFF00C2B3),
    ),
    _DashboardItem(
      title: 'Profile',
      subtitle: 'Account details',
      icon: Icons.person,
      color: Color(0xFFFF8A65),
    ),
    _DashboardItem(
      title: 'Settings',
      subtitle: 'Manage preferences',
      icon: Icons.settings,
      color: Color(0xFF42A5F5),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FF),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            _buildHeader(context),

            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => ScanDocument());
                    },
                    child: Card(
                      elevation: 4,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              width:100,
                            height:100,
                            child: Image(image: AssetImage('images/archive.jpg'))),
                            Text(
                              "Paper Backup",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Card(
                    elevation: 4,
                    color:Colors.white,
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width:100,
                            height:100,
                            child: Image(image: AssetImage('images/exam.jpg'))),
                          
                          Text("View results", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height:30),
            Center(
              child: Text(
                'Copyright © $currentYear NTISD. All rights reserved.',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [Icon(Icons.home_sharp, size: 30), Text("Home")]),
            Column(
              children: [
                Icon(Icons.manage_search_sharp, size: 30),
                Text("Search"),
              ],
            ),
            Column(
              children: [
                Icon(Icons.my_library_add_sharp, size: 30),
                Text("Library"),
              ],
            ),
            Column(
              children: [Icon(Icons.settings, size: 30), Text("Settings")],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF5B64FF), Color(0xFF7E9CFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Dashboard',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Welcome back! Manage your documents and results with ease.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.14),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.dashboard,
                    color: Color(0xFF5B64FF),
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DashboardItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _DashboardItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
}

class _DashboardCard extends StatelessWidget {
  final _DashboardItem item;

  const _DashboardCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 68) / 2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: item.color.withOpacity(0.18),
              shape: BoxShape.circle,
            ),
            child: Icon(item.icon, color: item.color, size: 24),
          ),
          const SizedBox(height: 16),
          Text(
            item.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: Text(
              item.subtitle,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
                height: 1.3,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Tap to continue →',
            style: TextStyle(
              fontSize: 11,
              color: item.color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderStat extends StatelessWidget {
  final String title;
  final String value;

  const _HeaderStat({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.14),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
