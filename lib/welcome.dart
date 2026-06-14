import 'package:flutter/material.dart';
import 'responsive_button.dart';
import 'widgets/app_large_text.dart';
import 'widgets/app_text.dart';
import 'colors.dart';
import 'main_page.dart';
class Welcome extends StatefulWidget {
  const Welcome({Key? key }) :super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}
  class _WelcomeState extends State<Welcome>{
  List images =[
    "mountainone.jpg",
    "mountaintwo.jpg",
    "mountainthree.jpg",
  ];
List text =[

];
  @override
  Widget build(BuildContext context ) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "img/" + images[index]
                      ),
                      fit: BoxFit.cover
                  )
              ),
              child: Container(
                  margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(text: "Trips"),
                          AppText(text: "MOUNTAIN", size: 30,),
                          SizedBox(height: 20,),
                          Container(
                            width: 250,
                            child: AppText(
                              text: "Mountain hikes give you an increadible scence of freedom along with endurane",
                              color: AppColors.primaryColor,
                              size: 14,

                            ),
                          ),
                          SizedBox(height: 40,),
                          ResponsiveButton(width: 120,)

                        ],
                      ),
                      Column(
                        children: List.generate(3, (indexDots) {
                          return Container(
                            margin:const EdgeInsets.only(bottom:2),
                            width: 8,
                            height: index==indexDots?25:8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index==indexDots?AppColors.textColor:AppColors.backgroundColor.withOpacity(0.3)
                            ),
                          );
                        }),
                      )
                    ],
                  )
              ),

            );
          }),
    );
  }

}
