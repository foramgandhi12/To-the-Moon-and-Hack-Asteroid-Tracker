import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart' as csv;
//import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

/*class TableLayout extends StatefulWidget{
  @override
  _TableLayoutState createState() => _TableLayoutState();
}

class _TableLayoutState extends State<TableLayout>{
  List<List<dynamic>> data = [];

  loadAsset() async {
    final myData = await rootBundle.loadString('lib/assets/NASA API Web Scraping.csv');
   // List<List<dynamic>> csvTable = csv.CsvToListConverter().convert(myData);
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Table(
          columnWidths: {
            0: FixedColumnWidth(100.0),
            1: FixedColumnWidth (200.0),
          },
          children: data.map((item) {
            return TableRow(
                children: item.map((row) {
                  return Container(
                    color:
                    row.toString().contains("NA") ? Colors.red : Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        row.toString(),
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  );
                }).toList());
          }).toList(),
        )
      )
    );
  }
}*/



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
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: (_index % 2 != 0) ? Colors.amber[50] : Colors.amber,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      Text(
                        'Date: ',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Name: ',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Distance: ',
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

  List<List<dynamic>> data = [];

  loadAsset() async {
    final myData = await rootBundle.loadString('lib/assets/NASA API Web Scraping.csv');
    List<List<dynamic>> csvTable = csv.CsvToListConverter().convert(myData);
  }


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
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
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
                  'Hello there',
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
                  'hello',
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
    title: 'My app', // used by the OS task switcher
    theme: ThemeData(primaryColor: Colors.grey[900]),
    home: MyScaffold(),
  ));
}
