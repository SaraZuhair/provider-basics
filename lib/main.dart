import 'package:flutter/material.dart';
import 'package:learn_provider/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProviderExample(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var prv = Provider.of<ProviderExample>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Center(child: Text("Provider Example")),
      ),
      body: Center(
        child: Column(
          children: [
           
           const SizedBox(
              height: 100,
            ),
           
           ClipOval(
            child: Container(

            height: 100,
            width: 100,

            decoration: const BoxDecoration(
            color: Colors.purple,
            ),
               

            child:Center(
              child: Text(
                prv.num.toString(),
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                color: Colors.white),
              ),
            ),
             ),
           ),
           

           const SizedBox(
              height: 100,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
            ElevatedButton(
              style:  ElevatedButton.styleFrom(
                primary: Colors.pink
              ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => const Screen2()));
                },
                child: const Text("New Screen")),

            const SizedBox(
              width: 100,
            ),


              ElevatedButton(
                style:  ElevatedButton.styleFrom(
                primary: Colors.pink
              ),
              onPressed: prv.changenum,
              child: const Text("Increment"),

              )
          ],
            ),
          ],
        ),
      ),
    );
  }
}

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    var prv2 = Provider.of<ProviderExample>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text("Providers"),
      ),
      body: Center(
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,

          decoration: const BoxDecoration(
            color: Colors.purple
          ),
          child: Center(
            child: Text("the number you chose is ${prv2.num.toString()}",
             style:const TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
              color: Colors.white ) ,),
          ),
        ),
        
      ),
    );
  }
}
