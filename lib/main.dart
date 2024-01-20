import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_task/domain/bloc/bloc/hotel_bloc.dart';
import 'package:hotel_task/ui/pages/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HotelBloc()..add(HotelEvent()),)
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'SF' , useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: const HomePage()
      ),
    );
  }
}