import 'package:flutter/material.dart';
import 'package:turismoapp/widgets/searchBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50), 
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Search(),
          ),
          SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Recomendados",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i < 5; i++)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OtherPage()),
                      );
                    },
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: SizedBox(
                              width: 300, // Tamaño del modal
                              height: 300, // Tamaño del modal
                              child: Image.asset(
                                'assets/images/pexels.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 200,
                      margin: EdgeInsets.all(8),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200,
                              height: 100,
                              child: Image.asset(
                                'assets/images/pexels.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Texto de la tarjeta $i',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Ponma",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Otra página'),
      ),
      body: Center(
        child: Text('Esta es otra página'),
      ),
    );
  }
}
