import 'package:flutter/material.dart';
import 'package:fredags_projekt_4/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fredags_projekt_4/widgets/CustomBottomNavigationBar.dart';

class SecoundPage extends StatefulWidget {
  const SecoundPage({super.key});

  @override
  _SecoundPageState createState() => _SecoundPageState();
}

class _SecoundPageState extends State<SecoundPage> {
  String dogImgUrl = '';

  Future<void> fetchRandomDogImg() async {
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final imgUrl = data['message'];

      setState(() {
        dogImgUrl = imgUrl;
      });
    } else {
      throw Exception('Misslyckades med att hämta bild');
    }
  }

  void _navigateToPage1() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const MyHomePage(title: ""),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sida 2'),
      ),
      body: Scrollbar(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: fetchRandomDogImg,
                child: const Text('Hämta en random hundbild'),
              ),
              if (dogImgUrl.isNotEmpty) Image.network(dogImgUrl)
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 1,
          onTap: (index) {
            setState(() {
              if (index == 0) {
                _navigateToPage1();
              }
            });
          }),
    );
  }
}
