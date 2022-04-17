import 'package:flutter/material.dart';
import 'package:kart_oyunu/kolay_bolum.dart';
import 'package:kart_oyunu/zor_bolum.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Hafıza Oyunu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({key,  this.title, int size}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.limeAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("resim/memory.png"),
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: SizedBox(
                width: 200,
                height: 100,
                child: ElevatedButton(
                  child: Text("KOLAY",style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                  ),),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreen,
                    shadowColor: Colors.black,
                    elevation: 40,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),

                    ),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home() ));

                  },
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: ElevatedButton(
                  child: Text("ZOR",style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                  ),),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    shadowColor: Colors.black,
                    elevation: 40,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home2() ));

                  },
                ),
              ),
            ),
          ],
        ),
      ),



    );

  }
}
