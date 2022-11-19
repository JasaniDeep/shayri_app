import 'dart:io';

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class forth extends StatefulWidget {
  List<String> l;
  int index;
  forth(this.l, this.index);



  @override
  State<forth> createState() => _forthState();
}

class _forthState extends State<forth> {
  List<Color> bgcol=[Colors.black,
  Colors.pink,
  Colors.red,
  Colors.white,
  Colors.orange,
  Colors.deepOrange,
  Colors.blue,
  Colors.greenAccent,
  Colors.teal,
  Colors.tealAccent,
  Colors.cyan,
  Colors.amber,
  Colors.yellowAccent,
  Colors.white10];
  Color co=Color(0xFF595645);
  
  Color bg=Colors.black;
  double size=30;


  List<List<Color>> grad= [
    [Color(0xFF6f0000), Color(0xFF6f0000), Color(0xFF200122)],
    [Color(0xFFF56217), Color(0xFF0B486B), Color(0xFF0B486B)],
    [Color(0xFFffffff), Color(0xFF076585), Color(0xFF076585)],
    [Color(0xFF283048), Color(0xFF283048), Color(0xFF859398)],
    [Color(0xFF1F1C18), Color(0xFF8E0E00), Color(0xFFf3aa94)]
  ];
  List<Color> gr=[Color(0xFF6f0000), Color(0xFF6f0000), Color(0xFF6f0000)];

  List fontlist=["f1","f2","f3","f4","f5","f6","f7","f8"];
  String currentfont="f8";

  List<String> emoji=["😍 🥰 8😘 😗 😙 😚","😛 😝 😜 🤪 🤨 🧐","😀 😃 😄 😁 😆 😅","🙂 🙃 😉 😌 😍 🥰"];
  String em="";
   bool se=true;
  int count=0;

  // String imagestore="";
  String folderpath="";

  GlobalKey _globalKey = new GlobalKey();
  Future<Uint8List> _capturePng() async {
    var pngBytes;
    try {
      print('inside');
      RenderRepaintBoundary boundary = _globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
       pngBytes = byteData!.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      setState(() {});

    } catch (e) {
      print(e);
    }
    return pngBytes;
  }

