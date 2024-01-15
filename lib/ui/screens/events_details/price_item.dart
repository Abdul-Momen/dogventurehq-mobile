import 'package:dogventurehq/states/controllers/event_controller.dart';
import 'package:dogventurehq/states/models/event_details_model.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomPriceItem extends StatelessWidget {
  final EventTicketsProductMasterViewModel eventTicketsProductMasterViewModel;
  final VoidCallback onSubOnClick;
  final VoidCallback onAddOnClick;

  const CustomPriceItem({
    Key? key,
    required this.eventTicketsProductMasterViewModel,
    required this.onSubOnClick,
    required this.onAddOnClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${eventTicketsProductMasterViewModel.productName} (AED ${eventTicketsProductMasterViewModel.productPrice})",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
          ),
          Row(
            children: [
              InkWell(
                onTap: onSubOnClick,
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: Center(
                      child: Text(
                    '-',
                    style: TextStyle(fontSize: 30.sp),
                  )),
                ),
              ),
              addW(10.w),
              Text(
                eventTicketsProductMasterViewModel.item.toString(),
                style: TextStyle(fontSize: 20.sp),
              ),
              addW(10.w),
              InkWell(
                onTap: onAddOnClick,
                child: Container(
                  color: Colors.green,
                  height: 40.h,
                  width: 40.w,
                  child: Center(
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 25.sp, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
