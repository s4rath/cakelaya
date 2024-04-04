import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/textfield_provider.dart';

class CustomShadowTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function()? onTap;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomShadowTextField({
    Key? key,
    required this.controller,
    this.hintText = "",
    this.onTap,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth * 0.9; // Adjust the width as needed

    return Padding(
      padding: EdgeInsets.only(left: 0),
      child: Container(
        width: containerWidth,
        height: 54,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 8,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Consumer<TextFieldProvider>(
          builder: (context, textFieldProvider, _) {
            return TextFormField(
              onTap: onTap,
              controller: controller,
              validator: validator,
              onChanged: (newValue) {
                if (controller == textFieldProvider.name) {
                  textFieldProvider.updateName(newValue);
                } else if (controller == textFieldProvider.email) {
                  textFieldProvider.updateEmail(newValue);
                } else if (controller == textFieldProvider.phone) {
                  textFieldProvider.updatePhone(newValue);
                } else if (controller == textFieldProvider.gender) {
                  textFieldProvider.updateGender(newValue);
                }
              },
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Sniglet',
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.black),
                prefix: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(""),
                ),
                suffixIcon: Container(
                  padding: EdgeInsets.only(right: 15),
                  child: suffixIcon,
                ),
                suffixIconConstraints: BoxConstraints(
                  maxHeight: 35,
                  maxWidth: 35,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                errorText: validator != null ? validator!(controller.text) : null,
                errorStyle: TextStyle(
                  color: Colors.red, // Customize error text color here
                  fontSize: 10, // Customize error text font size here
                ),
                errorBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10, top: 20, bottom: 3),
              ),
              keyboardType: keyboardType,
            );
          },
        ),
      ),
    );
  }
}