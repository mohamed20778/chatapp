import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/cubits/authCubit/auth_cubit_cubit.dart';
import 'package:scholar_chat/cubits/chat_/cubit/chat_cubit.dart';
import 'package:scholar_chat/reusable-component/custom-Button.dart';
import 'package:scholar_chat/screens/Signup.dart';
import 'package:scholar_chat/screens/chatPage.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  static String id = 'login';
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubitCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          BlocProvider.of<ChatCubitCubit>(context).getMessage();
          Navigator.pushNamed(context, chatPage.id);
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, State) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: const Color(0xff2B475E),
          body: SafeArea(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/scholar.png'),
                      const Text(
                        'Scholar Chat',
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Pacifico',
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Row(
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || !value.contains('@')) {
                            return 'please enter valid email';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Enter Email',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.length < 8) {
                            return 'Enter valid password';
                          } else {
                            return null;
                          }
                        },
                        obscureText: isPassword,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: isPassword
                                  ? const Icon(
                                      CupertinoIcons.eye,
                                      color: Colors.white,
                                    )
                                  : const Icon(
                                      CupertinoIcons.eye_slash,
                                      color: Colors.white,
                                    )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Enter Password',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubitCubit>(context).loginUser(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                        label: 'Login',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "don't have account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, SignUp.id2);
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(color: Colors.cyan),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
