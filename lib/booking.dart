import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Booking System',
    home: BookingPage(),
  ));
}

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking System'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        color: Colors.lightBlue,
        padding: EdgeInsets.all(16.0),
        child: BookingForm(),
      ),
    );
  }
}

class BookingForm extends StatefulWidget {
  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController peopleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Book a Trip',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),
        TextField(
          controller: destinationController,
          decoration: InputDecoration(
            labelText: 'Destination',
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 16.0),
        TextField(
          controller: dateController,
          decoration: InputDecoration(
            labelText: 'Date',
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 16.0),
        TextField(
          controller: peopleController,
          decoration: InputDecoration(
            labelText: 'Number of People',
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {

          },
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.lightBlue,
          ),
          child: Text('Book Now'),
        ),
      ],
    );
  }
}
