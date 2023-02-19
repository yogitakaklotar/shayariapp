import 'package:clipboard/clipboard.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
class FacPage extends StatefulWidget {
  const FacPage({Key? key}) : super(key: key);
  static List favShayari = [];

  @override
  State<FacPage> createState() => _FacPageState();
}

class _FacPageState extends State<FacPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      color: Colors.purple,
      child: ListView.builder(
        itemCount: FacPage.favShayari.length,
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
                    child: Center(child: Text("${FacPage.favShayari[index1]}")),
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
                                      '${FacPage.favShayari[index1]}')
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
                                //   await flutterTts.speak("${FacPage.favShayari[index1]}");
                                //   await flutterTts.setLanguage("hi-IN");
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
                                FacPage.favShayari.add(FacPage.favShayari[index1]);
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
                                  Share.share( '${FacPage.favShayari[index1]}');
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
    ),);
  }
}
