import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<String> _pageTitles = [
    '9465',
    '9465',
    '9465',
  ];

  final List<Widget> _children = [
    const Center(
      child: Text(
        'Arrofi',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.red,
          fontStyle: FontStyle.italic,
        ),
      ),
    ),
    const Center(
      child: Text(
        'Nama Anda',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.red,
          fontStyle: FontStyle.italic,
        ),
      ),
    ),
    const Center(
      child: Text(
        'Nama Anda',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.red,
          fontStyle: FontStyle.italic,
        ),
      ),
    ),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pageTitles[_currentIndex],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 234, 82, 22),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: _children[_currentIndex],

      // FloatingActionButton seperti screenshot
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          onTabTapped(1); // pindah ke halaman cari
        },
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.search, size: 28),
        label: const Text("Cari"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home Page"),
                onTap: () => onTabTapped(0),
              ),
              ListTile(
                leading: const Icon(Icons.search),
                title: const Text("Search Page"),
                onTap: () => onTabTapped(1),
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text("Login"),
                onTap: () => onTabTapped(2),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation sesuai screenshot
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Tambah",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: "Hapus",
          ),
        ],
      ),
    );
  }
}
