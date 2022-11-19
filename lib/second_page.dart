import 'package:flutter/material.dart';
import 'package:shayri_app/modual.dart';
import 'package:shayri_app/third_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class second extends StatefulWidget {

  int index;
  second(this.index);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  List<String> l=[];

  @override
  void initState() {
    super.initState();
    // modual m=new modual();

    if(widget.index==0)
      {
        l=modual().inspiration_shayri;
      }
    else if(widget.index==1)
      {
        l=modual().life_shayri;
      }
    else if(widget.index==2)
      {
        l=modual().Love_Shayri;
      }
    else if(widget.index==3)
      {
        l=modual().Remember_Shayri;
      }
    else if(widget.index==4)
      {
        l=modual().Political_Shayri;
      }

  }


  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(

        title: Text(modual().shariname[widget.index],style: TextStyle(fontFamily:"f8",color: Color(0xFFffffff),fontSize: 25),),
        backgroundColor: Color(0xFF261615),
      ),
      backgroundColor: Color(0xFF8c6338),
      body: AnimationLimiter(child: ListView.builder
        ( padding: EdgeInsets.all(_w / 30),
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: l.length,
          itemBuilder: (context, index,) {
            return AnimationConfiguration.staggeredList(
              position: index,
              delay: Duration(milliseconds: 200),
              child: SlideAnimation(
                duration: Duration(milliseconds: 3500),
                curve: Curves.fastLinearToSlowEaseIn,
                horizontalOffset: -300,
                verticalOffset: -850,
                child: Container(
                  margin: EdgeInsets.only(bottom: _w / 20),
                  height: _w / 5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFD96941),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 40,
                        spreadRadius: 10,
                      ),
                    ],
                  ),

                  child: ListTile(
                    hoverColor: Color(0xFFF6B352),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return third(index,l);
                      },));
                    },
                    title: Text(l[index],maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(
                        color: Color(0xFF261615),fontWeight:FontWeight.bold,fontFamily:"f8",
                        fontSize: 20),
                    ),
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage(modual().img[widget.index]),fit: BoxFit.cover)
                      ),
                    ),
                  // ),
                ),
              ),
              )
            );
        },),
      )
    );
  }
}
