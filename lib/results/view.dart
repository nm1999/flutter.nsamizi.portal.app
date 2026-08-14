import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ResultsView extends StatefulWidget {
  const ResultsView({super.key});

  @override
  State<ResultsView> createState() => _ResultsViewState();
}

class _ResultsViewState extends State<ResultsView> {
  bool _isLoading = true;
  final List<String> _worksheetNames = const [
    'Sheet1',
    'Sheet2',
    'Sheet3',
    'Sheet4',
  ];

  @override
  void initState() {
    super.initState();
    _loadWorksheetPreview();
  }

  Future<void> _loadWorksheetPreview() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 350));
    if (!mounted) return;
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FF),
      appBar: AppBar(
        title: const Text('Academic results'),
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
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Published results by worksheet',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Icon(Icons.folder_copy_rounded, color: Colors.white),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ..._worksheetNames.map(
                      (sheetName) => _WorksheetTile(
                        sheetName: sheetName,
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => WorksheetResultsDetailView(
                              sheetName: sheetName,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _WorksheetTile extends StatelessWidget {
  final String sheetName;
  final VoidCallback onTap;

  const _WorksheetTile({
    required this.sheetName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDBEAFE),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.table_view_rounded,
                    color: Color(0xFF1E3A8A),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sheetName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF111827),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Open individual results',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WorksheetResultsDetailView extends StatefulWidget {
  final String sheetName;

  const WorksheetResultsDetailView({
    super.key,
    required this.sheetName,
  });

  @override
  State<WorksheetResultsDetailView> createState() => _WorksheetResultsDetailViewState();
}

class _WorksheetResultsDetailViewState extends State<WorksheetResultsDetailView> {
  final Dio _dio = Dio();
  bool _isLoading = true;
  List<Map<String, dynamic>> _rows = [];
  List<String> _columns = [];

  @override
  void initState() {
    super.initState();
    _loadSheet();
  }

  Future<void> _loadSheet() async {
    try {
      const sheetId = '1_kMhYL_H_xVGIYDLPLjKJJ_DlX2iFVvaB7Czn7JkVU8';
      final response = await _dio.get(
        'https://docs.google.com/spreadsheets/d/$sheetId/gviz/tq?sheet=${widget.sheetName}&tqx=out:json',
      );

      final raw = response.data.toString();
      final startIndex = raw.indexOf('{');
      final endIndex = raw.lastIndexOf('}');
      if (startIndex == -1 || endIndex == -1 || endIndex <= startIndex) {
        throw const FormatException('Invalid Google Sheets response');
      }

      final jsonData = jsonDecode(raw.substring(startIndex, endIndex + 1));
      final table = jsonData['table'] as Map<String, dynamic>? ?? {};
      final cols = (table['cols'] as List<dynamic>? ?? const [])
          .map((column) => (column['label'] ?? column['id'] ?? 'Column').toString())
          .toList();
      final rows = (table['rows'] as List<dynamic>? ?? const []);
      final parsedRows = rows.map((row) {
        final values = (row['c'] as List<dynamic>? ?? const []);
        final mapped = <String, dynamic>{};
        for (int i = 0; i < cols.length; i++) {
          final value = i < values.length ? values[i] : {'v': ''};
          final cell = value is Map ? value : {'v': value};
          mapped[cols[i]] = cell['v'] ?? '';
        }
        return mapped;
      }).toList();

      if (!mounted) return;
      setState(() {
        _columns = cols;
        _rows = parsedRows;
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _columns = const ['Status'];
        _rows = [
          {'Status': 'This worksheet could not be loaded. Please verify the spreadsheet link and sheet name.'},
        ];
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.sheetName;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FF),
      appBar: AppBar(
        title: Text(title),
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
                        children: [
                          Expanded(
                            child: Text(
                              '$title results',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const Icon(Icons.bar_chart_rounded, color: Colors.white),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    if (_columns.isEmpty || _rows.isEmpty)
                      Container(
                        padding: const EdgeInsets.all(22),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Text(
                          'No results available for this worksheet yet.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF374151),
                          ),
                        ),
                      )
                    else
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: _columns
                                .map(
                                  (column) => DataColumn(
                                    label: Text(
                                      column,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            rows: _rows
                                .map(
                                  (row) => DataRow(
                                    cells: _columns
                                        .map(
                                          (column) => DataCell(
                                            Text(
                                              row[column]?.toString() ?? '-',
                                              style: const TextStyle(
                                                color: Color(0xFF111827),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}

