import 'package:flutter/material.dart';
import 'Sajak.dart';
import 'Tagindon.dart';
import 'Thanchi.dart';
import 'bandorbon.dart';

void main() {
  runApp(MaterialApp(
    title: 'Traveller',
    home: Bdplacemenu(),
  ));
}

class Bdplacemenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: Text('Places'),
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
                    icon: Icons.search,
                    label: 'Thanchi',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Thanchi()),
                      );
                    },
                  ),
                  SizedBox(height: 16.0),
                  FeatureButton(
                    icon: Icons.search,
                    label: 'Tagindon',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Tagindon()),
                      );
                    },
                  ),
                  SizedBox(height: 16.0),
                  FeatureButton(
                    icon: Icons.search,
                    label: '  Sajak  ',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Sajak()),
                      );
                    },
                  ),
                  SizedBox(height: 16.0),
                  FeatureButton(
                    icon: Icons.search,
                    label: 'Bandorbon',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Bandorbon()),
                      );
                    },
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
