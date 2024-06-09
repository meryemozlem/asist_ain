import 'package:deneme8/main.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'pushed_pageA.dart';
import 'pushed_pageS.dart';
import 'pushed_pageY.dart';

class MainScreen extends StatelessWidget {

  final List<CameraDescription> cameras;
  MainScreen(this.cameras);

  static const String id = 'main_screen';
  @override
  Widget build(BuildContext context) {

    //Size screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('Align.AI'),
      //   backgroundColor: Colors.blueAccent,
      // ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Container(
            padding: EdgeInsets.only(left: 17.0, right: 19.0),
            child: Text(
              'Yapay Zeka Koçu',
              style: TextStyle(
                color: Color(0xFFFE7C7C),
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 17.0, right: 16.0),
            child: Text(
              'Mükemmel vücut dengenizi oluşturun',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ),
            ),
          ),
          SizedBox(height: 10),
          Image.asset('images/align.PNG'),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            /*child: SizedBox(
            ),*/
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
                padding: EdgeInsets.symmetric(vertical: 5.0),
                scrollDirection: Axis.horizontal,
                children: [
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 160,
                        height: 140,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0)), backgroundColor: Colors.white // Set button color
                            ),
                            onPressed: () {
                              print('hello');
                            },
                            child: Container(
                                padding: EdgeInsets.all(1.0),
                                child: Image.asset('images/img1.png')
                            )
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
                                    borderRadius: BorderRadius.circular(18.0)), backgroundColor: Colors.white // Set button color
                            ),
                            onPressed: () =>
                                onSelectA(context: context, modelName: 'posenet'),
                            child: Container(
                                padding: EdgeInsets.all(5.0),
                                child: Image.asset('images/squat.PNG')
                            )
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
                                    borderRadius: BorderRadius.circular(18.0)), backgroundColor: Colors.white // Set button color
                            ),
                            onPressed: () {
                              print('hello');
                            },
                            child: Container(
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset('images/arm_press.PNG')
                            )
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
                                    borderRadius: BorderRadius.circular(18.0)), backgroundColor: Colors.white // Set button color
                            ),
                            onPressed: () {
                              print('hello');
                            },
                            child: Container(
                                padding: EdgeInsets.all(1.0),
                                child: Image.asset('images/lunge_squat.PNG')
                            )
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              'Yoga Hareketleri',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 24.0,
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
                          width: 160,
                          height: 140,
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            width: 140,
                            height: 140,
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0)), backgroundColor: Colors.white // Set button color
                                ),
                                onPressed: () {
                                  print('hello');
                                },
                                child: Container(
                                    padding: EdgeInsets.all(1.0),
                                    child: Image.asset('images/yoga1.PNG')
                                )
                            ),)
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 160,
                        height: 140,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                            width: 140,
                            height: 140,
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0)), backgroundColor: Colors.white // Set button color
                                ),
                                onPressed: () {
                                  onSelectY(context: context, modelName: 'posenet');
                                },
                                child: Container(
                                    padding: EdgeInsets.all(1.0),
                                    child: Image.asset('images/yoga3.PNG')
                                )

                            )),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width:160,
                        height: 140,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child:  Container(
                            width: 140,
                            height: 140,
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0)), backgroundColor: Colors.white // Set button color
                                ),
                                onPressed: () {
                                  print("hello");
                                },
                                child: Container(
                                    padding: EdgeInsets.all(1.0),
                                    child: Image.asset('images/yoga4.PNG')
                                )
                            ),),
                      ),

                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 160,
                        height: 140,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child:  Container(
                            width: 140,
                            height: 140,
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0)), backgroundColor: Colors.white // Set button color
                                ),
                                onPressed: () {
                                  print("hello");
                                },
                                child: Container(
                                    padding: EdgeInsets.all(1.0),
                                    child: Image.asset('images/yoga2.PNG')
                                )

                            )),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
          /* Container(
             child: ElevatedButton(
               child: Text('Pose Estimation'),
               onPressed: () =>
                   onSelectY(context: context, modelName: 'posenet'),
             ),
           ),*/
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
