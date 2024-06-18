import 'package:deneme8/main.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'pushed_pageA.dart';
import 'pushed_pageS.dart';
import 'pushed_pageY.dart';


class MainScreen extends StatelessWidget {
  late var interpreter;
  final List<CameraDescription> cameras;
  MainScreen(this.cameras);

  static const String id = 'main_screen';
  @override
  Widget build(BuildContext context) {
    //Size screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Container(
            padding: EdgeInsets.only(left: 17.0, right: 19.0),
            child: Text(
              'Assist AI',
              style: TextStyle(
                color: Color(0xFFFE7C7C),
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
              ),
            ),
          ),
          SizedBox(height: 3),
          Container(
            padding: EdgeInsets.only(left: 17.0, right: 16.0),
            child: Text(
              'Yapay Zeka Destekli Spor Koçun',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 18.0,
              ),
            ),
          ),
          SizedBox(height: 10),
          Image.asset('images/align.PNG'),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              'Güç ve Ağırlık Hareketleri',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 22.0,
              ),
            ),
          ),
          Container(
            child: SizedBox(
              height: 150,
              child: ListView(
                //padding: EdgeInsets.symmetric(vertical: 5.0),
                scrollDirection: Axis.horizontal,
                children: [
                  //tek kol
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 140,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            backgroundColor: Colors.white,
                          ),
                          /*onPressed: () =>
                                onSelectA(context: context, modelName: 'posenet'),*/
                          onPressed: () =>
                              onSelectA(context: context, modelName: 'posenet'),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/img1.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 160,
                        height: 140,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)), backgroundColor: Colors.white // Set button color
                            ),
                            onPressed: () =>
                                onSelectS(context: context, modelName: 'posenet'),
                          child:Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/squat.PNG'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 160,
                        height: 140,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)), backgroundColor: Colors.white // Set button color
                            ),
                            onPressed: () =>
                                onSelectA(context: context, modelName: 'posenet'),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/arm_press.PNG'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 160,
                        height: 140,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)), backgroundColor: Colors.white // Set button color
                            ),
                            onPressed: () {
                              onSelectS(context: context, modelName: 'posenet');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/lunge_squat.PNG'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                        ),
                      ),
                    ],
                  ),],
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              'Yoga Hareketleri',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
          ),
          Container(
            child: SizedBox(
              height: 150,
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                scrollDirection: Axis.horizontal,
                children: [
                  Stack(
                    children: <Widget>[
                      Container(
                          width: 140,
                          height: 140,
                          child: Container(
                            width: 140,
                            height: 140,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)), backgroundColor: Colors.white // Set button color
                                ),
                                onPressed: () {
                                  onSelectY(context: context, modelName: 'posenet');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/yoga3.PNG'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                            ),)
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 140,
                        child: Container(
                            width: 140,
                            height: 140,
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)), backgroundColor: Colors.white // Set button color
                                ),
                                onPressed: () {
                                  onSelectY(context: context, modelName: 'posenet');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/yoga1.PNG'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                            ),),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width:160,
                        height: 140,
                        child:  Container(
                            width: 140,
                            height: 140,
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)), backgroundColor: Colors.white // Set button color
                                ),
                                onPressed: () {
                                  onSelectY(context: context, modelName: 'posenet');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/yoga4.PNG'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),),),),],),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 160,
                        height: 140,
                        child:  Container(
                            width: 140,
                            height: 140,
                            padding: EdgeInsets.symmetric(horizontal: 2),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)), backgroundColor: Colors.white // Set button color
                                ),
                                onPressed: () {
                                  onSelectY(context: context, modelName: 'posenet');
                                },

                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/yoga2.PNG'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),

                            )),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void onSelectA({required BuildContext context, required String modelName}) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PushedPageA(
        cameras: cameras,
        title: modelName,
      ),
    ),
  );
}

void onSelectS({required BuildContext context, required String modelName}) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PushedPageS(
        cameras: cameras,
        title: modelName,
      ),
    ),
  );
}

void onSelectY({required BuildContext context, required String modelName}) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PushedPageY(
        cameras: cameras,
        title: modelName,
      ),
    ),
  );
}

class YanProfile extends StatelessWidget {
  String metin="Merhaba";
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil/Hakkımızda'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 450,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/ek.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Container(height: 650),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.all(17),
                    color: Colors.white.withOpacity(0.8),
                    child: Text(
                      metin,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],),),
    );
  }
}


