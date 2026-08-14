import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ResultsView extends StatefulWidget {
  const ResultsView({super.key});

  @override
  State<ResultsView> createState() => _ResultsViewState();
}

class _ResultsViewState extends State<ResultsView> {
  String _data = 'Loading recent academic records...';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadResults();
  }

  Future<void> _loadResults() async {
    try {
      const sheetId = '1_kMhYL_H_xVGIYDLPLjKJJ_DlX2iFVvaB7Czn7JkVU8';
      const sheetName = 'Sheet1';
      final response = await Dio().get(
        'https://docs.google.com/spreadsheets/d/$sheetId/gviz/tq?sheet=$sheetName&tqx=out:json',
      );

      if (!mounted) return;
      setState(() {
        _data = response.data.toString();
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _data = 'Academic results are temporarily unavailable. Please try again later.';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FF),
      appBar: AppBar(
        title: const Text('Academic results'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.filter_list_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF0F172A), Color(0xFF1E3A8A)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              'Semester performance',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Icon(Icons.trending_up_rounded, color: Colors.white),
                        ],
                      ),
                    ),
                    const SizedBox(height: 22),
                    _ResultCard(
                      subject: 'Database Systems',
                      score: '88%',
                      status: 'Distinction',
                      grade: 'A',
                    ),
                    _ResultCard(
                      subject: 'Discrete Maths',
                      score: '81%',
                      status: 'Strong pass',
                      grade: 'A-',
                    ),
                    _ResultCard(
                      subject: 'Research Methods',
                      score: '76%',
                      status: 'Good pass',
                      grade: 'B+',
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _data,
                      style: const TextStyle(fontSize: 12, color: Color(0xFF374151)),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  final String subject;
  final String score;
  final String status;
  final String grade;

  const _ResultCard({
    required this.subject,
    required this.score,
    required this.status,
    required this.grade,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFDBEAFE),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                grade,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E3A8A),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  status,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            score,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E3A8A),
            ),
          ),
        ],
      ),
    );
  }
}

