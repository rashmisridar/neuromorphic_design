import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  Color baseColor = Color(0xFF242424);
  double firstDepth = 50;
  double secondDepth = 50;
  double thirdDepth = 50;
  double fourthDepth = 50;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(seconds: 5),
    )..addListener(() {
      setState(() {});
    });

    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double stagger(value, progress, delay) {
      progress = progress - (1 - delay);
      if (progress < 0) progress = 0;
      return value * (progress / delay);
    }

    double calculatedFirstDepth =
    stagger(firstDepth, _animationController.value, 0.25);
    double calculatedSecondDepth =
    stagger(secondDepth, _animationController.value, 0.5);
    double calculatedThirdDepth =
    stagger(thirdDepth, _animationController.value, 0.75);
    double calculatedFourthDepth =
    stagger(fourthDepth, _animationController.value, 1);

    return Scaffold(
      backgroundColor: Color(0xFF202427),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClayContainer(
                  child: Icon(Icons.add,color: Colors.white,size: 50,),

                  color: baseColor,
                  height: 100,
                  width: 100,
                  borderRadius: 75,
                  curveType: CurveType.convex,
                ),
                SizedBox(height: 50,),
                ClayContainer(
                  child: Icon(Icons.add,color: Colors.white,size: 50,),

                  color: baseColor,
                  height: 100,
                  width: 100,
                  borderRadius: 75,
                  curveType: CurveType.convex,
                ),
                SizedBox(height: 50),

                ClayContainer(
                  child: Icon(Icons.add,color: Colors.white,size: 50,),
                  color: baseColor,
                  height: 80,
                  width: 80,
                  depth: 20,
                  spread: 8,
                 // customBorderRadius: BorderRadius.circular(0),
                  borderRadius: 100,
                  curveType: CurveType.convex,
                ),

                SizedBox(height: 50),

                ClayContainer(
                  child: Icon(Icons.add,color: Colors.white,size: 50,),
                  color: baseColor,
                  height: 100,
                  width: 100,
                  depth: 20,
                  emboss: false,
                  parentColor: Color(0xFF202427),
                  spread: 20,
                  borderRadius: 100,
                  curveType: CurveType.convex,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}