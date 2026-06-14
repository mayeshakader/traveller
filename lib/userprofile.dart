import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img/commonback.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.person,
                    size: 80.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Mili',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'User',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 24.0),
                ListTile(
                  leading: Icon(Icons.location_on, color: Colors.black),
                  title: Text('Dhaka', style: TextStyle(color: Colors.black)),
                ),
                ListTile(
                  leading: Icon(Icons.email, color: Colors.black),
                  title: Text('mili@gmail.com', style: TextStyle(color: Colors.black)),
                ),
                ListTile(
                  leading: Icon(Icons.calendar_today, color: Colors.black),
                  title: Text('Joined on January 1, 2022', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'User Profile',
    home: UserProfilePage(),
  ));
}
