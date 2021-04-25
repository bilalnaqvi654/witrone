import 'package:flutter/material.dart';
import 'package:wiretronoriginal/widgets/Button.dart';
import 'package:wiretronoriginal/widgets/TaxiOutlLine.dart';

class ConfirmSheet extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onPressed;
  ConfirmSheet({this.title, this.subtitle, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 15.0,
            spreadRadius: 0.5,
            color: Colors.black26,
            offset: Offset(
              0.7,
              0.7,
            ),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 17.0),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 35.0,
                fontFamily: 'Brand-Bold',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 24.0,
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'Brand-Regular',
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: TaxiOutlineButton(
                        color: Colors.white,
                        title: 'Back',
                        onPressed: onPressed),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Container(
                    child: TaxiButton(
                        color: (title == 'GO ONLINE')
                            ? Colors.green
                            : Colors.red[200],
                        title: title,
                        onPressed: onPressed),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
