import 'dart:ui';

import 'package:assignment/counter/counter2.dart';
import 'package:assignment/counter/counter3.dart';
import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';


class Counter1App extends StatelessWidget {
  const Counter1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Counter1HomePage(title: 'Counter 1'),
    );
  }
}

class Counter1HomePage extends StatefulWidget {
  
  const Counter1HomePage({super.key, required this.title});

  final String title;

  @override
  State<Counter1HomePage> createState() => _Counter1HomePageState();
}
 int _counter = 0;
class _Counter1HomePageState extends State<Counter1HomePage> {
 
  int _index = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
       title: Text(widget.title),
      ),
      
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your incremented value is:',style: TextStyle(fontSize: 18, backgroundColor: Colors.amberAccent),
            ),
            const SizedBox(width: 20, height: 10,),
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
            ),
             const SizedBox(width: 20, height: 40,),
             const Text("Increment me!", style: TextStyle(fontSize: 18, backgroundColor: Colors.cyan),),
             const SizedBox(width: 20, height: 10,),
            FloatingActionButton(
              onPressed: _incrementCounter,
              autofocus: true,
              hoverColor: Colors.blue,
              focusColor: Colors.blue,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
      ), 
          
          ],
        ),
      ),
      
      bottomNavigationBar: FloatingNavbar(
           onTap: (int val) {
            setState(() {
              _index= val;
            });
          
              if(_index == 0){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Counter1App()));
              }
              if(_index == 1){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Counter2App()));
              }
              if(_index == 2){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Counter3App()));
              }
            
            },
            currentIndex: _index,
            backgroundColor: Colors.green,
            items: [
          
              FloatingNavbarItem(icon: Icons.home, title: 'Counter 1', ),
              FloatingNavbarItem(icon: Icons.chat, title: 'Counter 2'),
              FloatingNavbarItem(icon: Icons.chat_bubble_outline, title: 'Counter 3'),
              
            ],
          ), 
    );
  }
}
