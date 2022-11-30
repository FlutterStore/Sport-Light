import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FeatureDiscovery(
      recordStepsInSharedPreferences: false,
      child : MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    FeatureDiscovery.discoverFeatures(context,
        <String>[
          'feature1',
          'feature2',
          'feature3',
        ]
      );});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text("Sport Light",style: TextStyle(fontSize: 15),),
        leading: DescribedFeatureOverlay(
          featureId: "feature2",
          title: const Text("Drawer"),
          description:  const Text("Share our app, read policy, rate us, boost our enthusiasm by giving us reviews, give us suggestions, check out our other apps.",),
          backgroundColor: Colors.green.withOpacity(0.5),
          targetColor: Colors.white,
          textColor: Colors.white,
          overflowMode: OverflowMode.wrapBackground,
          contentLocation: ContentLocation.trivial,
          pulseDuration: const Duration(seconds: 1),
          openDuration: const Duration(seconds: 1),
          enablePulsingAnimation: true, 
          barrierDismissible: false,
          onComplete: ()async{
            return true;
          },
          tapTarget: const Icon(Icons.menu),
          child: const Icon(Icons.menu),
        ),  
        actions: [
          DescribedFeatureOverlay(
            featureId: "feature1",
            title: const Text("Dark Mode"),
            description: const Text("Dark mode means you can see the app in a different look during the day and at night. Like all white in dark mode and all black in light mode. So light mode is better during day time,and darkmode is better at night time."),
            backgroundColor: Colors.green.withOpacity(0.5),
            targetColor: Colors.white,
            textColor: Colors.white,
            overflowMode: OverflowMode.wrapBackground,
            contentLocation: ContentLocation.trivial,
            pulseDuration: const Duration(seconds: 1),
            openDuration: const Duration(seconds: 1),
            enablePulsingAnimation: true, 
            barrierDismissible: false,
            onComplete: ()async{
              return true;
            },
            tapTarget: const Icon(Icons.dark_mode),
            child: const Icon(Icons.dark_mode),
          ),  
           
           const SizedBox(width: 10,)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: DescribedFeatureOverlay(
          featureId: "feature3",
          title: const Text("Add"),
          description: const Text("Add a new item"),
          backgroundColor: Colors.green.withOpacity(0.5),
          targetColor: Colors.white,
          textColor: Colors.white,
          overflowMode: OverflowMode.wrapBackground,
          contentLocation: ContentLocation.trivial,
          pulseDuration: const Duration(seconds: 1),
          openDuration: const Duration(seconds: 1),
          enablePulsingAnimation: true, 
          barrierDismissible: false,
          onComplete: ()async{
            return true;
          },
          tapTarget: const Icon(Icons.add),
          child: const Icon(Icons.add),
        ),
      ), 
      body: const Center(
        child: Text("Successoft infotech",textAlign: TextAlign.center,style: TextStyle(color: Colors.green,fontSize: 30,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
