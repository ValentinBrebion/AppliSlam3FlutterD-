import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class DeBox extends StatelessWidget {
    DeBox({Key? key, this.faceDe, this.description, this.valeur, this.image}) 
      : super(key: key); 
   final String? faceDe; 
   final String? description; 
   final int? valeur; 
   final String? image; 

   Widget build(BuildContext context) {
      return Container(
         padding: EdgeInsets.all(2), height: 120,  child: Card( 
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:    <Widget>[
                  Image.asset("images/" +image!), Expanded(
                     child: Container(
                        padding: EdgeInsets.all(5), child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                              children: <Widget>[ 
                              
                              Text(this.faceDe!, style: TextStyle(fontWeight: 
                                 FontWeight.bold)), Text(this.description!), 
                              Text("Valeur: " + this.valeur.toString()), 
                           ], 
                        )
                     )
                  )
               ]
            )
         )
      );
   }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Découverte de flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int intValue = 0;
  int _counter = 0;
  int _currentPageIndex = 0;

void randomint(){
  setState(() {
     intValue = Random().nextInt(10);
  });
}

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });

  }

  void _decrementCounter() {
      setState(() {
        _counter--;
      });
      
    }

    void _setCounterzero(){
      setState(() {
        _counter = 0;
      });
    }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: <Widget>[
        Container(

        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          padding: EdgeInsets.only(),
    
          children: <Widget>[
            Image.asset('image/bros.jpg',
            width: 280,
            height: 280,
            fit:BoxFit.scaleDown),

            Image.network("https://cdn.mos.cms.futurecdn.net/aDrjRBLrayuq53z5m8S5zk-970-80.jpg.webp", width:300,height: 300,),

            const Text(
              'Nombre:',
              textAlign: TextAlign.center,
            ),
            Text(
              '$_counter',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
          )
        ),
        Container(
          color:Colors.green,
          alignment: Alignment.center,
          child: Center(
            child: Container(
             child : Column(
              
              children: [
                Center(
             
                child: Text(
                  '$intValue',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                  
                  
                  ),
                ),
              Center( child :
                ElevatedButton(
            
            onPressed: randomint,
            child: const Text('Tapez pour avoir un nombre aléatoire'),
          ),
              ),
                
                
             ],
             )
               
           
          ) ,
          )
          
        ),
        Container(
         
         color: Colors.blue,
         alignment: Alignment.center,
         child:ListView(shrinkWrap: true,padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
         children: <Widget>[
          DeBox(
            faceDe: "1",
            description: "La face 1 du dé",
            valeur: 1,
            image: "../image/face1.png"
          ),
         ],
         )
        ),
        
      ][_currentPageIndex],
      floatingActionButton: Stack(
      children: <Widget>[
        Padding(padding: const EdgeInsets.only(left:31),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: FloatingActionButton(
            onPressed: _decrementCounter,
            child: const Icon(Icons.exposure_minus_1),),
        ),),

        Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: _incrementCounter,
          child: const Icon(Icons.plus_one),),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            onPressed: _setCounterzero,
            child: const Icon(Icons.refresh))
        ),
        
        
      ],
    ),
    bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
        });
        },
        selectedIndex: _currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home_outlined),
            icon: Icon(Icons.home),
            label: "home",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.next_plan_outlined),
            icon: Icon(Icons.next_plan),
            label: "suivant",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.die),
            icon: Icon(Icons.gamepad),
            label: "Liste de dé",
          ),
        ],
      ),


 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
