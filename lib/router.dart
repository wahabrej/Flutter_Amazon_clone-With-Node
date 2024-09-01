import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/features/auth/admin/screen/add_product.dart';
import 'package:amazon_clone/features/auth/admin/screen/post_screen.dart';
import 'package:amazon_clone/features/auth/home/screen/category_deals_screen.dart';
import 'package:amazon_clone/features/auth/home/screen/home_screen.dart';
import 'package:amazon_clone/features/auth/auth/screens/screens/auth_screen.dart';
import 'package:amazon_clone/features/search/search_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );

    case BottomBar.routeName:
      return MaterialPageRoute(
        builder: (_) => const BottomBar(),
      );

    case AddProductScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AddProductScreen(),
      );

    case CategoryDealsScreen.routeName:
      // Ensure routeSettings.arguments is of type String
      final category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreen(
          category: category,
        ),
      );
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Wrong page"),
          ),
        ),
      );
  }
}
