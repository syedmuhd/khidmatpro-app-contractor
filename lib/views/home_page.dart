import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('KhidmatPro'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Implement your settings functionality here
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 120.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.home_filled),
                    onPressed: () {
                      // Implement the functionality for the home icon here
                    },
                  ),
                  Text('Home'), // Add a text widget for the icon title
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.safety_check),
                    onPressed: () {
                      // Implement the functionality for the home icon here
                    },
                  ),
                  Text('Services'), // Add a text widget for the icon title
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.task_alt_sharp),
                    onPressed: () {
                      // Implement the functionality for the settings icon here
                    },
                  ),
                  Text('Profile'), // Add a text widget for the icon title
                ],
              ),
            ],

          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment Counter',
        child: const Icon(Icons.sos_sharp), // Use a different icon, e.g., Icons.add
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );

  }
}
