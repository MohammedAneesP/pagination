import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination/features/home_screen/presentation/screens/home_screen.dart';
import 'package:pagination/features/home_screen/presentation/bloc/pagination_bloc_bloc.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PaginationBlocBloc()),
        ],
        child: const MaterialApp(
          home: HomeScreen(),
          debugShowCheckedModeBanner: false,
        ));
  }
}


