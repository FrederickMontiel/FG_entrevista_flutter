import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pruebagfg/ui/pages/admin/clients/view.dart';
import 'package:pruebagfg/ui/pages/login/view.dart';


class MainRouter extends StatelessWidget  {
  MainRouter({super.key});

  final GoRouter routerConfig = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'home', // Optional, add name to your routes. Allows you navigate by name instead of path
        path: '/',
        builder: (context, state) => const LoginUiPage(),
      ),
      GoRoute(
        name: 'adminClients',
        path: '/admin/clients',
        builder: (context, state) => const AdminClients(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context)  {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig : routerConfig
    );
  }
}