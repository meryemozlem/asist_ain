import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:deneme8/services/camera.dart';
import 'package:deneme8/services/render_data_arm_press.dart';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:math';


class PushedPageA extends StatefulWidget {
  final List<CameraDescription> cameras;
  final String title;
  const PushedPageA({required this.cameras, required this.title});

  @override
  _PushedPageAState createState() => _PushedPageAState();
}

class _PushedPageAState extends State<PushedPageA> {
  late List<dynamic> _data;
  int _imageHeight = 0;
  int _imageWidth = 0;

  @override
  void initState() {
    super.initState();
    _data = []; // Initialize _data
    checkCameraPermission().then((granted) {
      if (granted) {
        loadModel().then((res) {
          print('Model Response: $res');
        });
      } else {
        print('Camera permission denied');
      }
    });
  }

  Future<bool> checkCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      status = await Permission.camera.request();
    }
    return status.isGranted;
  }

  Future<String> loadModel() async {
    try {
      await Tflite1.loadModel(
        model: "assets/posenet_mv1_075_float_from_checkpoints.tflite",
      );
      return 'Model loaded successfully';
    } catch (e) {
      print('Failed to load model: $e');
      return 'Model loading failed';
    }
  }

  _setRecognitions(data, imageHeight, imageWidth) {
    if (!mounted) {
      return;
    }
    setState(() {
      _data = data;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('AlignAI Arm Press'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Camera(
            cameras: widget.cameras,
            setRecognitions: _setRecognitions,
          ),
          RenderDataArmPress(
            data: _data,
            previewH: max(_imageHeight, _imageWidth),
            previewW: min(_imageHeight, _imageWidth),
            screenH: screen.height,
            screenW: screen.width,
          ),
        ],
      ),
    );
  }
}

// Dummy Tflite class to avoid errors. Replace with actual Tflite implementation.
class Tflite1 {
  static Future<void> loadModel({required String model}) async {
    // Load your model here
  }

  static Future<void> runPoseNetOnFrame({
    required List<Uint8List> bytesList,
    required int imageHeight,
    required int imageWidth,
    required int numResults,
    required int rotation,
    required double threshold,
    required int nmsRadius,
  }) async {
    // Run pose estimation here
  }
}
