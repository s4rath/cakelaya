import 'package:cakelaya/avatar.dart';
import 'package:cakelaya/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'provider/user_provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController dateOfBirthController =
      TextEditingController(text: "Date of Birth");

  String _avatarImagePath = "assets/images/img_image_21.png";
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _updateAvatar(String imagePath) {
    Provider.of<UserProfile>(context, listen: false).updateAvatar(imagePath);
  }

  void _resetFields() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    genderController.clear();
    setState(() {
      _selectedDate = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    String _avatarImagePath = Provider.of<UserProfile>(context).avatarImagePath;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.17),
                    spreadRadius: 0.14,
                    blurRadius: 9,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/backbutton.png',
                height: 30,
                width: 30,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 16, top: 16, left: 16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return AvatarPage();
                          })).then((selectedImagePath) {
                            if (selectedImagePath != null) {
                              _updateAvatar(selectedImagePath);
                            }
                          });
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            _avatarImagePath,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 2,
                        right: 5,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              "assets/images/edit_icon.png",
                              height: 24,
                              width: 24,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                CustomShadowTextField(
                  controller: phoneController,
                  hintText: 'Phone Number',
                  keyboardType: TextInputType.phone,
                  suffixIcon: Image.asset(
                    'assets/edit.png',
                    height: 18,
                    width: 18,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 10),
                CustomShadowTextField(
                  controller: nameController,
                  hintText: 'Name',
                  keyboardType: TextInputType.name,
                  suffixIcon: Image.asset(
                    'assets/edit.png',
                    height: 18,
                    width: 18,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 10),
                CustomShadowTextField(
                  controller: emailController,
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: Image.asset(
                    'assets/edit.png',
                    height: 18,
                    width: 18,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 54,
                  width: MediaQuery.of(context).size.width * 0.9,
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
                  child: InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              _selectedDate != null
                                  ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                                  : "Date of Birth",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Sniglet',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 0),
                            child: Image.asset(
                              'assets/edit.png',
                              height: 18,
                              width: 18,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
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
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "Gender",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Sniglet',
                          fontWeight: FontWeight.w400,
                        ),
                        prefix: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(""),
                        ),
                        suffixIcon: Container(
                          padding: EdgeInsets.only(right: 15),
                          child: Image.asset(
                            'assets/edit.png',
                            height: 18,
                            width: 18,
                            fit: BoxFit.contain,
                          ),
                        ),
                        suffixIconConstraints: BoxConstraints(
                          maxHeight: 35,
                          maxWidth: 35,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 10, top: 20, bottom: 3),
                      ),
                      value: genderController.text.isNotEmpty
                          ? genderController.text
                          : null,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Sniglet',
                        fontWeight: FontWeight.w400,
                      ),
                      onChanged: (String? newValue) {
                        
                        genderController.text = newValue!;
                      },
                      icon: SizedBox.shrink(),
                      dropdownColor: Colors.white,
                      items: ['Male', 'Female', 'Other']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
        
              _resetFields();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Profile updated successfully'),
                  duration: Duration(seconds: 2), 
                ),
              );

            }
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            backgroundColor: Color.fromARGB(255, 251, 66, 66),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(70),
            ),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 60,
            child: Center(
              child: Text(
                'Update Profile',
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Sniglet',
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
