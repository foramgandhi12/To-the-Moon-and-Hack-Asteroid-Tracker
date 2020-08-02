import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asteroids',
      theme: ThemeData(),
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
    @override
    HomePageState createState() => HomePageState();
}

/// This is the statefull widget that the main application instantiates.
class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 750)
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  Widget build(BuildContext context) {
    return MaterialApp(
        home: new Scaffold(
            body: Stack(
                children: <Widget>[
                  Container(
                      color: Color(0xFF212128)
                  ),
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0,-1),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                      opacity: _animationController,
                      child: Container(
                        padding: EdgeInsets.all(50.0),
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50)),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '''Asteroid 
    Tracker ''',
                              maxLines: 20,
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFE77C4C),
                                letterSpacing: 2.5,
                                fontFamily: 'Galaxy',
                              ),
                            ),
                            Container()
                          ],
                        ),
                      ),
                    ),
                  ),
                  SlideTransition(
                        position: Tween<Offset>(
                        begin: Offset(0,1),
                        end: Offset.zero,
                        ).animate(_animationController),
                    child: FadeTransition(
                      opacity: _animationController,
                      child: Container(
                        height: 100,
                        width: 250,
                        margin: EdgeInsets.only(
                            top: 500,
                            left: MediaQuery.of(context).size.width * 0.5 - 120
                        ),

                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            onPressed: () {},
                            child: Text(
                              'LAUNCH',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFE77C4C),
                                letterSpacing: 2.0,
                                fontFamily: 'Galaxy',
                              ),

                            )
                        )
                    ),
                    ),
                  ),
                   AnimatedBuilder(
                     animation: _animationController.view,
                      builder: (context, child) {
                       return Transform.scale(scale: _animationController.value , child: child,) ;
                      },
                      child: Container(
                         alignment: Alignment.center,
                          child: Image(
                         image: AssetImage('assets/bolder.png'),
                         height: 800,
                         width: 150,
                       )
                  ),
                   )
                ],
            )
        )
    );
  }
}




