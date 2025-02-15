import 'package:api_integration_with_bloc/api/api_helper.dart';
import 'package:api_integration_with_bloc/bloc/quote_bloc.dart';
import 'package:api_integration_with_bloc/ui/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(create: (context){
    return QuoteBloc(apiHelper: ApiHelper());
  },child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  UserPage(),
    );
  }
}
