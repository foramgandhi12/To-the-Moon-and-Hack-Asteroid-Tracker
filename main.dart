import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//stateless widgets don't allow for user interaction
class MyScaffold extends StatefulWidget {
  @override
  MyScaffoldState createState() => MyScaffoldState();
}

class Palette {
  static const Color primary = Color(0XFF1E88E5);
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build (BuildContext context){
    return AppBar(
      centerTitle: true,
      title: Text(
        'Asteroid Tracker',
        style: TextStyle(fontSize: 40.0),
      ),
      backgroundColor: Palette.primary,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class MyScaffoldState extends State<MyScaffold>{
  int selectedIndex = 1; //the selected index keeps track of the icon that has been selected in the navigation bar, setting the index to 1 automatically sets the default selected icon to the middle icon

  //this void class declares the icon that has been selected in the navigation bar, thus changing the state of the item
  void itemSelected(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  //currently the list is not being displayed
  final List<String> entries = <String>['A', 'B', 'C'];
  Widget buildList(){
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index){
        return Container(
          height: 80,
          decoration: new BoxDecoration(
            borderRadius:
            BorderRadius.all(Radius.circular(10)),
            color: Colors.lightBlueAccent[100],
          ),
          child: Center(child: Text('Entry ${entries[index]}')), //right now it
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics:  ClampingScrollPhysics(),
        slivers: <Widget>[
          buildHeader(screenHeight),
          buildBody(screenHeight),
          SliverList( //SilverList is used for CustomAppBar, unlike ListView it has more capabilities
            delegate: SliverChildListDelegate(
                [
                  Container(color: Colors.red, height: 150.0),
                  Container(color: Colors.purple, height: 150.0),
                  Container(color: Colors.green, height: 150.0),
                ]
            ),
          )
        ],
      ),

      //this tog displays the bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          )
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.deepOrangeAccent,
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

  SliverToBoxAdapter buildBody(double screenHeight){
    return SliverToBoxAdapter(
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0), //moves the container lower as vertical value goes up
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                      children: <Widget>[
                        Text(
                          'Date: ',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Name: ',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Distance: ',
                          textAlign: TextAlign.left,
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
              Container(
                height: 100,
                child: const  Text(
                  'Entry B',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 100,
                child: const Text(
                  'Entry C',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
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
