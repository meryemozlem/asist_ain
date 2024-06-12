import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:math';
import 'package:permission_handler/permission_handler.dart';
import 'package:deneme8/services/camera.dart';
import 'package:deneme8/services/render_data_yoga.dart';
import 'package:flutter/services.dart';
//import 'package:tflite_flutter/tflite_flutter.dart';

class PushedPageY extends StatefulWidget {
  final List<CameraDescription> cameras;
  final String title;
  const PushedPageY({required this.cameras, required this.title});

  @override
  _PushedPageYState createState() => _PushedPageYState();
}

class _PushedPageYState extends State<PushedPageY> {
  late List<dynamic> _data;
  int _imageHeight = 0;
  int _imageWidth = 0;
  int x = 1;

  @override
  void initState() {
    super.initState();
    _data= [];
    checkCameraPermission().then((granted) {
      if (granted) {
        loadModel().then((res) {
          print('Model Response: $res');
        });
      } else {
        print('Camera permission denied');
      }
    });
    var res = loadModel();
    print('Model Response: ' + res.toString());
  }

  Future<bool> checkCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      status = await Permission.camera.request();
    }
    return status.isGranted;
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

  loadModel() async {
    return await Tflite1.loadModel(
        model: "assets/posenet_mv1_075_float_from_checkpoints.tflite");
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('AlignAI Warrior Pose'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Camera(
            cameras: widget.cameras,
            setRecognitions: _setRecognitions,
          ),
          RenderDataYoga(
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

class Tflite1 {
  static loadModel({required String model}) {}

  static runPoseNetOnFrame({required List<Uint8List> bytesList, required int imageHeight, required int imageWidth, required int numResults, required int rotation, required double threshold, required int nmsRadius}) {}

}
