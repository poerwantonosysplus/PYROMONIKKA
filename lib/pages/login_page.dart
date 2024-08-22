// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_scanqr/bloc/auth/auth_bloc.dart';
// import 'package:flutter_scanqr/pages/register_page.dart';

// import 'home_page.dart';

// class LoginPage extends StatefulWidget {
//   LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController emailController = TextEditingController(text: "");

//   final TextEditingController passwordController =
//       TextEditingController(text: "");

//   bool _obscureText = false;

//   void _togglePasswordVisibility() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color.fromARGB(255, 216, 230, 255),
//         body: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: ListView(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 110),
//                 child: Column(children: [
//                   const Text(
//                     "Selamat Datang",
//                     style: TextStyle(
//                         fontSize: 32,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w500),
//                   ),
//                   const SizedBox(height: 5),
//                   const Text(
//                     "Silahkan login ke akun anda",
//                     style: TextStyle(
//                         fontSize: 17,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w400),
//                   ),
//                   const SizedBox(
//                     height: 60,
//                   ),
//                   TextField(
//                     autocorrect: false,
//                     controller: emailController,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         labelText: 'Email',
//                         prefixIcon: const Icon(Icons.email_outlined)),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   TextField(
//                     autocorrect: false,
//                     controller: passwordController,
//                     obscureText: _obscureText, // Menggunakan nilai _obscureText
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       prefixIcon: const Icon(Icons.password),
//                       labelText: 'Password',
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _obscureText
//                               ? Icons.visibility_off
//                               : Icons
//                                   .visibility, // Ikon sesuai dengan status _obscureText
//                         ),
//                         onPressed:
//                             _togglePasswordVisibility, // Panggil fungsi untuk toggle visibility
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 50),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Dispatch AuthEventLogin with actual text values from controllers
//                       context.read<AuthBloc>().add(AuthEventLogin(
//                             emailController.text,
//                             passwordController.text,
//                           ));
//                     },
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         minimumSize: const Size(400, 55),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20))),
//                     child: BlocConsumer<AuthBloc, AuthState>(
//                       listener: (context, state) {
//                         if (state is AuthStateLogin) {
//                           print('User ID Token: ${state.idToken}');
//                           Navigator.pushAndRemoveUntil(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const HomePage()),
//                             (Route<dynamic> route) =>
//                                 false, // Menghapus semua halaman sebelumnya
//                           );
//                         }
//                         if (state is AuthStateError) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text(
//                                 state.message,
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               backgroundColor: Colors.red,
//                               duration: const Duration(seconds: 2),
//                             ),
//                           );
//                         }
//                       },
//                       builder: (context, state) {
//                         if (state is AuthStateLoading) {
//                           return const Center(
//                             child: SizedBox(
//                               width:
//                                   22, // Atur lebar sesuai dengan keinginan Anda
//                               height:
//                                   22, // Atur tinggi sesuai dengan keinginan Anda
//                               child: CircularProgressIndicator(
//                                 strokeWidth:
//                                     3, // Atur lebar garis progress sesuai keinginan Anda
//                                 valueColor:
//                                     AlwaysStoppedAnimation<Color>(Colors.white),
//                               ),
//                             ),
//                           );
//                         } else {
//                           return const Text(
//                             "Login",
//                             style: TextStyle(color: Colors.white, fontSize: 18),
//                           );
//                         }
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         "Belum punya akun?",
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => RegisterPage()),
//                           );
//                         },
//                         child: const Text(
//                           "Daftar",
//                           style: TextStyle(
//                               color: Colors.blue,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 16),
//                         ),
//                       ),
//                     ],
//                   )
//                 ]),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scanqr/bloc/auth/auth_bloc.dart';
import 'package:flutter_scanqr/pages/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController = TextEditingController(text: "");
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus(); // Cek status login saat halaman diinisialisasi
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final String? idToken = prefs.getString('idToken');

    if (idToken != null) {
      // Jika token ada, arahkan ke halaman HomePage
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 216, 230, 255),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 110),
                child: Column(children: [
                  const Text(
                    "Selamat Datang",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Silahkan login ke akun anda",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 60),
                  TextField(
                    autocorrect: false,
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email_outlined)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    autocorrect: false,
                    controller: passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: const Icon(Icons.password),
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthEventLogin(
                            emailController.text,
                            passwordController.text,
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(400, 55),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthStateLogin) {
                          print('User ID Token: ${state.idToken}');
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                            (Route<dynamic> route) => false,
                          );
                        }
                        if (state is AuthStateError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                state.message,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              backgroundColor: Colors.red,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthStateLoading) {
                          return const Center(
                            child: SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            ),
                          );
                        } else {
                          return const Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Belum punya akun?",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                          );
                        },
                        child: const Text(
                          "Daftar",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
