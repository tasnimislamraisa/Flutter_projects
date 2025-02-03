import 'dart:typed_data';
import 'package:tflite_flutter/tflite_flutter.dart';

class DigitClassifier {
  late Interpreter interpreter;

  // Load TFLite model
  Future<void> loadModel() async {
    try {
      interpreter = await Interpreter.fromAsset('assets/digit_classifier.tflite');
      print("✅ Model Loaded Successfully!");
    } catch (e) {
      print("❌ Error loading model: $e");
    }
  }

  // Function to classify a preprocessed image
  Future<int> classifyDigit(Uint8List imageInput) async {
    if (interpreter == null) {
      print("❌ Error: Model not loaded!");
      return -1;
    }

    // Normalize image (Convert Uint8List to List<double>)
    List<List<double>> input = [imageInput.map((e) => e.toDouble() / 255.0).toList()];

    // Define output buffer
    var output = List.generate(1, (_) => List.filled(10, 0.0));  // 1x10 tensor

    // Run inference
    interpreter.run(input, output);

    // Get the predicted digit (index with highest probability)
    return output[0].indexOf(output[0].reduce((a, b) => a > b ? a : b));
  }
}
