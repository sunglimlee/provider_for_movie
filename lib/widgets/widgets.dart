import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_for_movie/provider/BottomNavigationChangeNotifierProvider.dart';
import 'package:provider_for_movie/provider/CounterChangeNotifierProvider.dart';
import 'package:provider_for_movie/screen/TabContentScreenForMovieList.dart';
import 'package:provider_for_movie/screen/TabContentScreenUsingProvider.dart';
import 'package:provider_for_movie/screen/TabContentScreenUsingSetState.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "setState"),
        BottomNavigationBarItem(
            icon: Icon(Icons.home_filled), label: "Provider"),
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movie"),
      ],
      currentIndex: Provider.of<BottomNavigationChangeNotifierProvider>(context)
          .currentPage,
      selectedItemColor: Colors.red,
      onTap: (index) {
        //provider navigation state :
        Provider.of<BottomNavigationChangeNotifierProvider>(context,
                listen: false)
            .updateCurrentPage(index);
      },
    );
  }
}

class NavigationBody extends StatelessWidget {
  const NavigationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (Provider.of<BottomNavigationChangeNotifierProvider>(context)
        .currentPage) {
      case 0:
        {
          return const TabContentScreenUsingSetState(
            title: 'setState',
          );
        }
      case 1:
        {
          return TabContentScreenUsingProvider();
        }
      case 2:
        {
          return TabContentScreenForMovieList();
        }
      default:
        {
          return Container();
        }
    }
  }
}

// [question] conditional scaffold 베스트 //QnADartGrammar //CheckThisOut
// https://stackoverflow.com/questions/49713189/how-to-use-conditional-statement-within-child-attribute-of-a-flutter-widget-cen
class MyScaffold extends StatelessWidget { // 이렇게하면 내가 원하는 Scaffold 도 만들 수 있고.. 각각의 탭에 해당하는 앱바와 바텀과 플로팅이 들어간다. 바디는 여전히 네비게이션으로 만들고.
  const MyScaffold({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var bottomNavigationChangeNotifierProvider = Provider.of<BottomNavigationChangeNotifierProvider>(context).currentPage;
    switch (bottomNavigationChangeNotifierProvider) {
      case 0:
        {
          return const TabContentScreenUsingSetState(title: "SetState");
        }
      default:
        {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: (bottomNavigationChangeNotifierProvider == 1) ? Colors.purple : Colors.orange, // 너무나도 중요한거다.
            ),
             floatingActionButton:
             (bottomNavigationChangeNotifierProvider == 1) ?
             FloatingActionButton(
              onPressed: () {
                Provider.of<CounterChangeNotifierProvider>(context,
                        listen: false)
                    .increment(); // 여기서도 프로바이더를 사용하는데 이부분은 바뀌지 않도ㅗㄱ 해야 한ㄷ.
              },
              child: const Icon(Icons.add),
            ) : null,
            bottomNavigationBar: BottomNavigationBarWidget(),
            body: NavigationBody(),
          );
        }
    }
  }
}
