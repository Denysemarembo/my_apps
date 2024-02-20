import 'package:flutter/material.dart';
import 'navigation/home.dart';
import 'navigation/calculator.dart';
import 'navigation/about.dart';
import 'navigation/shared.dart';
import 'navigation/login.dart';
import 'navigation/signup.dart';


void main() {
  runApp(const MyApps());
}

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MENU',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const CalculatorScreen(),
    const AboutScreen(),
     SharedPage(),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _widgetOptions.length,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text(''),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        drawer: DrawerWidget(
          onItemSelected: (index) {
            setState(() {
              _selectedIndex = index;
              Navigator.of(context).pop(); // Close the drawer
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'Calculator',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'About',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Shared',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  final Function(int) onItemSelected;

  const DrawerWidget({Key? key, required this.onItemSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              ' Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () => onItemSelected(0),
          ),
          ListTile(
            title: const Text('Calculator'),
            onTap: () => onItemSelected(1),
          ),
          ListTile(
            title: const Text('About'),
            onTap: () => onItemSelected(2),
          ),
          ListTile(
            title: const Text('Shared'),
            onTap: () => onItemSelected(3),
          ),
          ListTile(
            title: const Text('Login'), // Add navigation to LoginScreen
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Signup'), // Add navigation to SignupScreen
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
