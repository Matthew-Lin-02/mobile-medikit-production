import 'package:flutter/material.dart';

import 'package:comp30022/color.dart';

class StatusTray extends StatelessWidget {
  var iconSize = 50.0;
  
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Container(
          padding: EdgeInsets.only(left: 2.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 5, 161, 182),
            borderRadius: BorderRadius.circular(80.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: iconSize, width: iconSize, child: IconButton(icon: Image.asset('assets/images/wifi-connection.png'), padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5), onPressed: () {},),),
              SizedBox(height: iconSize, width: iconSize, child: IconButton(icon: Image.asset('assets/images/globe.png'), padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5), onPressed: () {},),),
              SizedBox(height: iconSize, width: iconSize, child: IconButton(icon: Image.asset('assets/images/person-outline.png'), padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5), onPressed: () {},),),
              SizedBox(height: iconSize, width: iconSize, child: IconButton(icon: Image.asset('assets/images/settings.png'), padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5), onPressed: () {},),),
              SizedBox(height: iconSize, width: iconSize, child: IconButton(icon: Image.asset('assets/images/phone.png'), padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5), onPressed: () {},),),
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SizedBox(height: iconSize, width: 50, child: IconButton(icon: Image.asset('assets/images/ambulance.png'), padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5), onPressed: () {},),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
