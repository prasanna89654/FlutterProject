// import 'package:flutter/cupertino.dart';
// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Riverpod/baseDIo.dart';
import '../../Riverpod/config.dart';
import '../../widgets/boxdecoration.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String? gender;

  DateTime date = DateTime.now();

  String? wardselectedvalue;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController fname = TextEditingController();
  final TextEditingController lname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();

  String dropdownvalue = 'Ward Number   ';

  var items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
  ];

  splitString(String str) {
    var split = str.split(" ");
    return split[0];
  }

  signup() async {
    var data = {
      "name": fname.value.text,
      "gender": int.parse(gender!),
      "phoneNo": phoneNumber.value.text,
      "surname": lname.value.text,
      "email": email.value.text,
      "password": password.value.text,
      "userType": 2,
      "dobMiti": splitString(date.toString()),
      "wardNo": wardselectedvalue,
      "location": location.value.text,
      "dob": "2023-03-10T13:41:41.585Z"
    };

    try {
      const url = "/createUsers";
      var response = await Api().post(MyConfig.nodeUrl + url, data: data);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "User Created Successfully");
      } else {
        var message = response.data['error']['message'];
        Fluttertoast.showToast(msg: message);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
    // var response = await http.post(
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    // print(date);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Form(
          key: _formKey,
          child: Scaffold(
              body: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
            child: Column(children: [
              Container(
                  height: height * 0.07,
                  child: Image.asset('assets/images/care.png')),
              const SizedBox(
                height: 20,
              ),
              const Text("Let's Get Started ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 15,
              ),
              const Text('Create a new account',
                  style: TextStyle(fontSize: 17)),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: fname,
                      decoration: textDecoration.copyWith(
                        border: const OutlineInputBorder(),
                        labelText: "First Name",
                        prefixIcon: const Icon(Icons.people),
                      ),
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required()]),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: lname,
                      decoration: textDecoration.copyWith(
                        border: const OutlineInputBorder(),
                        labelText: "Last Name",
                        prefixIcon: const Icon(Icons.group),
                      ),
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required()]),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: username,
                validator: FormBuilderValidators.compose(
                    [FormBuilderValidators.required()]),
                decoration: textDecoration.copyWith(
                    border: const OutlineInputBorder(),
                    labelText: "Username",
                    prefixIcon: const Icon(
                      Icons.people,
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: email,
                decoration: textDecoration.copyWith(
                    border: const OutlineInputBorder(),
                    labelText: "Email",
                    prefixIcon: const Icon(
                      Icons.email,
                    )),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email()
                ]),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: textDecoration.copyWith(
                  border: const OutlineInputBorder(),
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.lock),
                ),
                controller: password,
                obscureText: true,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(6)
                ]),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                  decoration: textDecoration.copyWith(
                    border: const OutlineInputBorder(),
                    labelText: "Confirm Password",
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your Password';
                    } else if (value != password.text) {
                      return 'Password not matched';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: phoneNumber,
                keyboardType: TextInputType.number,
                decoration: textDecoration.copyWith(
                    border: const OutlineInputBorder(),
                    labelText: "Phone Number",
                    prefixIcon: const Icon(
                      Icons.phone,
                    )),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.equalLength(10),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: TextField(
                          decoration: textDecoration.copyWith(
                            border: const OutlineInputBorder(),
                            labelText: "Location",
                            prefixIcon: const Icon(Icons.location_city),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: DropdownButtonFormField(
                          isDense: true,
                          decoration: InputDecoration(
                            hintText: "Choose ward",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          value: wardselectedvalue,
                          items: items.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item.toString(),
                                  overflow: TextOverflow.ellipsis),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              wardselectedvalue = newValue;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Gender:",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text(
                        "M",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      value: "0",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 140,
                    child: RadioListTile(
                      title: const Text(
                        "F",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      value: "1",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text(
                        "O",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      value: "2",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
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
                                lastDate: DateTime(2400));

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
                        if (_formKey.currentState!.validate()) {
                          signup();
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
                    text: '  Login',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ))),
              ])),
            ]),
          )),
        ),
      ),
    );
  }
}
