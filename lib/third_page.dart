import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayri_app/fourth_page.dart';
import 'package:toast/toast.dart';


class third extends StatefulWidget {
  int index;
  List<String> l=[];
  //String select="";
  third(this.index,this.l);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  PageController jd =new PageController();
  @override
  void initState() {
    super.initState();
     jd = PageController(initialPage: widget.index);
  }
  int cou=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text("Shayri",style: TextStyle(fontFamily: "f8",color: Color(0xFFffffff),fontSize: 25),),
      backgroundColor: Color(0xFF261615),

        ),
        body: SafeArea(child: Row(
            children: [
              Expanded(child: Container(
                  height: 1000,
                  width: double.infinity,
                  color: Color(0xFFD99669),
                  child: Column(
                    children: [
                      Expanded(child: Column(
                        children: [
                          Expanded(flex: 2, child:
                          Container(
                              margin: EdgeInsets.all(10),
                              color: Color(0xFF595645),
                              child: Row(
                                children: [
                                  Expanded(flex: 5,
                                    child: Container(
                                      // margin: EdgeInsets.only(left: 130),
                                      child: InkWell(
                                        onTap: () {
                                        },
                                        child: IconButton(onPressed: () {},
                                            icon: Icon(Icons.open_with_rounded,
                                              color: Colors.black),alignment: Alignment.centerRight,),
                                      ),
                                      // child:
                                    ),
                                  ),
                                  Expanded(flex: 3, child: Container(
                                    // margin: EdgeInsets.only(left: 30),
                                    child: Text(
                                      "${widget.index + 1}/${widget.l.length}",
                                      style: TextStyle(fontSize: 20,
                                          color: Colors.black),textAlign: TextAlign.center,),
                                  )),
                                  Expanded(flex: 5,
                                    child: Container(
                                      // margin: EdgeInsets.only(right: 150),

                                      child: InkWell(
                                        onTap: () {

                                        },
                                        child: IconButton(onPressed: () {},
                                            icon: Icon(Icons.cached_rounded,
                                              color: Colors.black),alignment: Alignment.centerLeft,),
                                      ),
                                      // child:
                                    ),
                                  )
                                ],

                              )
                          )),
                          Container(
                            height: 480,
                            width: 330,
                            alignment: Alignment.center,
                            child: PageView.builder(
                                      itemCount: widget.l.length,
                                      controller: jd,
                                      onPageChanged: (value){
                                        print(value);
                                        setState((){
                                          widget.index=value;
                                          // cou+
                                        });
                                      },
                                      itemBuilder: (context, index) {
                                        return Container(
                                          alignment: Alignment.center,
                                          color: Color(0xFFD99669),
                                          child: Container(
                                            color:Color(0xFF595645),
                                            margin: EdgeInsets.fromLTRB(7, 0, 7, 0),
                                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                            child:Text(widget.l[widget.index],style: TextStyle(color:Color(
                                                0xFF000000),fontFamily: "f8",fontSize: 25,fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,),
                                          ),
                                        );
                                      },
                            ),
                          ),

                          Expanded(flex: 2, child:
                          Container(
                            color: Color(0xFF595645),
                            margin: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(onPressed: () {
                                  FlutterClipboard.copy(widget.l[widget.index])
                                      .then((value) =>
                                      Toast.show(
                                        "copid", duration: Toast.lengthShort,
                                        gravity: Toast.center,)
                                  );
                                }, icon: Icon(Icons.copy)),
                                IconButton(onPressed: () {
                                  if (widget.index != 0) {
                                    widget.index--;
                                    setState(() {});
                                  }
                                  else {
                                    widget.index = widget.l.length - 1;
                                    setState(() {});
                                  }

                                }, icon: Icon(Icons.arrow_back_ios_outlined)),
                                IconButton(onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return forth(widget.l,widget.index);
                                      },));
                                }, icon: Icon(Icons.edit_off)),
                                IconButton(onPressed: () {
                                  if (widget.index < widget.l.length - 1) {
                                    widget.index++;
                                    setState(() {});
                                  }
                                  else {
                                    widget.index = 0;
                                    setState(() {});
                                  }
                                }, icon: Icon(Icons.arrow_forward_ios)),
                                IconButton(onPressed: () {
                                  Share.share(widget.l[widget.index]);
                                }, icon: Icon(Icons.share)),
                              ],
                            ),
                          ))
                        ],
                      ))
                    ],
                  )
              ))
            ]
        )
        )
    );
  }


}

