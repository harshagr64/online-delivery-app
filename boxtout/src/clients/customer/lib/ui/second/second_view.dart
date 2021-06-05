import 'package:customer/ui/second/second_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


// UI code only
class SecondView extends StatelessWidget {
 const SecondView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<SecondViewModel>.reactive(
     builder: (context, model, child) => Scaffold(
       body: Center(
         child: Container(
           color: Colors.red,
           width: 100,
           height: 100,
         ),
       ),
     ),
     viewModelBuilder: () => SecondViewModel(),
   );
 }
}