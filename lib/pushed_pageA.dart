import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:deneme8/pushed_pageY.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:math';
import 'package:deneme8/services/camera.dart';
import 'package:deneme8/services/render_data_arm_press.dart';

class PushedPageA extends StatefulWidget {
  final List<CameraDescription> cameras;
  final String title;
  const PushedPageA({required this.cameras,required this.title});
  @override
  _PushedPageAState createState() => _PushedPageAState();
}

class _PushedPageAState extends State<PushedPageA> {
  late List<dynamic> _data;
  int _imageHeight = 0;
  int _imageWidth = 0;
  int x = 1;

  @override
  void initState() {
    super.initState();
    var res = loadModel();
    print('Model Response: ' + res.toString());
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
    return await Tflite.loadModel(
        model: "assets/posenet_mv1_075_float_from_checkpoints.tflite");
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
            data: _data == null ? [] : _data,
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
