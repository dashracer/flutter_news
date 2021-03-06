import 'package:flutter/material.dart';
import 'screens/news_list.dart';
import 'blocs/stories_provider.dart';
import 'screens/news_detail.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'News!',
        onGenerateRoute: (RouteSettings setting) {
          return routes(setting);
        },
      ),
    );
  }

  routes(RouteSettings setting) {
    if (setting.name == '/') {
      return MaterialPageRoute(builder: (context) {
      return NewsList();
    });
    } else {
      return MaterialPageRoute(
        builder: (context) {
          return NewsDetail();
        },
      );
    }
    
  }
}
