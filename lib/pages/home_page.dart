import 'package:chat/main_dev.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
  static final TextStyle _optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _textList = <Widget>[
    Text("Home Page", style: _optionStyle),
    Text("Middle Page", style: _optionStyle),
    Text("Last Page", style: _optionStyle),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: Icon(Icons.audiotrack),
        title: Text("Chat Home"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add_alert),
              onPressed: () => _showsnackBar(snackBar))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_textDisplay(_selectedIndex)],
        ),
      ),
      drawer: SampleDrawer(snackBar),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.blueGrey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.two_k_plus),
            title: Text('Middle'),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.three_k),
            title: Text('Last'),
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onBottomNavigationBarItemTapped,
      ),
    );
  }

  void _onBottomNavigationBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Text _textDisplay(int currentIndex) {
    return _textList[currentIndex];
  }

  void _showsnackBar(SnackBar snackBar) {
    scaffoldKey.currentState.showSnackBar(snackBar);
  }
}

class SampleDrawer extends StatelessWidget {
  final List<WordPair> _drawerItemList = [];
  final _biggerFont = TextStyle(fontSize: 18.0);
  final SnackBar _snackBar;

  SampleDrawer(this._snackBar);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: _buildDrawerItems(),
    );
  }

  Widget _buildDrawerItems() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _drawerItemList.length) {
            _drawerItemList.addAll(generateWordPairs().take(10)); /*4*/
          }
          if (index == 0) {
            return DrawerHeader(child: Text("TQ Tech"));
          }
          return _buildRow(_drawerItemList[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      onTap: () => _showItemText(),
    );
  }

  void _showItemText() {
    scaffoldKey.currentState.showSnackBar(_snackBar);
  }
}
