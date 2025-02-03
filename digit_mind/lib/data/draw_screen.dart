import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'digital_classifier.dart';

class DrawScreen extends StatefulWidget {
  @override
  _DrawScreenState createState() => _DrawScreenState();
}

class _DrawScreenState extends State<DrawScreen> {
  List<Offset?> points = [];  // Stores user-drawn strokes
  late DigitClassifier digitClassifier;
  int? predictedDigit;

  @override
  void initState() {
    super.initState();
    digitClassifier = DigitClassifier();
    digitClassifier.loadModel();
  }

  Future<void> recognizeDigit() async {
    if (points.isEmpty) return;

    // Convert drawing to an image
    Uint8List imageBytes = await convertToImage();

    // Classify the digit
    int digit = await digitClassifier.classifyDigit(imageBytes);

    setState(() {
      predictedDigit = digit;
    });
  }

  Future<Uint8List> convertToImage() async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder, Rect.fromPoints(Offset(0, 0), Offset(280, 280)));

    DigitPainter painter = DigitPainter(points);
    painter.paint(canvas, Size(280, 280));

    final picture = recorder.endRecording();
    final imgByteData = await picture.toImage(28, 28).then((img) => img.toByteData(format: ui.ImageByteFormat.rawRgba));

    return imgByteData!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Digit Recognizer")),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  points.add(details.localPosition);
                });
              },
              onPanEnd: (_) => points.add(null),
              child: CustomPaint(painter: DigitPainter(points), size: Size.infinite),
            ),
          ),
          Text(predictedDigit == null ? "Draw a Digit" : "Predicted: $predictedDigit"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: recognizeDigit, child: Text("Recognize")),
              ElevatedButton(onPressed: () => setState(() => points.clear()), child: Text("Clear")),
            ],
          ),
        ],
      ),
    );
  }
}

class DigitPainter extends CustomPainter {
  List<Offset?> points;
  DigitPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white..strokeCap = StrokeCap.round..strokeWidth = 10.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) canvas.drawLine(points[i]!, points[i + 1]!, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
