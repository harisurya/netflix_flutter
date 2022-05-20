import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_flutter/shared/shared.dart';

import 'bloc/bloc.dart';
import 'ui/pages/pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PageBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: blackColor),
        debugShowCheckedModeBanner: false,
        title: "Netflix FLutter",
        home: Wrapper(),
      ),
    );
  }
}
