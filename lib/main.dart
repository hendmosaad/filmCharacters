import 'package:bloc_app/app_router.dart';
import 'package:bloc_app/business_logic/bloc_observer.dart';
import 'package:bloc_app/conestances/strings.dart';
import 'package:bloc_app/data/web_services/characters_webservices.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  runApp( BreakinBadSerious(appRouter: AppRouter(),));
}

class BreakinBadSerious extends StatelessWidget {
  final AppRouter appRouter;
     
  const BreakinBadSerious({super.key,required this. appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     onGenerateRoute:appRouter.generateRoute ,
    );
  }
}

