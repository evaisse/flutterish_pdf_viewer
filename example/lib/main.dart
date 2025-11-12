import 'package:flutter/material.dart';
import 'package:flutterish_pdf_viewer/flutterish_pdf_viewer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDF Viewer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PdfViewerDemo(),
    );
  }
}

class PdfViewerDemo extends StatefulWidget {
  const PdfViewerDemo({Key? key}) : super(key: key);

  @override
  State<PdfViewerDemo> createState() => _PdfViewerDemoState();
}

class _PdfViewerDemoState extends State<PdfViewerDemo> {
  final PdfController _controller = PdfController();
  final TextEditingController _urlController = TextEditingController(
    text:
        'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
  );

  @override
  void dispose() {
    _controller.dispose();
    _urlController.dispose();
    super.dispose();
  }

  void _loadPdf() {
    final url = _urlController.text.trim();
    if (url.isNotEmpty) {
      _controller.loadFromUrl(url);
    }
  }

  Future<void> _downloadPdf() async {
    final path = await _controller.downloadPdf('downloaded.pdf');
    if (path != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF downloaded to: $path')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutterish PDF Viewer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: _controller.document != null ? _downloadPdf : null,
            tooltip: 'Download PDF',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _urlController,
                    decoration: const InputDecoration(
                      labelText: 'PDF URL',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _loadPdf,
                  child: const Text('Load'),
                ),
              ],
            ),
          ),
          Expanded(
            child: PdfViewer(
              controller: _controller,
              showControls: true,
            ),
          ),
        ],
      ),
    );
  }
}
