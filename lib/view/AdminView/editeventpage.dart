// import 'dart:convert';
// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:project/Riverpod/Repository/EventController.dart';
// import 'package:project/view/AdminView/UpdateEventPage.dart';
// import 'package:uuid/uuid.dart';

// import '../../../Riverpod/baseDIo.dart';
// import '../../../Riverpod/config.dart';
// import '../../Riverpod/Models/userModel.dart';

// class EditEventPage extends ConsumerStatefulWidget {
//   EditEventPage({required this.em, super.key});
//   EventModel em;
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _EditEventPageState();
// }

// class _EditEventPageState extends ConsumerState<EditEventPage> {
//   final TextEditingController titlectrl = TextEditingController();
//   final TextEditingController descctrl = TextEditingController();
//   final TextEditingController locctrl = TextEditingController();

//   DateTime date = DateTime.now();
//   bool? hasfile;
//   bool? isc;

//   String? FileName;
//   String? tokenS;
//   String? Type;
//   File? filess;

//   Future pickImage() async {
//     try {
//       FilePickerResult? result =
//           await FilePicker.platform.pickFiles(type: FileType.image);

//       if (result == null) {
//         return Fluttertoast.showToast(msg: "No file selected");
//       }
//       File file = File(result.files.first.path!);
//       setState(() {
//         filess = file;
//         hasfile = true;
//       });
//       var filename = file.path.split("/").last;

//       String fileType = file.uri.toString().split(".").last;
//       const guid = Uuid();
//       const apiurl = "/CmsImage/UploadImageFile";
//       String a = Uri.parse(MyConfig.appUrl + apiurl).toString();
//       var formData = FormData.fromMap({
//         'FileName': filename,
//         'FileToken': guid.v4(),
//         'FileType': fileType,
//         'file': await MultipartFile.fromFile(file.path)
//       });

//       final response = await Api().post(a, data: formData);

//       if (response.statusCode == 200) {
//         var token = json.decode(response.data)["result"]["fileToken"];
//         var message = json.decode(response.data)["result"]["message"];

//         if (token != null) {
//           setState(() {
//             // isChoosed = true;
//             FileName = filename;
//             Type = fileType;
//             tokenS = token;
//           });
//         } else {
//           Fluttertoast.showToast(msg: message);
//         }
//       } else {}
//     } catch (e) {
//       print(e);
//     }
//   }

//   splitString(String str) {
//     var split = str.split(" ");
//     String ss = split[0];
//     var sed = ss.split("-");
//     String sss = sed[0] + "/" + sed[1] + "/" + sed[2];
//     return sss;
//   }

//   uploadFile() async {
//     print(splitString(date.toString()));
//     var data = {
//       "id": widget.em.id,
//       "title": titlectrl.value.text,
//       "shortDescription": descctrl.value.text,
//       "eventMiti": splitString(date.toString()),
//       "eventDate": "2023-03-11T09:53:36.121Z",
//       "imageToken": tokenS,
//       "location": locctrl.value.text
//     };

//     try {
//       var response = await Api().post(MyConfig.eventupload, data: data);
//       print("upload: ${response.statusCode}");
//       if (response.statusCode == 200) {
//         Fluttertoast.showToast(msg: "Event Updated Successfully");
//       } else {}
//     } catch (e) {
//       print("Helloi: $e");
//     }
//     return null;
//   }

