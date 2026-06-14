import 'package:flutter/material.dart';
import 'package:projectone/responsive_button.dart';
import 'package:projectone/widgets/app_button.dart';
import 'package:projectone/widgets/app_large_text.dart';
import 'package:projectone/widgets/app_text.dart';
import 'colors.dart';
import 'login.dart';

class Sajak extends StatefulWidget {
  const Sajak ({Key? key }) :super(key: key);

  @override
  _SajakState createState() => _SajakState();
}

class  _SajakState extends State< Sajak > {
  int gottenStars = 4;
  int selectedIndex = -1;
  int basePrice = 1000;

  void _showConfirmationDialog() {
    if (selectedIndex == -1) {
      // Display a message if the number of people is not selected
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please select the number of people.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {

      int selectedPeople = selectedIndex + 1;
      int totalPrice = basePrice * selectedPeople;


      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Booking Confirmation'),
            content: Text('You have successfully booked the trip.\nTotal Price: $totalPrice tk'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("img/sajak.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Positioned(
              top: 330,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: " Sajak ",
                          color: Colors.black.withOpacity(0.5),
                        ),
                        AppLargeText(
                          text: "10000 tk",
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.primaryColor,),
                        SizedBox(height: 5,),
                        AppText(text: "Dhaka,Bangladesh", color: AppColors.textColor,),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < gottenStars
                                  ? AppColors.accentColor
                                  : AppColors.textColor,
                            );
                          }),
                        ),
                        SizedBox(width: 10,),
                        AppText(text: "(4.0)", color: AppColors.textColor,)
                      ],
                    ),
                    SizedBox(height: 25,),
                    AppLargeText(
                      text: "People",
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    SizedBox(height: 5,),
                    AppText(
                      text: "Number of people in your group",
                      color: AppColors.textColor,
                    ),
                    SizedBox(height: 5,),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: AppButtons(
                              size: 50,
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: selectedIndex == index
                                  ? Colors.black
                                  : AppColors.backgroundColor,
                              borderColor: selectedIndex == index
                                  ? Colors.black
                                  : AppColors.backgroundColor,
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 10,),
                    AppLargeText(
                      text: "Description",
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    AppText(
                      text:
                      "You must go for a travel. Travelling helps get rid of pressure. Go to mountain to see the nature",
                      color: AppColors.textColor,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 5,
              right: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _showConfirmationDialog();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                    ),
                    child: Text('Book now'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