  @override
  void initState() {
    super.initState();
    createFolder();
  }
  createFolder() async
  {
    // Directory dir = Directory((Platform.isAndroid
    //     ? await getExternalStorageDirectory() //FOR ANDROID
    //         : await getApplicationSupportDirectory() //FOR IOS
    // )!
    //     .path + "/shayri");
    var path = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS)
        +"/shyri 2022";
    Directory dir=Directory(path);
    if(await dir.exists())
      {
        print("Alredi Created");
      }
    else
      {
        await dir.create();
        print("Crate");
        print(dir.path);
      }
    folderpath=dir.path;
  }

  @override
  Widget build(BuildContext context) {
    gr=grad[count];

    return Scaffold(
        appBar: AppBar(
              title: Text("Shayri",style: TextStyle(fontFamily: "f8",color: Color(0xFFffffff),fontSize: 25),),
              backgroundColor: Color(0xFF261615),
          ),
      backgroundColor:  Color(0xFFD99669),
      body: SafeArea(child:
      Column(
        children: [
          Expanded(flex: 5,child:SingleChildScrollView
            (child:Center(child:
              RepaintBoundary(
                key: _globalKey,
                child: Container(
                  // width: double.infinity,
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  decoration: se ? BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: co
                  ) : BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: gr),
                  ),

                  child: Text("${em} \n ${widget.l[widget.index]} \n ${em}",
                      style: TextStyle(fontSize: size,fontWeight:FontWeight.bold,color: bg,fontFamily: currentfont),
                      textAlign: TextAlign.center),
                ),
              )
          )

            )
            ,),
          Expanded(flex:2,child: Container(

            color:  Color(0xFF8C6338),
            child: Column(
              children: [
                Expanded(child: Container(

                  margin: EdgeInsets.only(left: 100,right: 100),
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: () {
                        setState((){
                          if(count<=gr.length) {
                            gr = grad[count];
                          }
                          else
                            {
                              count=0;
                            }
                          count++;
                        });
                      }, icon: Icon(Icons.autorenew_rounded,size: 30)),
                      IconButton(onPressed: () {
                        showModalBottomSheet(isScrollControlled:true,builder: (context) {
                          return Container(
                            height: 450,
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            color: Colors.black,
                            child: GridView.builder(itemCount:grad.length,itemBuilder:  (context, index) {
                              return InkWell(
                                onTap: (){
                                  se=false;
                                  setState((){
                                     count=index;
                                    gr=grad[index];
                                  });
                                },
                                child: Container(
                                  height: 100,
                                    width: 100,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: grad[index])
                                  ),
                                ),
                              );
                            },gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                              mainAxisSpacing: 10
                            ) ),
                          );
                        },context: context, );
                      }, icon: Icon(Icons.zoom_out_map,size: 30))
                    ],
                  ),
                )),
                Expanded(flex:3,child: Column(
                  children: [
                    Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(onPressed: () {
                          showModalBottomSheet(barrierColor: Colors.transparent,
                              builder: (context) {
                                return Container(
                                  height: 200,
                                    color: Colors.black,
                                    padding: EdgeInsets.fromLTRB(10,10 , 10, 0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(child: GridView.builder(itemCount:bgcol.length,itemBuilder: (context, index) {
                                        return InkWell(
                                          child: Container(

                                            color: bgcol[index],
                                          ),onTap: (){
                                            se=true;
                                          setState((){
                                            co=bgcol[index];
                                          });
                                        },
                                        );
                                      },gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7,
                                          childAspectRatio: 1,
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 10) ),
                                      ),
                                      IconButton(onPressed: () {
                                        Navigator.pop(context);
                                      }, icon: Icon(Icons.close))
                                    ],
                                  )
                                );

                          },context: context);

                        }, child: Text("Background"),style: ElevatedButton.styleFrom(primary: Color(0xFF261615)),),
                        ElevatedButton(onPressed: () {
                                showDialog(builder:(context){
                                  return AlertDialog(
                                    content: ColorPicker(onColorChanged: (value) {

                                      setState((){
                                        bg=value;
                                      });
                                    },pickerColor: bg ),
                                  );
                                },context: context,);
                        }, child: Text(" FontColor "),style: ElevatedButton.styleFrom(primary: Color(0xFF261615))),
                        ElevatedButton(onPressed: () {
                          DateTime dt=DateTime.now();

                          String imgname="${dt.year.toString()}${dt.month.toString()}${dt.toString()}${dt.day.toString()}${dt.hour.toString()}${dt.minute.toString()}${dt.second.toString()}${dt.millisecond.toString()}}";

                          print(dt.year.toString() + ":" + dt.month.toString() + ":" + dt.day.toString() + ":" + dt.hour.toString() + ":" + dt.minute.toString() + ":" + dt.second.toString() + ":" + dt.millisecond.toString() );

                          String imgpath = "${folderpath}/Image_${imgname}.jpg";

                          File file=File(imgpath);
                              file.create().then((value)
                              {
                                print(value.path);
                                _capturePng().then((value)
                                {
                                    file.writeAsBytes(value).then((value){
                                      print("File share");
                                      Share.shareFiles(['${value.path}']);
                                    });
                                });
                              });
                        }, child: Text("      Share     "),style: ElevatedButton.styleFrom(primary: Color(0xFF261615))),
                      ],
                    )),
                    Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: () {
                          showModalBottomSheet(barrierColor:Colors.transparent,builder:(context) {
                            return Container(
                              height: 200,
                              width: 200,
                                color: Colors.black,

                              child: ListView.builder(scrollDirection:Axis.horizontal,itemCount: fontlist.length,itemBuilder: (context, index) {

                                return InkWell(
                                  onTap: (){
                                    setState((){
                                      currentfont=fontlist[index];
                                    });

                                  },
                                    child:Container(
                                  height: 50,
                                  width: 100,
                                  color: Color(0xFF595645),

                                  margin: EdgeInsets.all(5),
                                  alignment: Alignment.center,
                                  child: Text("Font",style: TextStyle(fontFamily: fontlist[index],fontSize: 30),textAlign: TextAlign.center,),
                                ));
                              },)
                            );

                          },context: context);
                        }, child: Text("        Font      "),style: ElevatedButton.styleFrom(primary: Color(0xFF261615))),
                        ElevatedButton(onPressed: () {
                          showModalBottomSheet(builder: (context) {
                            return Container(
                              height: 150,
                              color: Colors.orangeAccent,
                              child: ListView.builder(itemCount: emoji.length,itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState((){
                                      em=emoji[index];
                                    });
                                  },
                                  child: Container(
                                   height: 50,
                                    color: Colors.black,
                                   margin: EdgeInsets.all(5),
                                   child: Center(
                                     child: Text(emoji[index]) ,
                                   ),
                                  ),
                                );
                              },),
                            );
                          },context: context );
                          }, child: Text("    Emoji      "),style: ElevatedButton.styleFrom(primary: Color(0xFF261615))),
                        ElevatedButton(onPressed: () {
                            showModalBottomSheet(builder: (context) {
                              return SingleChildScrollView(
                                child: Container(
                                  height: 170,
                                  color: Colors.transparent,
                                  child: StatefulBuilder(builder: (context, setState1) {
                                    return Slider(max:50,min:10,onChanged: (value) {
                                      size=value;
                                        setState1((){
                                      });
                                       setState((){
                                      });
                                    },value: size);
                                  },),
                                ),
                              );
                            },context: context);
                        }, child: Text("   Text Size"),style: ElevatedButton.styleFrom(primary: Color(0xFF261615))),
                      ],
                    ))
                  ],
                ))
              ],
            ),
          ))
        ],
      ),
      )
    );
  }
}
