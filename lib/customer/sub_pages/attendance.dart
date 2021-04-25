import 'package:flutter/material.dart';
import 'package:wiretronoriginal/constants.dart';
import 'package:wiretronoriginal/pages/app.dart';
import 'package:wiretronoriginal/pages/sub_pages/jobs.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 28.0, top: 25, bottom: 10),
          child: Text(
            "Select availability Time",
            style: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),

        // SliderContainer(),
        Padding(
            padding: EdgeInsets.only(top: 20),
            child: Center(
              child: FlatButton(
                  child: Text('Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Arial",
                      )),
                  onPressed: () {},
                  splashColor: AppColors.color_secondary,
                  color: AppColors.color_secondary,
                  height: 50,
                  minWidth: 200,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color.fromRGBO(0, 136, 255, 1)),
                      borderRadius: BorderRadius.circular(50))),
            )),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    ));
  }
}

class SliderContainer extends StatefulWidget {
  @override
  _SliderContainerState createState() => _SliderContainerState();
}

class _SliderContainerState extends State<SliderContainer> {
  RangeValues values = const RangeValues(9, 22);

  @override
  Widget build(BuildContext context) {
    String _start = (values.start.round() < 12)
        ? values.start.round().toString() + ":00 AM"
        : values.start.round().toString() + ":00 PM";
    String _end = (values.end.round() < 12)
        ? values.end.round().toString() + ":00 AM"
        : values.end.round().toString() + ":00 PM";
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 10,
        // minThumbSeparation: 100
      ),
      child: RangeSlider(
        activeColor: AppColors.color_secondary,
        inactiveColor: AppColors.icons_color_primary,
        divisions: 14,
        labels: RangeLabels(_start, _end),
        min: 9,
        max: 22,
        values: values,
        onChanged: (val) {
          setState(() {
            values = val;
            _start = (values.start.round() < 12)
                ? values.start.round().toString() + ":00 AM"
                : values.start.round().toString() + ":00 PM";
            _end = (values.end.round() < 12)
                ? values.end.round().toString() + ":00 AM"
                : values.end.round().toString() + ":00 PM";
          });
        },
      ),
    );
  }
}
