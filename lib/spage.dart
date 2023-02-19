import 'package:allshayari/ModelClass.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';
import 'package:allshayari/fv_shayari.dart';
class spage extends StatefulWidget {
  List shayari;
  int index;

  @override
  State<spage> createState() => _spageState();

  spage(this.shayari, this.index);
}

class _spageState extends State<spage> {
  List allShayari = [];
  List favList =[];
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    if (widget.index == 0) {
      allShayari = ModelClass.birthdayshayari;
    }
    if (widget.index == 1) {
      allShayari = ModelClass.attitudeshayari;
    }
    if (widget.index == 2) {
      allShayari = ModelClass.Aloneshayari;
    }
    if (widget.index == 3) {
      allShayari = ModelClass.bewafashayari;
    }
    if (widget.index == 4) {
      allShayari = ModelClass.dilshayari;
    }
    favList=List.filled(allShayari.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("${widget.shayari[widget.index]}"),
          actions: [IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FacPage();
            },));
          }, icon: Icon(MdiIcons.heart))]),
      body: Container(
        color: Colors.purple,
        child: ListView.builder(
          itemCount: allShayari.length,
          itemBuilder: (context, index1) {
            return Container(
              margin: EdgeInsets.all(15),
              height: 200,
              width: double.infinity,
              child: Column(children: [
                Expanded(
                    flex: 6,
                    child: Container(
                      width: double.infinity,
                      child: Center(child: Text("${allShayari[index1]}")),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5))),
                      // color: Colors.white,
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Row(children: [
                        Expanded(
                          child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.purple),
                              child: IconButton(
                                  onPressed: () {
                                    FlutterClipboard.copy(
                                            '${allShayari[index1]}')
                                        .then((value) {
                                      Fluttertoast.showToast(
                                          msg: "copied",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    });
                                  },
                                  icon: Icon(Icons.copy))),
                        ),
                        Expanded(
                          child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.purple, shape: BoxShape.circle),
                              child: IconButton(
                                  onPressed: () async {
                                    print("sf");
                                    await flutterTts.speak("${allShayari[index1]}");
                                    await flutterTts.setLanguage("hi-IN");
                                  },
                                  icon: Icon(Icons.play_arrow))),
                        ),
                        Expanded(
                          child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.purple, shape: BoxShape.circle),
                              child:  FavoriteButton(
                                iconSize: 30,
                                isFavorite: false,
                                // iconDisabledColor: Colors.white,
                                valueChanged: (_isFavorite) {
                                  setState(() {
                                    FacPage.favShayari.add(allShayari[index1]);
                                  });
                                  print('Is Favorite : $_isFavorite');
                                },
                              ),
                              // child: IconButton(
                              //     onPressed: () {},
                              //     icon: Icon(MdiIcons.heartOutline))
                          ),
                        ),
                        Expanded(
                          child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.purple, shape: BoxShape.circle),
                              child: IconButton(
                                  onPressed: () {
                                    Share.share( '${allShayari[index1]}');
                                  }, icon: Icon(Icons.share))),
                        )
                      ]),
                      decoration: BoxDecoration(
                          color: Colors.purpleAccent,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5))),
                      // color: Colors.purpleAccent,
                    ))
              ]),
            );
          },
        ),
      ),
    );
  }
}
