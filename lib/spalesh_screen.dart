import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shayri_app/home_page.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    abc();

  }
  abc()
  async {

    var status = await Permission.storage.status;
    if(status.isDenied)
      {
        await [Permission.storage].request();
      }
   await Future.delayed(Duration(seconds: 3));

   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
     return demo();
   },));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF595645),
      body: Column(
        children: [
          Expanded(child:Center(
            child:  Container(
              height: 100,
              width: 100,

              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage("zxc/logo.jpg"),fit: BoxFit.cover)
              ),
            ),
          )),
          Container(
            height: 100,
            width: double.infinity,
            child: Text("Loading..",style: TextStyle(fontFamily: "f5",fontWeight:FontWeight.bold,fontSize: 30,color:Color(0xFFFFFFFF)),textAlign: TextAlign.center,),
          )
        ],
      )
    );
  }
}


