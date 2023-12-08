import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  CallScreen({super.key});
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: () {},
              child: Text("Material Button"),
            ),
            //   ElevatedButton(
            //       onPressed: () {
            //         scaffoldKey.currentState!.showBottomSheet(
            //           (context) => Container(
            //             height: 200,
            //             width: double.infinity,
            //             color: Colors.red.withOpacity(0.8),
            //           ),
            //         );
            //       },
            //       child: Text("Bottom Sheet")),
          ],
        ),
      ),
    );
  }
}
