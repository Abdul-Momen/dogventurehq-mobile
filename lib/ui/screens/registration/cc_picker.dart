import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CCPicker extends StatelessWidget {
  final Function(CountryCode) onChangedFn;
  const CCPicker({
    Key? key,
    required this.onChangedFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CountryCodePicker(
          padding: EdgeInsets.zero,
          flagWidth: 25.w,
          textStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          onChanged: onChangedFn,
          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
          initialSelection: '+971',
          favorite: const ['+39', 'FR'],
          showCountryOnly: false,
          showOnlyCountryWhenClosed: false,
          alignLeft: false,
        ),
        const Icon(Icons.arrow_drop_down),
      ],
    );
  }
}
