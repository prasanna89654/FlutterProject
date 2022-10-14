// import 'package:flutter/cupertino.dart';
// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/boxdecoration.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String? gender;

  DateTime date = DateTime(2022, 8, 18);
  bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  bool validatePhone(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  DateTime? birthdate;

  bool validateAge(String value) {
    const pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();

  String dropdownvalue = 'Ward Number   ';

  var items = [
    'Ward Number   ',
    'Ward no. 1',
    'Ward no. 2',
    'Ward no. 3',
    'Ward no. 4',
    'Ward no. 5',
    'Ward no. 6',
    'Ward no. 7',
    'Ward no. 8',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Form(
      key: _formKey,
      child: Scaffold(
          body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Image.asset('assets/images/logo.png'),
          const SizedBox(
            height: 20,
          ),
          const Text("Let's Get Started ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 15,
          ),
          const Text('Create a new account', style: TextStyle(fontSize: 17)),
          const SizedBox(
            height: 25,
          ),
          TextFormField(
            decoration: textDecoration.copyWith(
              labelText: "Full Name",
              prefixIcon: const Icon(Icons.people),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your name';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: textDecoration.copyWith(
                labelText: "Phone Number",
                prefixIcon: const Icon(
                  Icons.phone_android,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter phone number';
              }
              // } else if (value.length != 10)
              //   return 'Enter 10 digit Phone number';
              else if (validatePhone(value) == false) {
                return 'Enter 10 digit number only';
              }

              return null;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
              decoration: textDecoration.copyWith(
                labelText: "Password",
                prefixIcon: const Icon(Icons.lock),
              ),
              controller: _pass,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your Password';
                } else if (value.length < 5) {
                  return 'Password too Small';
                }
                return null;
              }),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: textDecoration.copyWith(
                labelText: "Your Email",
                prefixIcon: const Icon(
                  Icons.email,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your email';
              } else if (validateEmail(value) == false) {
                return 'Please enter Valid email';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                // color: Colors.red,
                // height: height * 0.065,
                width: width * 0.395,
                child: TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: textDecoration.copyWith(
                      labelText: "Age",
                      prefixIcon: const Icon(Icons.date_range)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your age';
                    } else if (int.parse(value) < 10 ||
                        int.parse(value) > 100) {
                      return 'Enter valid age ';
                    }

                    //  else if (value )
                    //   return 'Enter Valid Age';
                    return null;
                  },
                ),
              ),
              Container(
                height: height * 0.065,
                width: width * 0.40,
                // color: Colors.red,
                child: DropdownButton(

                    // Initial Value
                    value: dropdownvalue,
                    // borderRadius: BorderRadius.circular(0),

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    }),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: height * 0.03,
            width: width,
            // color: Colors.green,
            child: const Text(
              "Gender :",
              style: TextStyle(fontSize: 17),
            ),
          ),
          Container(
              // color: Colors.red,
              height: height * 0.055,
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      // height: height * 0.09,
                      width: width * 0.33,
                      // color: Colors.blue,
                      child: RadioListTile(
                        title: const Text(
                          "Male",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        value: "male",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        },
                      ),
                    ),
                    Container(
                      // height: height * 0.09,
                      width: width * 0.37,
                      // color: Colors.green,
                      child: RadioListTile(
                        title: const Text(
                          "Female",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        value: "female",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        },
                      ),
                    ),
                  ])),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: height * 0.04,
            width: double.infinity,
            // color: Colors.red,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "BirthDate :  ",
                    style: TextStyle(fontSize: 17),
                  ),
                  Container(
                      // height: 40,
                      width: width * 0.4,
                      // color: Colors.blue,
                      child: Text("${date.year}/${date.month}/${date.day}",
                          style: const TextStyle(fontSize: 17))),
                  ElevatedButton(
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(1900),
                            lastDate: date);

                        if (newDate == null) return;
                        setState(() => date = newDate);
                      },
                      child: const Text("Choose"))
                ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              width: double.infinity,
              height: height * 0.07,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    if (gender == null) {
                      showDialog(
                          barrierDismissible: false,
                          builder: (BuildContext context) => AlertDialog(
                                  // title: Text("LogOut"),
                                  content:
                                      const Text("Please choose your gender"),
                                  actions: [
                                    TextButton(
                                      // FlatButton widget is used to make a text to work like a button
                                      style: TextButton.styleFrom(
                                          // backgroundColor: Colors.blue,

                                          ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }, // function used to perform after pressing the button
                                      child: const Text(
                                        'OK',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ]),
                          context: context);
                    } else if (dropdownvalue == 'Ward Number   ') {
                      showDialog(
                          barrierDismissible: false,
                          builder: (BuildContext context) => AlertDialog(
                                  // title: Text("LogOut"),
                                  content: const Text(
                                      "Please choose your Ward number"),
                                  actions: [
                                    TextButton(
                                      // FlatButton widget is used to make a text to work like a button
                                      style: TextButton.styleFrom(
                                          // backgroundColor: Colors.blue,

                                          ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }, // function used to perform after pressing the button
                                      child: const Text(
                                        'OK',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ]),
                          context: context);
                    } else if (_formKey.currentState!.validate()) {
                      const Signup();
                    }
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ))),
          const SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(children: [
            const TextSpan(
              text: "Already have an account?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            TextSpan(
                text: 'Login',
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ))
                      }),
          ])),
        ]),
      )),
    );
  }
}
