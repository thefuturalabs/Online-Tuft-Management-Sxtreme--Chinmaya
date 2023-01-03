import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utilites/appconstants.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? pickedImage;

  pickimage() async {
    ImagePicker imagePicker = ImagePicker();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Pick Image From"),
          content: Container(
            height: 100,
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    XFile? image = await imagePicker.pickImage(
                        source: ImageSource.gallery);

                    if (image != null) {
                      setState(() {
                        pickedImage = File(image.path);
                      });
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 190,
                    decoration: BoxDecoration(
                        color: AppConstants.primarycolors,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(4, 4),
                            spreadRadius: 1,
                            blurRadius: 2,
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text(
                        "Gallery",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () async {
                    XFile? image =
                        await imagePicker.pickImage(source: ImageSource.camera);

                    if (image != null) {
                      setState(() {
                        pickedImage = File(image.path);
                      });
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 190,
                    decoration: BoxDecoration(
                        color: AppConstants.primarycolors,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(4, 4),
                            spreadRadius: 1,
                            blurRadius: 2,
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text(
                        "Camera",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool isPasswordVisible = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 150,
                width: 150,
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            pickimage();
                          },
                          child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: AppConstants.primarycolors,
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              )),
                        )),
                  ],
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: pickedImage == null
                            ? NetworkImage(
                                "https://thumbs.dreamstime.com/b/default-avatar-placeholder-profile-icon-male-eps-file-easy-to-edit-default-avatar-placeholder-profile-icon-male-139556753.jpg")
                            : FileImage(pickedImage!) as ImageProvider<Object>,
                        fit: BoxFit.cover),
                    border: Border.all(
                        color: AppConstants.primarycolors, width: 2)),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  // controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter the username";
                    }
                  },
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                      errorStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppConstants.primarycolors, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppConstants.primarycolors, width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppConstants.primarycolors, width: 2),
                      ),
                      hintText: "User Name",
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: isPasswordVisible,
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter the Password";
                    }
                  },
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                      errorStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppConstants.primarycolors, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppConstants.primarycolors, width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppConstants.primarycolors, width: 2),
                      ),
                      suffixIcon: isPasswordVisible == true
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  isPasswordVisible = false;
                                });
                              },
                              child: Icon(
                                Icons.visibility,
                                color: Colors.grey,
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  isPasswordVisible = true;
                                });
                              },
                              child: Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                      hintText: "Password",
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: InkWell(
                  onTap: () {
                    // final valid = formKey.currentState!.validate();
                  },
                  child: Container(
                    height: 40,
                    width: 190,
                    decoration: BoxDecoration(
                        color: AppConstants.primarycolors,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(4, 4),
                            spreadRadius: 1,
                            blurRadius: 2,
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text(
                        "Update",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}