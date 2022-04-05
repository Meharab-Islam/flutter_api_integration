import 'package:api_int/data_helper.dart';
import 'package:api_int/data_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Getdata>? data;
  bool isLoaded = false;

  getData() async {
    data = await Data_helper().get_data();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Data from Javaplaceholder'),
        ),
        body: SafeArea(
            child: Visibility(
          child: Scrollbar(
            isAlwaysShown: true,
            interactive: true,
            child: ListView.builder(
              itemCount: data?.length ?? 0,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.grey, width: 2))),
                width: double.infinity,
                // height: 200,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        data![index].title,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.green,
                        ),
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        data![index].body,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 5, 128, 107),
                        ),
                        textAlign: TextAlign.center,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          visible: isLoaded,
          replacement: Center(child: CircularProgressIndicator()),
        )),
      ),
    );
  }
}
