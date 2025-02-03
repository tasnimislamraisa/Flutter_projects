import 'dart:typed_data';
import 'package:image/image.dart' as img;

Uint8List preprocessImage(img.Image image) {
  // Resize to 28x28 pixels
  img.Image resizedImage = img.copyResize(image, width: 28, height: 28);

  // Convert image to grayscale
  Uint8List input = Uint8List(28 * 28);
  for (int y = 0; y < 28; y++) {
    for (int x = 0; x < 28; x++) {
      int pixel = resizedImage.getPixel(x, y);
      input[y * 28 + x] = img.getLuminance(pixel);  // Extract grayscale values
    }
  }

  return input;
}
