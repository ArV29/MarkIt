import 'dart:math';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:image/image.dart' as imglib;
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'package:tflite_flutter/tflite_flutter.dart';

var interpreter;

double threshold = 1.0;

Float32List imageToByteListFloat32(
    imglib.Image image, int inputSize, double mean, double std) {
  var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
  var buffer = Float32List.view(convertedBytes.buffer);
  int pixelIndex = 0;
  for (var i = 0; i < inputSize; i++) {
    for (var j = 0; j < inputSize; j++) {
      var pixel = image.getPixel(j, i);
      buffer[pixelIndex++] = (imglib.getRed(pixel) - mean) / std;
      buffer[pixelIndex++] = (imglib.getGreen(pixel) - mean) / std;
      buffer[pixelIndex++] = (imglib.getBlue(pixel) - mean) / std;
    }
  }
  return convertedBytes.buffer.asFloat32List();
}

double euclideanDistance(List e1, List e2) {
  double sum = 0.0;
  for (int i = 0; i < e1.length; i++) {
    sum += pow((e1[i] - e2[i]), 2);
  }
  return sqrt(sum);
}

Future loadModel() async {
  Delegate delegate;
  try {
    delegate = GpuDelegateV2(
        options: GpuDelegateOptionsV2(
      isPrecisionLossAllowed: false,
      inferencePreference: TfLiteGpuInferenceUsage.fastSingleAnswer,
      inferencePriority1: TfLiteGpuInferencePriority.minLatency,
      inferencePriority2: TfLiteGpuInferencePriority.auto,
      inferencePriority3: TfLiteGpuInferencePriority.auto,
    ));

    var interpreterOptions = InterpreterOptions()..addDelegate(delegate);

    interpreter = await Interpreter.fromAsset('mobilefacenet.tflite',
        options: interpreterOptions);
  } catch (e) {
    print('Failed to load model.');
    print(e);
  }
}

Future add(imglib.Image img) async {
  print("I'm herereeeeeeeeeeeee");
  List e1;
  List input = imageToByteListFloat32(img, 112, 128, 128);
  input = input.reshape([1, 112, 112, 3]);
  print(input);
  List output = List.filled(1 * 192, 0, growable: true).reshape([1, 192]);
  await loadModel();
  print(interpreter);
  interpreter.run(input, output);
  output = output.reshape([192]);
  e1 = List.from(output);
  print("Something Something");
  print(e1);
}
//
// bool recog(imglib.Image img) {
//   List e1;
//   List input = imageToByteListFloat32(img, 112, 128, 128);
//   input = input.reshape([1, 112, 112, 3]);
//   List output = List.filled(1 * 192, null, growable: false).reshape([1, 192]);
//   interpreter.run(input, output);
//   output = output.reshape([192]);
//   e1 = List.from(output);
//   return compare(e1);
// }

// bool compare(List currEmb) {
//   double minDist = 999;
//   double currDist = 0.0;
//   bool predRes = false;
//   savedData = currDist = euclideanDistance(savedData, currEmb);
//   if (currDist <= threshold && currDist < minDist) {
//     minDist = currDist;
//     predRes = true;
//   }
//
//   return predRes;
// }

imglib.Image convertCameraImage(CameraImage image, CameraLensDirection _dir) {
  int width = image.width;
  int height = image.height;
  // imglib -> Image package from https://pub.dartlang.org/packages/image
  var img = imglib.Image(width, height); // Create Image buffer
  const int hexFF = 0xFF000000;
  final int uvyButtonStride = image.planes[1].bytesPerRow;
  final int? uvPixelStride = image.planes[1].bytesPerPixel;
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      final int uvIndex =
          uvPixelStride! * (x / 2).floor() + uvyButtonStride * (y / 2).floor();
      final int index = y * width + x;
      final yp = image.planes[0].bytes[index];
      final up = image.planes[1].bytes[uvIndex];
      final vp = image.planes[2].bytes[uvIndex];
      // Calculate pixel color
      int r = (yp + vp * 1436 / 1024 - 179).round().clamp(0, 255);
      int g = (yp - up * 46549 / 131072 + 44 - vp * 93604 / 131072 + 91)
          .round()
          .clamp(0, 255);
      int b = (yp + up * 1814 / 1024 - 227).round().clamp(0, 255);
      // color: 0x FF  FF  FF  FF
      //           A   B   G   R
      img.data[index] = hexFF | (b << 16) | (g << 8) | r;
    }
  }
  var img1 = (_dir == CameraLensDirection.front)
      ? imglib.copyRotate(img, -90)
      : imglib.copyRotate(img, 90);
  return img1;
}
