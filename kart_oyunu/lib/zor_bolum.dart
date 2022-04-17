import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:kart_oyunu/main.dart';

int level = 0;

class Home2 extends StatefulWidget {
  final int size;

  const Home2({key, this.size = 36}) : super(key: key);
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  List<GlobalKey<FlipCardState>> cardStateKeys = [];
  List<bool> cardFlips = [];
  List<String> veri = [];
  int previousIndex = -1;
  bool flip = false;

  int adimsayi = 0;
  int skor = 0;
  int zaman = 0;
  Timer timer;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.size; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
      cardFlips.add(true);
    }
    for (var i = 0; i < widget.size ~/ 2; i++) {
      veri.add(i.toString());
    }
    for (var i = 0; i < widget.size ~/ 2; i++) {
      veri.add(i.toString());
    }
    startTimer();
    veri.shuffle();
  }

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        zaman = zaman + 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Hamle Sayısı: $adimsayi  Skor: $skor  Süre: $zaman",

                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              Theme(
                data: ThemeData.dark(),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                    ),
                    itemBuilder: (context, index) => FlipCard(
                      key: cardStateKeys[index],
                      onFlip: () {
                        if (!flip) {
                          flip = true;
                           adimsayi += 1;
                          previousIndex = index;
                        } else {
                          flip = false;
                          skor -= 1;
                          if (previousIndex != index) {
                            if (veri[previousIndex] != veri[index]) {
                              cardStateKeys[previousIndex]
                                  .currentState
                                  ?.toggleCard();
                              previousIndex = index;
                            } else {
                              cardFlips[previousIndex] = false;
                              skor += 10;
                              cardFlips[index] = false;
                              print(cardFlips);

                              if (cardFlips.every((t) => t == false)) {
                                print("basarili");
                                showResult();
                              }
                            }
                          }
                        }
                      },
                      direction: FlipDirection.HORIZONTAL,
                      flipOnTouch: cardFlips[index],
                      front: Container(
                        margin: EdgeInsets.all(4.0),
                        color: Colors.brown.withOpacity(0.3),
                      ),
                      back: Container(
                        margin: EdgeInsets.all(4.0),
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            "${veri[index]}",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                      ),
                    ),
                    itemCount: veri.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text("KAZANDINIZ!"),
        content: Text(
          "Skor: $skor  Süre:$zaman",
          style: Theme.of(context).textTheme.headline3,
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage() ));

            },
            child: Text("Anasayfaya Dön."),
          ),
        ],
      ),
    );
  }
}