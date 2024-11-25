import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/blocs/authbloc/auth_bloc.dart';
import 'package:scholar_chat/cubits/authCubit/auth_cubit_cubit.dart';
import 'package:scholar_chat/cubits/chat_/cubit/chat_cubit.dart';

import 'package:scholar_chat/screens/Signup.dart';
import 'package:scholar_chat/screens/chatPage.dart';
import 'package:scholar_chat/screens/loginpage.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubitCubit(),
        ),
        BlocProvider(
          create: (context) => ChatCubitCubit(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        routes: {
          SignUp.id2: (context) => SignUp(),
          LoginPage.id: (context) => LoginPage(),
          chatPage.id: (context) => chatPage(),
        },
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: LoginPage.id,
      ),
    );
  }
}
