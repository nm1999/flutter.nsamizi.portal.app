import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_doc_scanner/flutter_doc_scanner.dart';

class ScanDocument extends StatefulWidget {
  const ScanDocument({super.key});

  @override
  State<ScanDocument> createState() => _ScanDocumentState();
}

class _ScanDocumentState extends State<ScanDocument> {
  dynamic _scannedDocuments;
  bool _isScanning = false;
  bool _isSubmitting = false;
  String _statusMessage = 'No document scanned yet.';

  Future<void> scanDocumentAsPdf() async {
    dynamic scannedDocuments;
    setState(() {
      _isScanning = true;
      _statusMessage = 'Scanning document...';
    });

    try {
      scannedDocuments = await FlutterDocScanner().getScannedDocumentAsPdf(page: 4) ??
          'Unknown platform documents';
    } on PlatformException {
      scannedDocuments = 'Failed to get scanned documents.';
    }

    if (!mounted) return;
    setState(() {
      _scannedDocuments = scannedDocuments;
      _isScanning = false;
      _statusMessage = scannedDocuments is String
          ? scannedDocuments
          : 'Document captured successfully. Ready to send to backend.';
    });
  }

  Future<void> submitToBackend() async {
    if (_scannedDocuments == null || _scannedDocuments is! String) {
      setState(() {
        _statusMessage = 'Please scan a document before submission.';
      });
      return;
    }

    final filePath = _scannedDocuments as String;
    final file = File(filePath);
    if (!await file.exists()) {
      setState(() {
        _statusMessage = 'Document file was not found. Please scan again.';
      });
      return;
    }

    setState(() {
      _isSubmitting = true;
      _statusMessage = 'Uploading document to backend...';
    });

    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          filePath,
          filename: 'past_paper_${DateTime.now().millisecondsSinceEpoch}.pdf',
        ),
        'documentType': 'past_paper',
        'course': 'Computer Science',
        'semester': 'Semester 2',
        'uploadedBy': 'student_portal',
      });

      final dio = Dio();
      final response = await dio.post(
        'https://example.com/api/past-papers/upload',
        data: formData,
        options: Options(
          headers: {'Accept': 'application/json'},
          validateStatus: (status) => status != null && status < 500,
        ),
        onSendProgress: (sent, total) {
          if (total > 0) {
            final progress = (sent / total * 100).round();
            if (mounted) {
              setState(() {
                _statusMessage = 'Uploading... $progress%';
              });
            }
          }
        },
      );

      if (!mounted) return;
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        setState(() {
          _statusMessage = 'Document uploaded successfully to the backend.';
          _isSubmitting = false;
        });
      } else {
        setState(() {
          _statusMessage = 'Upload failed. Backend responded with ${response.statusCode}.';
          _isSubmitting = false;
        });
      }
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _statusMessage = 'Connection error: $error. Please verify the backend URL.';
        _isSubmitting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FF),
      appBar: AppBar(
        title: const Text('Document scanner'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.document_scanner_rounded,
                      size: 58,
                      color: Color(0xFF1E3A8A),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Scan and archive paper',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _statusMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              if (_scannedDocuments != null)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDBEAFE),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle_rounded, color: Color(0xFF1E3A8A)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _scannedDocuments.toString(),
                          style: const TextStyle(
                            color: Color(0xFF1E3A8A),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _isScanning ? null : scanDocumentAsPdf,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E3A8A),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  icon: const Icon(Icons.camera_alt_rounded),
                  label: Text(_isScanning ? 'Scanning...' : 'Scan document'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: _isSubmitting || _scannedDocuments == null ? null : submitToBackend,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF0F172A),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: const BorderSide(color: Color(0xFF1E3A8A)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  icon: const Icon(Icons.cloud_upload_rounded),
                  label: Text(_isSubmitting ? 'Uploading...' : 'Send to backend'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
