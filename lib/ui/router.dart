import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pruebagfg/ui/pages/home.dart';

class MainRouter extends StatelessWidget {
  MainRouter({super.key});

  final GoRouter routerConfig = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'home.dart', // Optional, add name to your routes. Allows you navigate by name instead of path
        path: '/',
        builder: (context, state) => const HomeUiPage(),
      ),
      /*GoRoute(
        name: 'page2',
        path: '/page2',
        //builder: (context, state) => Page2Screen(),
      ),*/
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig : routerConfig
    );
  }
}