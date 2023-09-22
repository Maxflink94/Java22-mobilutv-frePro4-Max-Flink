import 'package:flutter/material.dart';
import 'package:fredags_projekt_4/secound_page.dart';
import 'package:fredags_projekt_4/widgets/CustomBottomNavigationBar.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fredagsprojekt 4',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Fredagsprojekt 4'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Navigation bar
  int _selectedIndex = 0;

  Color _backgroundColor = Colors.white;

  //On click sida 2
  void _navigateToPage2() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SecoundPage(),
    ));
  }

  void _changeBackgroundColor() {
    setState(() {
      final random = Random();
      _backgroundColor = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1.0,
      );
    });
  }

  //Main info sida
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Välkommen till FredagsProjekt4 - Flutter"),
            const SizedBox(height: 20),
            FloatingActionButton(
              onPressed: _changeBackgroundColor,
              child: const Text('Färg'),
            ),
          ],
        ),
      ),
      backgroundColor: _backgroundColor,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            if (index == 1) {
              _navigateToPage2();
            }
          });
        },
      ),
    );
  }
}
