import 'dart:io';

import 'package:e_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class signuppg extends StatefulWidget {
  @override
  State<signuppg> createState() => _signuppgState();
}

class _signuppgState extends State<signuppg> {
  final ImagePicker _picker = ImagePicker();

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController signuppassword = TextEditingController();
  String profileimg = "";

  bool namestatus = false;
  bool numberstatus = false;
  bool emailstatus = false;
  bool passwordstatus = false;
  bool passwordhideshow = true; // for password hide show

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF84E586),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
        child: Column(
          children: [
            Container(
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Sign Up ",
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "here",
                    style: TextStyle(color: Colors.black, fontSize: 30))
              ])),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              // decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.only(
                              //         topRight: Radius.circular(20),
                              //         topLeft: Radius.circular(20))),
                              height: 150,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: IconButton(
                                        onPressed: () async {
                                          // Capture a photo
                                          final XFile? image =
                                              await _picker.pickImage(
                                                  source: ImageSource.camera);
                                          setState(() {
                                            profileimg = image!.path;
                                          });
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                          Icons.camera_alt,
                                          size: 50,
                                        )),
                                  ),
                                  Container(
                                    child: IconButton(
                                        onPressed: () async {
                                          // Pick an image
                                          final XFile? image =
                                              await _picker.pickImage(
                                                  source: ImageSource.gallery);
                                          setState(() {
                                            profileimg = image!.path;
                                          });
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                          Icons.image,
                                          size: 50,
                                        )),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: profileimg == ""
                          ? Container(
                              child:
                                  Icon(Icons.account_circle_rounded, size: 100),
                            )
                          : Container(
                              child: CircleAvatar(
                                maxRadius: 100,
                                backgroundColor: Colors.transparent,
                                backgroundImage: FileImage(File(profileimg)),
                              ),
                            )),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          namestatus = false;
                        });
                      },
                      toolbarOptions: ToolbarOptions(
                          copy: true, cut: true, paste: true, selectAll: true),
                      controller: name,
                      decoration: InputDecoration(
                          labelText: "Name",
                          hintText: "Enter Name here",
                          errorText:
                              namestatus ? "Please enter your name" : null,
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          numberstatus = false;
                        });
                      },
                      toolbarOptions: ToolbarOptions(
                          copy: true, cut: true, paste: true, selectAll: true),
                      keyboardType: TextInputType.number,
                      controller: number,
                      decoration: InputDecoration(
                          labelText: "Mobile Number",
                          hintText: "Enter Number here",
                          errorText:
                              numberstatus ? "Please enter your number" : null,
                          prefixIcon: Icon(Icons.call),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          emailstatus = false;
                        });
                      },
                      toolbarOptions: ToolbarOptions(
                          copy: true, cut: true, paste: true, selectAll: true),
                      controller: email,
                      decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Enter Email here",
                          errorText:
                              emailstatus ? "Please enter your email" : null,
                          prefixIcon: Icon(Icons.mail),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      toolbarOptions: ToolbarOptions(
                          copy: true, cut: true, paste: true, selectAll: true),
                      onChanged: (value) {
                        setState(() {
                          passwordstatus = false;
                        });
                      },
                      obscureText: passwordhideshow,
                      controller: signuppassword,
                      decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter Password here",
                          errorText: passwordstatus
                              ? "Please enter your password"
                              : null,
                          prefixIcon: Icon(Icons.password),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordhideshow = !passwordhideshow;
                                });
                              },
                              icon: Icon(passwordhideshow
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 50,
            // ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: ElevatedButton(
                        onPressed: () {
                          String pname = name.text;
                          String pnumber = number.text;
                          String pemail = email.text;
                          String personpassword = signuppassword.text;

                          setState(() {
                            if (pname.isEmpty) {
                              setState(() {
                                namestatus = true;
                              });
                            }
                            if (pnumber.isEmpty) {
                              setState(() {
                                numberstatus = true;
                              });
                            }
                            if (pemail.isEmpty) {
                              setState(() {
                                emailstatus = true;
                              });
                            }
                            if (!pemail.contains("@")) {
                              setState(() {
                                emailstatus = true;
                              });
                            }
                            if (!pemail.contains(".com")) {
                              setState(() {
                                emailstatus = true;
                              });
                            }
                            if (personpassword.isEmpty) {
                              setState(() {
                                passwordstatus = true;
                              });
                            }
                            // else {
                            //   namestatus = false;
                            //   numberstatus = false;
                            //   emailstatus = false;
                            //   passwordstatus = false;
                            // }
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Registration Successsfully !"),duration: Duration(seconds: 2),));
                        },
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.black,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text("Sign Up")),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return loginpage();
                        },
                      ));
                    },
                    child: Container(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Already have account ? ",
                            style:
                                TextStyle(fontSize: 10, color: Colors.black)),
                        TextSpan(
                            text: "Log in",
                            style: TextStyle(fontSize: 20, color: Colors.blue))
                      ])),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ))),
    );
  }
}