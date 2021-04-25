import 'package:flutter/material.dart';
import 'package:wiretronoriginal/constants.dart';
import 'package:wiretronoriginal/pages/app.dart';
import 'package:wiretronoriginal/pages/sub_pages/jobs.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.color_primary),
        title: Padding(
            padding: EdgeInsets.only(left: 55),
            child: Text(
              "About Us",
              style: TextStyle(
                  color: AppColors.color_primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            )
        ),
        backgroundColor: AppColors.chat_bg,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
        child: Card(
          child:Text("WireTron is a automated Software developed by a team of members This will allow the managing companies to optimize their field workers",  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color:AppColors.color_primary),),
        ),
      ),
    );
  }
}
