import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_for_movie/provider/BottomNavigationChangeNotifierProvider.dart';
import 'package:provider_for_movie/provider/CounterChangeNotifierProvider.dart';
import 'package:provider_for_movie/provider/MovieChangeNotifierProvider.dart';
import 'package:provider_for_movie/widgets/widgets.dart';

class MyRouter extends StatelessWidget {
  const MyRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterChangeNotifierProvider>(create: (context) => CounterChangeNotifierProvider()),
        ChangeNotifierProvider<BottomNavigationChangeNotifierProvider>(create: (context) => BottomNavigationChangeNotifierProvider()),
        ChangeNotifierProvider<MovieChangeNotifierProvider>(create: (context) => MovieChangeNotifierProvider(),)
      ],
      child: MyScaffold(),
    );}
}
