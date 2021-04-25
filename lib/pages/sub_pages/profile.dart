import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wiretronoriginal/constants.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.color_primary),
        title: Padding(
            padding: EdgeInsets.only(left: 70),
            child: Text(
              "Profile",
              style: TextStyle(
                  color: AppColors.color_primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            )),
        backgroundColor: AppColors.chat_bg,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/icons/profile_icon.png',
              ),
            ),
            Text(
              "Khayyam Kiyani",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.color_primary,
                  fontSize: 20,),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20),
              child: Divider(
                color: Colors.black,
                height: 2,
              ),
            ),
            ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children:
                ListTile.divideTiles(
                  color:Colors.black,
                  context: context,
                  tiles: [
                    ListTile(
                        leading: Icon(Icons.account_circle,size: 40,color:AppColors.color_primary),
                        title:  Text(
                          "Edit Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.color_primary,
                              fontSize: 25),
                        ),
                        onTap: () => Navigator.of(context).pushNamed('/edit-profile')
                    ),
                    ListTile(
                        leading: Icon(Icons.keyboard_arrow_down,size: 40,color:AppColors.color_primary),
                        title:  Text(
                          "Change Password",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.color_primary,
                              fontSize: 25),
                        ),
                        onTap: () => Navigator.of(context).pushNamed('/change-password')
                    ),
                  ],
                ).toList(),
            ),
        ],
      ),
    ));
  }
}
