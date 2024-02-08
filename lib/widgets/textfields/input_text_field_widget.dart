import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';

class InputTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String name;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final Function? onTap;
  final IconData icon;
  final ValueChanged<String?>? onChanged;

  const InputTextFieldWidget(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.keyboardType,
      this.onTap,
      this.onChanged,
      this.readOnly = false,
      this.icon = Icons.add,
      this.name = "",
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 75,
          margin: const EdgeInsets.only(left: 20, right: 20),
          // width: double.infinity,
          child: FormBuilderTextField(
            name: name,
            readOnly: readOnly!,
            style: CustomStyle.textStyle,
            // controller: controller,
            controller: controller,
            keyboardType: keyboardType,
            onTap: onTap as void Function()?,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ]),
            onChanged: onChanged,
            // onSaved: (value) => (controller.text = value ?? ''),
            decoration: InputDecoration(
              // helperText: '* Demo username: admin',
              // floatingLabelBehavior: FloatingLabelBehavior.always,
              prefixIcon: Icon(icon, color: CustomColor.gray,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                borderSide: const BorderSide(color: CustomColor.textBoxColor, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                borderSide: const BorderSide(color: CustomColor.textBoxColor, width: 0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                borderSide: const BorderSide(color: CustomColor.textBoxColor, width: 0.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                borderSide: const BorderSide(color: CustomColor.textBoxColor, width: 0.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                borderSide: const BorderSide(color: CustomColor.textBoxColor, width: 0.0),
              ),
              filled: true,
              fillColor: CustomColor.textBoxColor,
              contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              hintText: hintText,
              // label: Text(labelText),
              hintStyle: CustomStyle.hintTextStyle,
            ),
          ),
        )
        // CustomSize.heightBetween()
      ],
    );
  }
}
