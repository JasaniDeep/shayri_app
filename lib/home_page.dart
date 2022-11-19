import 'package:flutter/material.dart';
import 'package:shayri_app/modual.dart';
import 'package:shayri_app/second_page.dart';
import 'package:shayri_app/spalesh_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


void main()
{
  runApp(MaterialApp(
    home: splash(),
  ));
}
class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  @override
  void initState() {
    super.initState();
    modual m=new modual();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.white,
        title: DefaultTextStyle(style: TextStyle(fontSize: 20,fontFamily:"f5",color: Colors.white), child: AnimatedTextKit(animatedTexts: [WavyAnimatedText("Love Shayri")
        ],
            isRepeatingAnimation: true,
            repeatForever: true,
        ),
        ),
        backgroundColor: Color(0xFF261615),
        actions: [
          Row(
            children: [
              Container(
                child: Icon(Icons.share,color: Color(0xFFD99559)),margin: EdgeInsets.all(15),
              ),
              Container(
                child: Icon(Icons.more_vert_outlined,color: Color(0xFFD99559)),margin: EdgeInsets.all(15),
              )
            ],
          )
        ],
      ),
      backgroundColor: Color(0xFF595645),
      body: ListView.builder(itemCount:modual().shariname.length,itemBuilder: (context, index) {
        return Card(

          elevation: 7,
          color: Color(0xFFD99559),
          shadowColor: Color(0xFF261615),
          margin: EdgeInsets.all(8),
          child:ListTile(
            hoverColor: Color(0xFFF6B352),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return second(index);
              },));
            },
            title: Text(modual().shariname[index],style: TextStyle(
                color: Color(0xFF261615),fontFamily:"f8",
                fontWeight:FontWeight.bold,fontSize: 20),),
            leading: Container(
              height: 40,
              width: 40,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(modual().img[index]),fit: BoxFit.cover)
              ),
            ),
            trailing: Text(">>",style: TextStyle(color: Color(0xFF000000),fontSize: 27),),
          ),
        );
      },),
    );
  }
}