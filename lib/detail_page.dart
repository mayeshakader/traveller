import 'package:flutter/material.dart';
import 'package:projectone/responsive_button.dart';
import 'package:projectone/widgets/app_button.dart';
import 'package:projectone/widgets/app_large_text.dart';
import 'package:projectone/widgets/app_text.dart';

import 'colors.dart';
class DetailPage extends StatefulWidget {
  const DetailPage({Key? key }) :super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}


class  _DetailPageState extends State<DetailPage> {
  int gottenStars=4;
  int selectedIndex=-1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width:double.maxFinite,
       height:double .maxFinite,
        child: Stack(
         children: [
           Positioned(
               left:0,
               right: 0,
               child: Container(
                 width:double.maxFinite,
                 height: 350,
                 decoration: BoxDecoration(
                   image:DecorationImage(
                       image: AssetImage("img/hill.jpg"),
                       fit:BoxFit.cover
                   ),

                 ),

               )),
           Positioned(
             left:20,
               top:50,
               child: Row(
             children: [
               IconButton(onPressed: () {}, icon:Icon(Icons.menu),
               color:Colors.white,

               )
             ],
           )),
           Positioned(
             top: 330,
               child: Container(
                   width: MediaQuery.of(context).size.width,

                 height:500,
                 decoration:BoxDecoration(
                     color: Colors.white,
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(30),
                     topRight: Radius.circular(30),
                   )
                 ),
                 child :Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children:[
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children:[
                   AppLargeText(text:"Yosemite",color:Colors.black.withOpacity(0.5)),
                       AppLargeText( text : "\$ 250",color:AppColors. primaryColor) ,
                   ],
                 ),
                     SizedBox(height: 10,),
                     Row(
                       children:[
                       Icon(Icons.location_on, color:AppColors.primaryColor,),
                       SizedBox(height: 5,),
                      AppText(text: "USA,Califonia",color:AppColors.textColor,),
    ],
    ),
                     SizedBox(height: 20,),
                    Row(
                      children: [
                        Wrap(
                          children:List.generate(5, (index) {
                            return Icon(Icons.star,color:index<gottenStars?AppColors.accentColor :AppColors.textColor);
                          }),
                           ),
                        SizedBox(width:10,),
                        AppText(text: "(4.0)", color:AppColors.textColor,)
                      ],
                    ),
                     SizedBox(height: 25,),
                     AppLargeText(text: "People",color:Colors.black.withOpacity(0.8),size:20,),
                     SizedBox(height:5,),
                     AppText(text: "Number of people in your group",color:AppColors.textColor,),
                     SizedBox(height:5,),
                     Wrap(
                       children:List.generate(5, (index){
                         return InkWell(
                           onTap: (){
                             setState(() {
                               selectedIndex=index;
                             });
                           },
                           child: Container(
                             margin:const EdgeInsets.only(right:10),
                             child: AppButtons(size: 50,
                                   color: selectedIndex==index ?Colors.white:Colors.black,
                                   backgroundColor:selectedIndex==index ?Colors.black:AppColors.backgroundColor,
                                   borderColor: selectedIndex==index ?Colors.black:AppColors.backgroundColor,
                                    text:(index+1).toString(),
                               ),
                           ),
                         );

                    } ),
                     ),
                    // SizedBox(height:10,),
                     AppLargeText(text: "Description",color: Colors.black.withOpacity(0.8),size:20),
                     AppText(text: "You must go for a travel.Travelling helps get rid of pressure.Go to mountain to see the nature",color:AppColors.textColor)
                   ],
                     ),
           )),
           Positioned(
             bottom: 20,
               left:5,
               right:5,
               child:
           Row(
             children: [
               AppButtons(size:50,
                   color:  AppColors.textColor,
                   backgroundColor: Colors.white,
                   borderColor: AppColors.textColor,
                 isIcon:true,
                 icon:Icons.favorite_border
               ),
               SizedBox(width:20,),
               ResponsiveButton(
                 isResponsive:true,

               )
             ],
           ),)

         ],

        ),
      ),
    );
  }
}

