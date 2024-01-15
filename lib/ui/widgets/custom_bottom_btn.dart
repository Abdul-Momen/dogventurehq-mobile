import 'package:dogventurehq/ui/screens/thank_you/thank_you.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBottomBtn extends StatelessWidget {
  final String rightBtnTxt;
  final String lftBtnTxt;
  final VoidCallback lftBtnFn;
  final VoidCallback rightBtnFn;


  const CustomBottomBtn({
    Key? key,
    required this.rightBtnTxt,
    required this.lftBtnTxt,
    required this.lftBtnFn,
    required  this.rightBtnFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: lftBtnFn,
              style: OutlinedButton.styleFrom(
                side: BorderSide(width: 1.0, color: Colors.red),
                minimumSize: Size.fromHeight(50),
              ),
              child: Text(
                lftBtnTxt,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          addW(10.w),
          Expanded(
            child:

            ElevatedButton(
              onPressed: rightBtnFn,
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // background (button) color
                padding: const EdgeInsets.only(
                    left: 40.0, right: 40, top: 16, bottom: 16),// foreground (text) color
              ),
              child:Text(
                rightBtnTxt,
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
