import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//void main() => runApp(MyApp());

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
                        color: Color(0xFF473F97),
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
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.amber[400], width: 7),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),

                        margin: EdgeInsets.only(
                            top: 500,
                            left: MediaQuery.of(context).size.width * 0.5 - 120
                        ),

                        child: RaisedButton(
                            color: Colors.amber[50],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/second');
                            },
                            child: Text(
                              'LAUNCH',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent,
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
                        image: AssetImage('lib/assets/bolder.png'),
                        height: 800,
                        width: 210,
                      )
                  ),
                )
              ],
            )
        )
    );
  }
}



//this sets the background colour to be dark grey
Color darkGreyColor = new Color(0XFF212128);


//stateless widgets don't allow for user interaction
class MyScaffold extends StatefulWidget {
  @override
  MyScaffoldState createState() => MyScaffoldState();
}

class Palette {
  static const Color primary = Color(0xFF473F97);
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build (BuildContext context){
    return AppBar(
      centerTitle: true,
      title: Text(
        'Asteroid Tracker',
        style: TextStyle(fontSize: 40.0, color: Color(0xFFFFFFFF)),
      ),
      backgroundColor: Palette.primary,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

//this class builds a custom widget that prints the sliver list to the app body
class CustomWidget extends StatelessWidget {
  CustomWidget(this._index) {
    //debugPrint('initialize: $_index');
  }

  final int _index;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: (_index % 2 != 0) ? Colors.amber[50] : Colors.amber,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      Text(
                        'Closest Approach Date: \n',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        'Name of Asteroid: ',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Time of Closest Approach: ',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Relative Velocity: ',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Miss Distance: ',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.lightbulb_outline, size: 50.0),
                ],
              ),
            ),
          ],
        )
    );
  }
}

class MyScaffoldState extends State<MyScaffold>{
  int selectedIndex = 1; //the selected index keeps track of the icon that has been selected in the navigation bar, setting the index to 1 automatically sets the default selected icon to the middle icon

  //this void class declares the icon that has been selected in the navigation bar, thus changing the state of the item
  void itemSelected(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  /*List<List<dynamic>> data = [];

  loadAsset() async {
    final myData = await rootBundle.loadString('lib/assets/NASA API Web Scraping.csv');
    List<List<dynamic>> csvTable = csv.CsvToListConverter().convert(myData);
  }*/


  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: darkGreyColor, //sets the background to dark grey
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics:  ClampingScrollPhysics(),
        slivers: <Widget>[
          buildHeader(screenHeight), //displays the header extension that holds additional info (looks like the extension of the app bar)
          //buildBody(screenHeight), //prints the body, might be deleted
          SliverList( //SilverList is used for CustomAppBar, unlike ListView it has more capabilities
            delegate: SliverChildListDelegate(
                List.generate(10, (index) => CustomWidget(index)).toList() //calls the CustomWidget class and prints the
            ),
          )
        ],
      ),

      //this tog displays the bottom navigation bar
      bottomNavigationBar: BottomNavigationBar( //add the onPressed function to declare the action that needs to be done when the icons in the navigation bar has been clicked (make a function to declare for onPressed)
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.file_download),
            title: Text('Download'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            title: Text('Statistics'),
          )
        ],
        currentIndex: selectedIndex,
        backgroundColor: Colors.grey[850],
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        onTap: itemSelected,
      ),
    );
  }

  SliverToBoxAdapter buildHeader(double screenHeight){
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Palette.primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Upcoming Asteroids',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  'Track the upcoming asteroids for the next 7 days',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Asteroid Tracker', // used by the OS task switcher
    theme: ThemeData(primaryColor: Colors.grey[900]),
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/second': (context) => MyScaffold(),
    },
    //home: HomePage(),
  ));
}