//   final formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     super.initState();
//     isc = widget.em.imageBytes == null ? true : false;
//     hasfile = widget.em.imageBytes == null ? false : true;
//     titlectrl.text = widget.em.title;
//     descctrl.text = widget.em.shortDescription;
//     locctrl.text = widget.em.location;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Update Event'),
//         ),
//         body: SingleChildScrollView(
//           child: Form(
//               key: formKey,
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Title",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       TextFormField(
//                         controller: titlectrl,
//                         validator: FormBuilderValidators.compose(
//                             [FormBuilderValidators.required()]),
//                         decoration: InputDecoration(
//                           hintText: "Enter Title",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(0),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Text(
//                         "Description",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       TextFormField(
//                         controller: descctrl,
//                         validator: FormBuilderValidators.compose(
//                             [FormBuilderValidators.required()]),
//                         maxLines: 3,
//                         decoration: InputDecoration(
//                           hintText: "Enter Description",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(0),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Text(
//                         "Location",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       SizedBox(
//                         // width: 200,
//                         child: TextFormField(
//                           controller: locctrl,
//                           validator: FormBuilderValidators.compose(
//                               [FormBuilderValidators.required()]),
//                           decoration: InputDecoration(
//                             hintText: "Enter Location",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       hasfile!
//                           ? SizedBox()
//                           : InkWell(
//                               onTap: () => pickImage(),
//                               child: Container(
//                                 width: 200,
//                                 decoration: BoxDecoration(
//                                     border: Border.all(
//                                         width: 1, color: Colors.grey)),
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 10, vertical: 15),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       const Icon(
//                                         Icons.camera_alt,
//                                         color: Colors.blue,
//                                       ),
//                                       const SizedBox(
//                                         width: 10,
//                                       ),
//                                       const Text(
//                                         "Upload Image",
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                       hasfile!
//                           ? Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                     child: isc!
//                                         ? SizedBox(
//                                             height: 250,
//                                             child: Image.file(
//                                               filess!,
//                                               fit: BoxFit.cover,
//                                             ))
//                                         : Container(
//                                             height: 250,
//                                             decoration: BoxDecoration(
//                                                 image: DecorationImage(
//                                                     image: MemoryImage(
//                                                         base64Decode(widget
//                                                             .em.imageBytes
//                                                             .toString())),
//                                                     fit: BoxFit.fitWidth)),
//                                           )),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 InkWell(
//                                   onTap: () {
//                                     setState(() {
//                                       isc = true;
//                                       hasfile = false;
//                                       tokenS = "";
//                                     });
//                                   },
//                                   child: Row(
//                                     children: [
//                                       Icon(
//                                         Icons.delete,
//                                         color: Colors.red,
//                                       ),
//                                       SizedBox(width: 2),
//                                       Text("Remove",
//                                           style: TextStyle(
//                                               color: Colors.red,
//                                               fontWeight: FontWeight.bold))
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             )
//                           : Container(),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Container(
//                         // height: height * 0.04,
//                         width: double.infinity,
//                         // color: Colors.red,
//                         child: Row(
//                             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Text(
//                                 "Event Date:",
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 15,
//                               ),
//                               Container(
//                                   // height: 40,
//                                   // width: width * 0.4,
//                                   // color: Colors.blue,
//                                   child: Text(
//                                       "${date.year}/${date.month}/${date.day}",
//                                       style: const TextStyle(fontSize: 17))),
//                               Spacer(),
//                               ElevatedButton(
//                                   onPressed: () async {
//                                     DateTime? newDate = await showDatePicker(
//                                         context: context,
//                                         initialDate: date,
//                                         firstDate: DateTime(1900),
//                                         lastDate: DateTime(2400));

//                                     if (newDate == null) return;
//                                     setState(() => date = newDate);
//                                   },
//                                   child: const Text("Choose"))
//                             ]),
//                       ),

//                       const SizedBox(
//                         height: 30,
//                       ),
//                       //submit elevated button
//                       Center(
//                         child: SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               if (formKey.currentState!.validate()) {
//                                 uploadFile();
//                                 ref.refresh(getalleventsProvider);
//                                 Navigator.pop(context);
//                                 Navigator.pop(context);
//                                 Navigator.pushReplacement(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             UpdateEventsPage()));
//                               }
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 60, vertical: 18),
//                               child: const Text(
//                                 "Update Event",
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ]),
//               )),
//         ));
//   }
// }
