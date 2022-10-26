import 'package:assignment/counter/counter1.dart';
import 'package:assignment/counter/counter3.dart';
import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';


class Counter2App extends StatelessWidget {
  const Counter2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Counter2HomePage(title: 'Counter 2'),
    );
  }
}

class Counter2HomePage extends StatefulWidget {
  const Counter2HomePage({super.key, required this.title});

  final String title;

  @override
  State<Counter2HomePage> createState() => _Counter2HomePageState();
}
 int _counter = 0;
class _Counter2HomePageState extends State<Counter2HomePage> {
 
  int _index = 1;

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
              'Your incremented value is:',style: TextStyle(fontSize: 22, backgroundColor: Colors.deepOrange)
            ),
            const SizedBox(width: 20, height: 10,),
             Text(
              '$_counter',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 20, height: 40,),
            ElevatedButton(
              onPressed: _incrementCounter,
              // tooltip: 'Increment',
              child: Container(child: const Text("Increment me!")),
      ), 
          
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
