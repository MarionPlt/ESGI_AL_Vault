import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({Key? key, required this.label, required this.route})
      : super(key: key);

  final String route;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, route);
      },
      child: Card(
          child: Container(
              color: Colors.blue[500],
              child: SizedBox(
                height: 40.h,
                width: 45.w,
                child: Center(
                  child: Text(label,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 2.h,
                      )),
                ),
              ))),
    );
  }
}
