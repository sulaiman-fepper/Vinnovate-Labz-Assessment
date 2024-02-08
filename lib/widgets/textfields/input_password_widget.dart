import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';

class InputPasswordWidget extends StatefulWidget {

  final TextEditingController controller;
  final String hintText;
  final String name;
  final TextInputType? keyboardType;
  final Function? onTap;
  // final Function? onChanged;
  final IconData icon;
  final ValueChanged<String?>? onChanged;



  const InputPasswordWidget({Key? key, required this.controller, required this.hintText, this.keyboardType, this.onTap, this.onChanged, this.icon = Icons.add,this.name = "",}) : super(key: key);



  @override
  // ignore: library_private_types_in_public_api
  _InputPasswordWidgetState createState() => _InputPasswordWidgetState();
}

class _InputPasswordWidgetState extends State<InputPasswordWidget> {
  bool isVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: const EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      child: FormBuilderTextField(
        name: widget.name,
        readOnly: false,
        style: CustomStyle.textStyle,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        onTap: widget.onTap as void Function()?,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.min(6, inclusive: true),
        ]),
        onChanged: widget.onChanged,
        // onSaved: (value) => (widget.controller.text = value ?? ''),
        decoration: InputDecoration(
          // helperText: '* Demo username: admin',
          prefixIcon: Icon(widget.icon, color: CustomColor.gray,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
            borderSide:
            const BorderSide(color: CustomColor.textBoxColor, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
            borderSide:
            const BorderSide(color: CustomColor.textBoxColor, width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
            borderSide: const BorderSide(
                color: CustomColor.textBoxColor, width: 0.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
            borderSide: const BorderSide(color: Colors.red, width: 0.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
            borderSide: const BorderSide(color: Colors.red, width: 0.0),
          ),
          filled: true,
          fillColor: CustomColor.textBoxColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          hintText: widget.hintText,
          // label: Text(widget.labelText),
          hintStyle: CustomStyle.hintTextStyle,
          suffixIcon: IconButton(
            icon: Icon(
              isVisibility ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            ),
            color: CustomColor.gray,
            onPressed: () {
              setState(() {
                isVisibility = !isVisibility;
              });
            },
          ),
        ),
        obscureText: isVisibility,
      ),
    );
  }
}
