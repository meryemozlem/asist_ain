import 'package:deneme8/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:camera/camera.dart';
import 'package:deneme8/main_screen.dart';
import 'package:deneme8/workouts.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

class HomeScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  HomeScreen(this.cameras);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    MainScreen(cameras),
    WorkOutPage(),
    ProfilePage(), // Add a ProfilePage widget here
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFE7C7C),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(LineAwesomeIcons.universal_access_solid),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(LineAwesomeIcons.burn_solid),
            label: 'Egzersizler',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(LineAwesomeIcons.user),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white70,
        iconSize: 35.0,
        elevation: 80,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ayarlar',
              style: TextStyle(
                color: Color(0xFFFE7C7C),
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
              ),
            ),
            SizedBox(height: 5),
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("images/profile-pic.png"),
              ),
              title: Text(
                "M.Özlem AYDOĞAN",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
              subtitle: Text("Kullanıcı Profili"),
            ),
            SizedBox(height: 20),
            Divider(height: 4, color: Colors.grey),
            SizedBox(height: 30),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YanProfile()),
                );
              },
              leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.greenAccent.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.person, color: Colors.greenAccent[200], size: 35),
              ),
              title: Text(
                "Profil",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            SizedBox(height: 15),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BildirimPage()),
                );
              },
              leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.deepPurple,
                    size: 35
                ),
              ),
              title: Text(
                "Bildirimler",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            SizedBox(height: 15),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BildirimPage()),
                );
              },
              leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                    Icons.privacy_tip_outlined,
                    color: Colors.indigo,
                    size: 35
                ),
              ),
              title: Text(
                "Güvenlik",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            SizedBox(height: 15),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BildirimPage()),
                );
              },
              leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.settings, color: Colors.grey, size: 35),
              ),
              title: Text(
                "Ayarlar",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            SizedBox(height: 15),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YanProfile()),
                );
              },
              leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                    Icons.info_outline_rounded,
                    color: Colors.orange,
                    size: 35
                ),
              ),
              title: Text(
                "Hakkımızda",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            SizedBox(height: 30),
            Divider(height: 4, color: Colors.grey),
            SizedBox(height: 30),
            ListTile(
              onTap: () {
                SystemNavigator.pop();
              },
              leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.redAccent.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.logout, color: Colors.red, size: 35),
              ),
              title: Text(
                "Çıkış Yap",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        ),
      ),
    );
  }
}

class YanProfile extends StatelessWidget {
  String metin="Merhaba, ben Meryem Özlem Aydoğan. Bitirme projemde yapay zeka destekli bir spor uygulaması tasarlamak istedim.";
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
                      image: AssetImage('images/ek.png'), // Resim dosyanızın yolunu buraya girin
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
                    color: Colors.white.withOpacity(0.8), // Kutunun arka plan rengi ve şeffaflığı
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

class BildirimPage extends StatelessWidget {
  String metin = "Güncelleniyor ...";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bildirim/Güvenlik/Ayarlar'),
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
                      image: AssetImage('assets/loading.gif'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                // Metin
                Positioned(
                  bottom: 20,
                  left: 70,
                  child: Text(
                    metin,
                    style: TextStyle(fontSize: 30, color: Colors.black,fontWeight: FontWeight.w400,),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedPageRoute<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;
  AnimatedPageRoute({required this.builder})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => builder(context),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}