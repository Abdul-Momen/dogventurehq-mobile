import 'package:dogventurehq/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class DrawerItem extends StatelessWidget {
  final String name;
  final String icon;
  final VoidCallback onClick;

  const DrawerItem({
    Key? key,
    required this.name,
    required this.icon,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
        leading: SvgPicture.asset(
          icon,
          height: 20.h,
          color: Colors.orange,
        ),
        title: Text(
          name,
          style: TextStyle(
            fontSize: 22.sp,
            fontFamily: ConstantStrings.kAppFont,
          ),
        ),
        onTap: onClick,
      ),
    );
  }
}
