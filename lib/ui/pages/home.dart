import 'package:flutter/material.dart';

class HomeUiPage extends StatefulWidget {
  const HomeUiPage({Key? key}) : super(key: key);
  //const HomeUiPage({super.key});

  @override
  State<HomeUiPage> createState() => _HomeUiPageState();
}

class _HomeUiPageState extends State<HomeUiPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('HomeUiPage'),
      ),*/
      body: Row(
            children: [
              Column(
                children: [
                  Image(
                      image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg')
                  ),
                  Text('Hola'),
                  Text('Mundo'),
                  Text('Flutter'),
                ],
              )
            ],
          )
    );
  }
}