// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:flutter_scanqr/bloc/auth/auth_bloc.dart';

// // import 'login_page.dart';

// // class RegisterPage extends StatelessWidget {
// //   RegisterPage({super.key});

// //   final TextEditingController emailController = TextEditingController(text: "");
// //   final TextEditingController passwordController =
// //       TextEditingController(text: "");

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: const Text(
// //             "Register Page",
// //             style: TextStyle(color: Colors.white),
// //           ),
// //           backgroundColor: Colors.blue,
// //            iconTheme: const IconThemeData(
// //     color: Colors.white, // Mengatur warna ikon menjadi putih
// //   ),
// //         ),
// //         body: ListView(
// //           padding: const EdgeInsets.all(20),
// //           children: [
// //             TextField(
// //               autocorrect: false,
// //               controller: emailController,
// //               decoration: InputDecoration(
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(20),
// //                 ),
// //                 labelText: 'Email',
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             TextField(
// //               autocorrect: false,
// //               controller: passwordController,
// //               obscureText: true,
// //               decoration: InputDecoration(
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(20),
// //                 ),
// //                 labelText: 'Password',
// //               ),
// //             ),
// //             const SizedBox(height: 25),
// //             ElevatedButton(
// //               onPressed: () {
// //                 context.read<AuthBloc>().add(AuthEventRegister(
// //                       emailController.text,
// //                       passwordController.text,
// //                     ));
// //               },
// //               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
// //               child: BlocConsumer<AuthBloc, AuthState>(
// //                 listener: (context, state) {
// //                   if (state is AuthStateRegisterSuccess) {
// //                     ScaffoldMessenger.of(context).showSnackBar(
// //                       const SnackBar(
// //                         content: Text(
// //                           "Verifikasi email telah dikirim. Silakan periksa email Anda.",
// //                           style: TextStyle(color: Colors.white),
// //                         ),
// //                         backgroundColor: Colors.green,
// //                         duration: Duration(seconds: 5),
// //                       ),
// //                     );
// //                     // Navigasi ke halaman login setelah registrasi berhasil
// //                     Navigator.pushReplacement(context,
// //                         MaterialPageRoute(builder: (context) => LoginPage()));
// //                   }
// //                   if (state is AuthStateError) {
// //                     ScaffoldMessenger.of(context).showSnackBar(
// //                       SnackBar(
// //                         content: Text(
// //                           state.message,
// //                           style: const TextStyle(color: Colors.white),
// //                         ),
// //                         backgroundColor: Colors.red,
// //                         duration: const Duration(seconds: 2),
// //                       ),
// //                     );
// //                   }
// //                 },
// //                 builder: (context, state) {
// //                   if (state is AuthStateLoading) {
// //                     return const Center(
// //                       child: SizedBox(
// //                         width: 22, // Atur lebar sesuai dengan keinginan Anda
// //                         height: 22, // Atur tinggi sesuai dengan keinginan Anda
// //                         child: CircularProgressIndicator(
// //                           strokeWidth:
// //                               3, // Atur lebar garis progress sesuai keinginan Anda
// //                           valueColor:
// //                               AlwaysStoppedAnimation<Color>(Colors.white),
// //                         ),
// //                       ),
// //                     );
// //                   } else {
// //                     return const Text(
// //                       "Register",
// //                       style: TextStyle(color: Colors.white),
// //                     );
// //                   }
// //                 },
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_scanqr/bloc/auth/auth_bloc.dart';
// import 'login_page.dart';

// class RegisterPage extends StatefulWidget {
//   RegisterPage({super.key});

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final TextEditingController emailController = TextEditingController(text: "");
//   final TextEditingController passwordController =
//       TextEditingController(text: "");
//   bool _obscureText = true;

//   void _togglePasswordVisibility() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             backgroundColor: const Color.fromARGB(255, 216, 230, 255),
//             body: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: ListView(children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 110),
//                   child: Column(
//                     children: [
//                       const Text(
//                         "Daftar Akun",
//                         style: TextStyle(
//                             fontSize: 32,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       const SizedBox(height: 5),
//                       const Text(
//                         "Silahkan buat akun baru Anda",
//                         style: TextStyle(
//                             fontSize: 17,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w400),
//                       ),
//                       const SizedBox(height: 60),
//                       TextField(
//                         autocorrect: false,
//                         controller: emailController,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           labelText: 'Email',
//                           prefixIcon: const Icon(Icons.email_outlined),
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       TextField(
//                         autocorrect: false,
//                         controller: passwordController,
//                         obscureText: _obscureText,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           prefixIcon: const Icon(Icons.password),
//                           labelText: 'Password',
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _obscureText
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                             ),
//                             onPressed: _togglePasswordVisibility,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 50),
//                       ElevatedButton(
//                         onPressed: () {
//                           context.read<AuthBloc>().add(AuthEventRegister(
//                                 emailController.text,
//                                 passwordController.text,
//                               ));
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           minimumSize: const Size(400, 55),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                         child: BlocConsumer<AuthBloc, AuthState>(
//                           listener: (context, state) {
//                             if (state is AuthStateRegisterSuccess) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text(
//                                     "Verifikasi email telah dikirim. Silakan periksa email Anda.",
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                   backgroundColor: Colors.green,
//                                   duration: Duration(seconds: 5),
//                                 ),
//                               );
//                               Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => LoginPage()),
//                               );
//                             }
//                             if (state is AuthStateError) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                   content: Text(
//                                     state.message,
//                                     style: const TextStyle(color: Colors.white),
//                                   ),
//                                   backgroundColor: Colors.red,
//                                   duration: const Duration(seconds: 2),
//                                 ),
//                               );
//                             }
//                           },
//                           builder: (context, state) {
//                             if (state is AuthStateLoading) {
//                               return const Center(
//                                 child: SizedBox(
//                                   width: 22,
//                                   height: 22,
//                                   child: CircularProgressIndicator(
//                                     strokeWidth: 3,
//                                     valueColor: AlwaysStoppedAnimation<Color>(
//                                         Colors.white),
//                                   ),
//                                 ),
//                               );
//                             } else {
//                               return const Text(
//                                 "Register",
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 18),
//                               );
//                             }
//                           },
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text(
//                             "Sudah punya akun?",
//                             style: TextStyle(fontSize: 16),
//                           ),
//                           const SizedBox(width: 10),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pop(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => LoginPage()),
//                               );
//                             },
//                             child: const Text(
//                               "Login",
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ]),
//             )));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scanqr/bloc/auth/auth_bloc.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController = TextEditingController(text: "");
  final TextEditingController confirmPasswordController = TextEditingController(text: "");
  
  bool _obscureText = true;
  bool _obscureConfirmText = true;
  bool _isPasswordMatch = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmText = !_obscureConfirmText;
    });
  }

  void _validatePassword() {
    setState(() {
      _isPasswordMatch = passwordController.text == confirmPasswordController.text;
    });
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
                child: Column(
                  children: [
                    const Text(
                      "Daftar Akun",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Silahkan buat akun baru Anda",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
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
                        prefixIcon: const Icon(Icons.email_outlined),
                      ),
                    ),
                    const SizedBox(height: 15),
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
                           _obscureText ? Icons.visibility_off : Icons.visibility 
                          ),
                          onPressed: _togglePasswordVisibility,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      autocorrect: false,
                      controller: confirmPasswordController,
                      obscureText: _obscureConfirmText,
                      onChanged: (value) => _validatePassword(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(Icons.password_outlined),
                        labelText: 'Konfirmasi Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmText ? Icons.visibility_off : Icons.visibility 
                          ),
                          onPressed: _toggleConfirmPasswordVisibility,
                        ),
                        errorText: _isPasswordMatch ? null : 'Konfirmasi password tidak cocok',
                      ),
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        _validatePassword();
                        if (_isPasswordMatch) {
                          context.read<AuthBloc>().add(AuthEventRegister(
                                emailController.text,
                                passwordController.text,
                              ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(400, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is AuthStateRegisterSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Verifikasi email telah dikirim. Silakan periksa email Anda.",
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.blue,
                                duration: Duration(seconds: 5),
                              ),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          }
                          if (state is AuthStateError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  state.message,
                                  style: const TextStyle(color: Colors.white),
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
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              ),
                            );
                          } else {
                            return const Text(
                              "Register",
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
                          "Sudah punya akun?",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
