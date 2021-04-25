/*
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:wiretronoriginal/customer/widgets/customer_Avatar.dart';
import 'package:wiretronoriginal/customer/widgets/customer_Message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wiretronoriginal/constants.dart';

import 'package:flutter_svg/flutter_svg.dart';

class customer_ChatPage extends StatelessWidget {
  customer_ChatPage({
    Key key,
  }) : super(key: key);
  final _sendMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(79.0, 50.0),
            child:
            // Adobe XD layer: 'Logo' (group)
            SizedBox(
              width: 217.0,
              height: 67.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 111.0, 67.0),
                    size: Size(217.0, 67.0),
                    pinLeft: true,
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child: Text(
                      'Wire',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 50,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(111.0, 0.0, 106.0, 67.0),
                    size: Size(217.0, 67.0),
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child: Text(
                      'Tron',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 50,
                        color: const Color(0xff0088ff),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(20.0, 692.0),
            child:
            // Adobe XD layer: 'TextField' (shape)
            Container(
              width: 273.0,
              height: 44.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(35.8, 705.0),
            child: SizedBox(
              width: 136.0,
              child: Text(
                'Type to send message',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 12,
                  color: const Color(0xffa5a4bf),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(302.0, 690.0),
            child:
            // Adobe XD layer: 'Send Button' (group)
            SizedBox(
              width: 49.0,
              height: 49.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 49.0, 49.0),
                    size: Size(49.0, 49.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child:
                    // Adobe XD layer: 'Send Button' (shape)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0xff13aec0),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(14.0, 15.0, 21.5, 19.9),
                    size: Size(49.0, 49.0),
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                    // Adobe XD layer: 'send-button' (group)
                    Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 21.5, 19.9),
                          size: Size(21.5, 19.9),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 0.0, 21.5, 19.9),
                                size: Size(21.5, 19.9),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child: SvgPicture.string(
                                  _svg_k8hk8x,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(28.0, 148.0),
            child:
            // Adobe XD layer: 'Avatar' (component)
            SizedBox(
              width: 57.0,
              height: 57.0,
              child: customer_Avatar(),
            ),
          ),
          Transform.translate(
            offset: Offset(102.0, 148.0),
            child:
            // Adobe XD layer: 'Message' (component)
            SizedBox(
              width: 249.0,
              height: 57.0,
              child: customer_Message(),
            ),
          ),
          Transform.translate(
            offset: Offset(28.0, 238.0),
            child:
            // Adobe XD layer: 'Message' (component)
            SizedBox(
              width: 249.0,
              height: 57.0,
              child: customer_Message(),
            ),

          ),

          Padding(
            padding: const EdgeInsets.only(top:550,left:10),
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 12),
              child: TextField(

                controller: _sendMessageController,
                decoration: InputDecoration(
                  suffixIcon: ClipRRect(child:IconButton(icon:Icon(Icons.send),color:AppColors.color_primary,onPressed: _sendMessage,),borderRadius: BorderRadius.circular(50),),
                  labelText: "Type to send Message",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],

      ),
    );
  }

}

const String _svg_k8hk8x =
    '<svg viewBox="0.0 0.0 21.5 19.9" ><path transform="translate(0.0, -16.02)" d="M 21.00736999511719 25.28272247314453 L 1.088643074035645 16.08946418762207 C 0.7714757323265076 15.94543647766113 0.3930199146270752 16.0312385559082 0.1723817139863968 16.3039722442627 C -0.04978868737816811 16.57670593261719 -0.05744975060224533 16.96435546875 0.1539952009916306 17.2447509765625 L 6.7041916847229 25.97834587097168 L 0.1539949923753738 34.71194076538086 C -0.05744995921850204 34.99233245849609 -0.04978891834616661 35.38151550292969 0.1708492785692215 35.65271759033203 C 0.3194736540317535 35.83811569213867 0.5416440367698669 35.93770980834961 0.7668788433074951 35.93770980834961 C 0.8756657242774963 35.93770980834961 0.9844527244567871 35.91472244262695 1.087110638618469 35.86722946166992 L 21.00583648681641 26.67396926879883 C 21.2785701751709 26.5483283996582 21.45170974731445 26.27712821960449 21.45170974731445 25.97834587097168 C 21.45170974731445 25.6795654296875 21.2785701751709 25.40836524963379 21.00736999511719 25.28272247314453 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
*/
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wiretronoriginal/constants.dart';

class ChatPage extends StatefulWidget {
  final String title = "Wire Tron";
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _sendMessageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/user_icon.png',
                          ),
                          SizedBox(
                            width: 270,
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: Card(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 100,
                                        top: 5,
                                      ),
                                      child: Text(
                                        "Sir, I am From WireTron",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: AppColors.color_secondary),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 35,
                                            left: 13,
                                          ),
                                          child: Text(
                                            "9:03pm",
                                            style: TextStyle(
                                                color:
                                                    AppColors.color_secondary),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 35,
                                            left: 100,
                                          ),
                                          child: Text(
                                            "Delivered",
                                            style: TextStyle(
                                                color:
                                                    AppColors.color_secondary),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                color: AppColors.chat_bg,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 270,
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: Card(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 100,
                                        top: 5,
                                      ),
                                      child: Text(
                                        "Sir, I am From WireTron",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: AppColors.color_secondary),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 35,
                                            left: 13,
                                          ),
                                          child: Text(
                                            "9:03pm",
                                            style: TextStyle(
                                                color:
                                                    AppColors.color_secondary),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 35,
                                            left: 10,
                                          ),
                                          child: Text(
                                            "Delivered",
                                            style: TextStyle(
                                                color:
                                                    AppColors.color_secondary),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                color: AppColors.chat_bg,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(),
                              child: Image.asset(
                                'assets/icons/user_icon.png',
                              )),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              width: 350,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 12),
                child: TextField(
                  controller: _sendMessageController,
                  decoration: InputDecoration(
                    suffixIcon: ClipRRect(
                      child: IconButton(
                        icon: Icon(Icons.send),
                        color: AppColors.color_primary,
                        onPressed: _sendMessage,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    labelText: "Type to send Message",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    _sendMessageController.clear();
  }
}
/*
          Padding(
            padding: const EdgeInsets.only(top: 300),
            child: SizedBox(
              width: 350,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 12),
                child: TextField(
                  controller: _sendMessageController,
                  decoration: InputDecoration(
                    suffixIcon: ClipRRect(child: IconButton(
                      icon: Icon(Icons.send),
                      color: AppColors.color_primary,
                      onPressed: _sendMessage,),
                      borderRadius: BorderRadius.circular(50),),
                    labelText: "Type to send Message",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),*/
