import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:deneme8/services/camera.dart';
import 'package:deneme8/services/render_data_arm_press.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
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
  late var interpreter;
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

  loadModel() async {
    interpreter = await interpreter.fromAsset('assets/posenet_mv1_075_float_from_checkpoints (1).tflite');
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

