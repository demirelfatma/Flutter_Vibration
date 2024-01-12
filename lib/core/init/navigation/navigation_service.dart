// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/cupertino.dart';

import '../../../main.dart';
import 'INavigatorService.dart';

class NavigationService extends INavigationService{
static NavigationService? _instace;
static NavigationService get instance {
 _instace ??= NavigationService._init();
return _instace!;
}
NavigationService._init();
//burda bir sınıftan diger sınıflara gecmek için navigator key kullanacaz
  GlobalKey<NavigatorState> navigatorKey=GlobalKey();
  final removeAllRoutes=(Route<dynamic> route)=>false;
  // final removeAllRoutes2=(Route<dynamic> route)=>false;


  @override
  Future<void> navigatorToPage({String? path, Object? data})async {
      await appKey.currentState!.pushNamed(path!, arguments:data );
    }
  
    @override
    Future<void> navigatorToPageClear({String? path, Object? data}) async{
      await appKey.currentState!.pushNamedAndRemoveUntil(path!,removeAllRoutes,arguments: data);
  }

}