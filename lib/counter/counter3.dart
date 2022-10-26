import 'package:assignment/counter/counter1.dart';
import 'package:assignment/counter/counter2.dart';
import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';



class Counter3App extends StatelessWidget {
  const Counter3App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Counter3HomePage(title: 'Counter 3'),
    );
  }
}

class Counter3HomePage extends StatefulWidget {
  const Counter3HomePage({super.key, required this.title});

  final String title;

  @override
  State<Counter3HomePage> createState() => _Counter3HomePageState();
}
int _counter = 0;
class _Counter3HomePageState extends State<Counter3HomePage> {
  
  int _index = 2;

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
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
             'Your incremented value is:', style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
            const SizedBox(width: 20, height: 40,),
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ]),
            
      const SizedBox(width: 20, height: 40,),
      Row(
      mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Increment me!", style: TextStyle(color: Colors.redAccent, fontSize: 20),),
            const SizedBox(width: 20, height: 40,),
            FloatingActionButton(
              onPressed: _incrementCounter,
              autofocus: true,
              hoverColor: Colors.blue,
              focusColor: Colors.blue,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ), 
          ]),
          ],
        ),
      ),
      
      bottomNavigationBar: FloatingNavbar(
           onTap: (int val) {
            setState(() {
              _index= val;
            });
          
              if(val == 0){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Counter1App()));
              }
              if(val == 1){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Counter2App()));
              }
              if(val == 2){
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
