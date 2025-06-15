// import 'dart:io';
// import 'dart:math';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:portfolio/constants/supabaseConstants.dart';
// import 'package:portfolio/globals/app_colors.dart';
// import 'package:portfolio/globals/utils.dart';
// import 'package:portfolio/helper%20class/helper_class.dart';
// import 'package:portfolio/responsiveViews/responsiveWidget.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class StorageTestingScreen extends StatefulWidget {
//   const StorageTestingScreen({super.key});

//   @override
//   State<StorageTestingScreen> createState() => _StorageTestingScreenState();
// }

// class _StorageTestingScreenState extends State<StorageTestingScreen> {
//   Uint8List? bytes;
//   String name = "";
//   String extension = "";
//   Random random = Random();
//   final SupabaseClient supabase = Supabase.instance.client;
//   final SupabaseConsts sbconsts = SupabaseConsts();

//   pichFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();

//     if (result != null) {
//       bytes = result.files.first.bytes;
//       name = result.files.first.name;
//       extension = result.files.first.extension ?? "";
//       debugPrint(name);

//       setState(() {});
//     } else {
//       // User canceled the picker
//     }
//   }

//   uploadToSupabaseStorage() async {
//     isLoading = true;
//     setState(() {});
//     // final name = path.split("/").last;
//     try {
//       await supabase.storage.from(sbconsts.portfolioBucket).uploadBinary(
//             "url/$name",
//             bytes!,
//           );
//       url = supabase.storage
//           .from(sbconsts.portfolioBucket)
//           .getPublicUrl("url/$name");
//     } catch (e) {}
//     isLoading = false;
//     setState(() {});
//     debugPrint("url os supabase $url");
//   }

//   String url = "";
//   bool isLoading = false;
//   Widget buttons() {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         button(
//           text: "Pick",
//           onTap: () {
//             pichFile();
//           },
//         ),
//         bytes == null
//             ? const SizedBox()
//             : button(
//                 text: "Upload",
//                 onTap: () {
//                   uploadToSupabaseStorage();
//                 },
//                 child: isLoading
//                     ? const SizedBox(
//                         height: 20,
//                         width: 20,
//                         child: CircularProgressIndicator())
//                     : null),
//         url.isEmpty
//             ? const SizedBox()
//             : button(
//                 text: "Copy",
//                 onTap: () {
//                   Utils.copy(textToCopy: url, messageAfterCopy: "Copied Url");
//                   // pichFile();
//                 },
//               )
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(25.0),
//           child: ResponsiveWidget(
//             mobile: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 imageWidget(),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(child: buttons()),
//                   ],
//                 ),
//               ],
//             ),
//             tablet: Padding(
//               padding: const EdgeInsets.all(28.0),
//               child: Row(
//                 children: [
//                   imageWidget(),
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   Expanded(child: buttons())
//                 ],
//               ),
//             ),
//             destop: ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 600),
//               child: Row(
//                 children: [
//                   imageWidget(),
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   Expanded(child: buttons())
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget button(
//       {required String text, required VoidCallback onTap, Widget? child}) {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: GestureDetector(
//         onTap: onTap,
//         child: Card(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Center(
//                 child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(text),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 child ?? const SizedBox()
//               ],
//             )),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget imageWidget() {
//     return ClipRRect(
//         borderRadius: BorderRadius.circular(15),
//         child: Container(
//           alignment: Alignment.center,
//           height: 200,
//           width: 300,
//           color: Colors.grey.withOpacity(0.3),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text("Pick file"),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(bytes != null ? name : ""),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 extension,
//                 style: const TextStyle(fontSize: 25),
//               ),
//             ],
//           ),
//         ));
//   }
// }
