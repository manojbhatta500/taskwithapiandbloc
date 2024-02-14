import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskapibloc/home/bloc/manager_bloc.dart';

import 'package:taskapibloc/home/ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManagerBloc(),
      child: const MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


// model folder has a model of item  container 
// data folder has  a data  in the list format 
// the ui folder has  files releted to ui 
// bloc folder has files releted to logic of app

// in this  task i could have used 
//tab bar but i thought using bloc would be good fit 
