import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_for_movie/provider/CounterChangeNotifierProvider.dart';
import 'package:provider_for_movie/widgets/widgets.dart';

class TabContentScreenUsingProvider extends StatelessWidget {
  const TabContentScreenUsingProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        Provider.of<CounterChangeNotifierProvider>(context)
            .counter
            .toString(),
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
