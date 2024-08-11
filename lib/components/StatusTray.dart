import 'package:flutter/material.dart';

import 'package:comp30022/color.dart';

class StatusTray extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: AppColors.turquoise,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.wifi, color: Colors.green),
              SizedBox(width: 16.0),
              Icon(Icons.public, color: Colors.white),
              SizedBox(width: 16.0),
              Icon(Icons.person, color: Colors.white),
              SizedBox(width: 16.0),
              Icon(Icons.settings, color: Colors.white),
              SizedBox(width: 16.0),
              Icon(Icons.phone, color: Colors.white),
              SizedBox(width: 16.0),
              Container(
                padding: EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Icon(Icons.local_hospital, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
