import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class future_builder extends StatelessWidget {
  const future_builder({super.key});

  Future<String> fetchData() async {
    // Simulating fetching data from a network
    await Future.delayed(Duration(seconds: 2));
    return 'Data fetched successfully!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('FutureBuilder Example')),
        body: Center(
          child: FutureBuilder<String>(
            future:
                fetchData(), // This is the async function that returns a Future
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // While data is being fetched, display a loading indicator
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // If there's an error, display an error message
                return Text('Error: ${snapshot.error}');
              } else {
                // When data is fetched successfully, display it
                return Text('Fetched Data: ${snapshot.data}');
              }
            },
          ),
        ));
  }
}
