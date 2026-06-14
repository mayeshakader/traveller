import 'package:flutter/material.dart';
import 'booking.dart';
import 'welcome.dart';
import 'feedback.dart';
import 'userprofile.dart';
void main() {
  runApp(MaterialApp(
    title: 'Traveller',
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.lightBlue,
        ),
      ),
      body: Container(
        color: Colors.lightBlue, // Set the background color to light blue
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Welcome to Home Page!',
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
                label: 'User Profile',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserProfilePage ()),
                  );
                },
              ),
              SizedBox(height: 16.0),
              FeatureButton(
                icon: Icons.search,
                label: 'Explore',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Welcome()),
                  );
                },
              ),
              SizedBox(height: 16.0), // Add space between buttons
              FeatureButton(
                icon: Icons.hotel,
                label: 'Bookings',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookingPage()),
                  );
                },
              ),
              SizedBox(height: 16.0),
              FeatureButton(
                icon: Icons.feedback,
                label: 'Feedback Mechanism',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedbackPage()),
                  );
                },
              ),
            ],
          ),
        ),
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
