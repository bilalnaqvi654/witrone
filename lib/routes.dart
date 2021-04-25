import 'package:flutter/material.dart';
import 'package:wiretronoriginal/customer/customer_app.dart';
import 'package:wiretronoriginal/customer/sub_pages/chat.dart';
import 'package:wiretronoriginal/pages/sub_pages/changePassword.dart';
import 'package:wiretronoriginal/pages/sub_pages/editProfile.dart';

import 'pages/home.dart';
import 'pages/app.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/sub_pages/jobs.dart';
import 'customer/sub_pages/chat.dart';
import 'pages/sub_pages/attendance.dart';
import 'pages/sub_pages/settings.dart';
import 'pages/sub_pages/aboutUs.dart';
import 'pages/sub_pages/contactUs.dart';
import 'pages/sub_pages/profile.dart';
import 'pages/sub_pages/editProfile.dart';
import 'pages/sub_pages/changePassword.dart';
class Routes{
    static Route<dynamic> generate(RouteSettings settings){
        final args = settings.arguments;
        final String appTitle = "Wire Tron";
        switch(settings.name){
            case '/':
                return MaterialPageRoute(builder:(_)=>HomePage(title:appTitle));
            case '/customer':
                return MaterialPageRoute(builder:(_)=>CustomerAppPage());
            case '/main':
                return MaterialPageRoute(builder:(_)=>AppPage());
            case '/login':
                return MaterialPageRoute(builder:(_)=>LoginPage());
            case '/register':
                return MaterialPageRoute(builder:(_)=>RegisterPage());
            case '/jobs':
                return MaterialPageRoute(builder:(_)=>JobsPage());
          /*  case '/chat':
                return MaterialPageRoute(builder:(_)=>ChatPage());
            */
            case '/attendance':
                return MaterialPageRoute(builder:(_)=>AttendancePage());
            case '/settings':
                return MaterialPageRoute(builder:(_)=>SettingsPage());
            case '/profile':
                return MaterialPageRoute(builder:(_)=>ProfilePage());
            case '/edit-profile':
                return MaterialPageRoute(builder:(_)=>EditProfilePage());
            case '/about-us':
                return MaterialPageRoute(builder:(_)=>AboutPage());
            /*case '/contact-us':
                return MaterialPageRoute(builder:(_)=>ContactUs());
            */
            case '/change-password':
                return MaterialPageRoute(builder:(_)=>PasswordPage());
            default:
                return _routeNotExist();
        }

    }

    static Route<dynamic> _routeNotExist(){
        return MaterialPageRoute(builder:(_) {
            return Scaffold(
                    body:Center(
                            child:Container(
                                    color:Colors.lightBlue,
                                    child:Text("Route Doesnot Exists")
                            )
                    ),
            );
        });
    }
}

