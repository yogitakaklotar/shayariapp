import 'package:flutter/material.dart';
import 'package:allshayari/spage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
void main() {
  runApp(MaterialApp(
    home: fpage(),
    debugShowCheckedModeBanner: false,
  ));
}

class fpage extends StatefulWidget {
  const fpage({Key? key}) : super(key: key);

  @override
  State<fpage> createState() => _fpageState();
}

class _fpageState extends State<fpage> {
  List shayari = [
    "birthday shayari",
    "attitude shayari",
    "Alone shayari",
    "befawa shayari",
    "Dil shayari"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple,leading: Icon(Icons.close),title: Text("All shayari"), actions: [
        // Expanded(child: IconButton(onPressed: () {}, icon: Icon(Icons.close))),
        // Expanded(
        //     flex: 3,
        //     child: Container(
        //         alignment: Alignment.centerLeft,
        //         child: Text(
        //           "All shayari",
        //           style: TextStyle(fontSize: 20),
        //         ))),
        IconButton(onPressed: () {}, icon: Icon(MdiIcons.heart)),
        IconButton(onPressed: () {}, icon: Icon(Icons.settings))
      ]),
      body: Container(
        color: Colors.purple,
        child: ListView.builder(
          itemCount: shayari.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Card(
                  elevation: 30,
                  color: Colors.purpleAccent,
                  shadowColor: Colors.black,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return spage(shayari,index);
                      },));
                    },
                    leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 40,
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("images/p1${index + 1}.jpg"),
                          radius: 25,
                        )),
                    trailing: Icon(Icons.arrow_right,color: Colors.white),
                    shape: RoundedRectangleBorder(),
                    title: Text("${shayari[index]}",style: TextStyle(color: Colors.white)),
                  )),
            );
          },
        ),
      ),
    );
  }
}
