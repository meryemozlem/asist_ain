import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:deneme8/pushed_pageY.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:math';
import 'package:deneme8/services/camera.dart';
import 'package:deneme8/services/render_data.dart';
import 'package:flutter/services.dart';

class PushedPageS extends StatefulWidget {
  final List<CameraDescription> cameras;
  final String title;
  const PushedPageS({required this.cameras, required this.title});

  @override
  _PushedPageSState createState() => _PushedPageSState();
}

class _PushedPageSState extends State<PushedPageS> {
  late List<dynamic> _data;
  late var interpreter;
  int _imageHeight = 0;
  int _imageWidth = 0;
  int x = 1;

  @override
  void initState() {
    super.initState();
    _data = [];
    var res = loadModel();
    print('Model Response: ' + res.toString());
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
        title: Text('AlignAI Squat'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Camera(
            cameras: widget.cameras,
            setRecognitions: _setRecognitions,
          ),
          RenderData(
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
