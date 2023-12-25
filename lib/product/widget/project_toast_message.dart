// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

// /// Project Toast message manager class
// class ProjectToastMessage extends StatefulWidget {
//   ///
//   const ProjectToastMessage({super.key});

//   @override
//   State<ProjectToastMessage> createState() => _ProjectToastMessageState();
// }

// class _ProjectToastMessageState extends BaseState<ProjectToastMessage> {
//   FToast fToast = FToast();
//   @override
//   void initState() {
//     fToast.init(productViewModel.state.navigatorKey.currentContext!);

//     super.initState();
//   }

//   Widget toast = Container(
//     padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(25.0),
//       color: Colors.greenAccent,
//     ),
//     child: Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(Icons.check),
//         SizedBox(
//           width: 12.0,
//         ),
//         Text("This is a Custom Toast"),
//       ],
//     ),
//   );

//   _showToast() {
//     fToast.showToast(
//       child: toast,
//       gravity: ToastGravity.BOTTOM,
//       toastDuration: Duration(seconds: 2),
//     );
//   }


// }
