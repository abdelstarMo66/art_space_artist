// if internet lost
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class LostConnection extends StatelessWidget {
  const LostConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.network_check_rounded, size:  50,),
            SizedBox(height: 20.0,),
            Center(child: Text('Please check your internet connection')),
          ],
        ),
      ),
    );
  }
}

// function to solve package bug

void lostConnection() async{
  var result = await Connectivity().checkConnectivity();
  if(result == ConnectivityResult.none)
    {
      const LostConnection();
    }
}