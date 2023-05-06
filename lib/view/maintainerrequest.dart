import 'dart:convert';
import 'dart:io';
import 'package:open_filex/open_filex.dart';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:project/Riverpod/Models/userModel.dart';
import 'package:path_provider/path_provider.dart';
import '../Riverpod/baseDIo.dart';
import '../Riverpod/config.dart';

class DemoPage extends ConsumerStatefulWidget {
  DemoPage({required this.id, super.key});
  UserDetailsModel id;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends ConsumerState<DemoPage> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController roleCtrl = TextEditingController();
  final TextEditingController descCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isSelected = false;
  bool hasfile = false;
  File? file;
  String? filename;

  String? positionselectedvalue;

  var categoryItems = [
    "Water Maintainer",
    "Road Maintainer",
    "Health Maintainer",
    "Electricity Maintainer",
    "Education Maintainer"
  ];

  Future pickImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result == null) {
        return Fluttertoast.showToast(msg: "No file selected");
      }
      File filesss = File(result.files.first.path!);
      setState(() {
        file = filesss;
        hasfile = true;
        filename = result.files.first.name;
      });
    } catch (e) {
      print("Hello: $e");
    }
  }

  uploadFile() async {
    // print("Edeed");

    var formData = FormData.fromMap({
      "name": "${widget.id.name} ${widget.id.lastName}",
      "position": positionselectedvalue,
      "description": descCtrl.value.text,
      "role": roleCtrl.value.text,
      "userid": widget.id.id,
      'file': await MultipartFile.fromFile(file!.path)
      // 'FileName': filename,
      // 'FileToken': guid.v4(),
      // 'FileType': fileType,
      // 'file': await MultipartFile.fromFile(file.path)
    });

    try {
      final url = "/maintainer/createRequest";
      var response = await Api().post(MyConfig.nodeUrl + url, data: formData);
      print("upload: ${response.statusCode}");
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Request sent to Admin");
      } else {}
    } catch (e) {
      print("Helloi: $e");
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Request Form'),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        enabled: false,
                        initialValue: "${widget.id.name} ${widget.id.lastName}",
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Role",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(),
                          ],
                        ),
                        controller: roleCtrl,
                        decoration: InputDecoration(
                          hintText: "Enter Role",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      hasfile
                          ? Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Row(
                                  children: [
                                    Text(
                                      filename!,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            OpenFilex.open(file!.path);
                                          },
                                          icon:
                                              const Icon(Icons.remove_red_eye),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              hasfile = false;
                                            });
                                          },
                                          icon: const Icon(Icons.delete),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () => pickImage(),
                              child: Container(
                                width: 200,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.picture_as_pdf,
                                        color: Colors.blue,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        "Upload Pdf",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                      const SizedBox(
                        height: 20,
                      ),

                      const Text(
                        "Position",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField(
                        isDense: true,
                        decoration: InputDecoration(
                          hintText: "Choose Position",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        value: positionselectedvalue,
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(),
                          ],
                        ),
                        items: categoryItems.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item.toString(),
                                overflow: TextOverflow.ellipsis),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            positionselectedvalue = newValue;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(),
                          ],
                        ),
                        controller: descCtrl,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: "Enter Description",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      //submit elevated button
                      Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                uploadFile();
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 18),
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              )),
        ));
  }
}

Future<File> createFileFromString(String data) async {
  Uint8List bytes = base64.decode(data);
  String dir = (await getTemporaryDirectory()).path;
  File file = File("$dir/aa.pdf");

  await file.writeAsBytes(bytes);

  return file;
}
