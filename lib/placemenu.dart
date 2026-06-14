import 'package:flutter/material.dart';
import 'bdplacemenu.dart';
import 'booking.dart';
import 'detail_page.dart';
import 'main_page.dart';
import 'welcome.dart';
import 'feedback.dart';
import 'userprofile.dart';

void main() {
  runApp(MaterialApp(
    title: 'Traveller',
    home: PlaceMenu(),
  ));
}

class PlaceMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('img/mountainone.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Welcome!',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 32.0),
                  FeatureButton(
                    icon: Icons.person,
                    label: 'HILL',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Bdplacemenu()),
                      );
                    },
                  ),
                  SizedBox(height: 16.0),
                  FeatureButton(
                    icon: Icons.hotel,
                    label: 'SEA',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailPage()),
                      );
                    },
                  ),
                  SizedBox(height: 32.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  FeatureButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.lightBlue,
      ),
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
