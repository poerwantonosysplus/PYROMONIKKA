

// import 'package:bloc/bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// part 'auth_event.dart';
// part 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   AuthBloc() : super(AuthStateLogout()) {
//     FirebaseAuth auth = FirebaseAuth.instance;

//     on<AuthEventLogin>((event, emit) async {
//       try {
//         emit(AuthStateLoading());
//         UserCredential userCredential = await auth.signInWithEmailAndPassword(
//             email: event.email, password: event.password);

//         final User? user = userCredential.user;

//         if (user != null) {
//           if (user.emailVerified) {
//             String? idToken = await user.getIdToken();
//             if (idToken != null) {
//               emit(AuthStateLogin(idToken));
//             } else {
//               emit(AuthStateError("Failed to get ID token."));
//             }
//           } else {
//             emit(AuthStateError("Email belum diverifikasi. Silakan periksa email Anda."));
//             await user.sendEmailVerification();
//           }
//         } else {
//           emit(AuthStateError("User not found."));
//         }
//       } on FirebaseAuthException catch (e) {
//         emit(AuthStateError(e.message.toString()));
//       } catch (e) {
//         emit(AuthStateError(e.toString()));
//       }
//     });

//     on<AuthEventLogout>((event, emit) async {
//       await auth.signOut();
//       emit(AuthStateLogout());
//     });

//     on<AuthEventRegister>((event, emit) async {
//       try {
//         emit(AuthStateLoading());
//         UserCredential userCredential = await auth.createUserWithEmailAndPassword(
//             email: event.email, password: event.password);

//         final User? user = userCredential.user;

//         if (user != null) {
//           await user.sendEmailVerification();
//           emit(AuthStateRegisterSuccess());
//         } else {
//           emit(AuthStateError("User not found."));
//         }
//       } on FirebaseAuthException catch (e) {
//         emit(AuthStateError(e.message.toString()));
//       } catch (e) {
//         emit(AuthStateError(e.toString()));
//       }
//     });
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  FirebaseAuth auth = FirebaseAuth.instance;

  AuthBloc() : super(AuthStateLogout()) {
    // Cek apakah user sudah login
    _checkLoginStatus();

    on<AuthEventLogin>((event, emit) async {
      try {
        emit(AuthStateLoading());
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: event.email, password: event.password);

        final User? user = userCredential.user;

        if (user != null) {
          if (user.emailVerified) {
            String? idToken = await user.getIdToken();
            if (idToken != null) {
              // Simpan token ke shared preferences
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('idToken', idToken);
              await prefs.setString('email', user.email!);

              emit(AuthStateLogin(idToken));
            } else {
              emit(AuthStateError("Failed to get ID token."));
            }
          } else {
            emit(AuthStateError("Email belum diverifikasi. Silakan periksa email Anda."));
            await user.sendEmailVerification();
          }
        } else {
          emit(AuthStateError("User not found."));
        }
      } on FirebaseAuthException catch (e) {
        emit(AuthStateError(e.message.toString()));
      } catch (e) {
        emit(AuthStateError(e.toString()));
      }
    });

    on<AuthEventLogout>((event, emit) async {
      await auth.signOut();
      // Hapus token dari shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('idToken');
      await prefs.remove('email');
      emit(AuthStateLogout());
    });

    on<AuthEventRegister>((event, emit) async {
      try {
        emit(AuthStateLoading());
        UserCredential userCredential = await auth.createUserWithEmailAndPassword(
            email: event.email, password: event.password);

        final User? user = userCredential.user;

        if (user != null) {
          await user.sendEmailVerification();
          emit(AuthStateRegisterSuccess());
        } else {
          emit(AuthStateError("User not found."));
        }
      } on FirebaseAuthException catch (e) {
        emit(AuthStateError(e.message.toString()));
      } catch (e) {
        emit(AuthStateError(e.toString()));
      }
    });
  }

  // Method untuk mengecek status login
  void _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final String? idToken = prefs.getString('idToken');
    if (idToken != null) {
      emit(AuthStateLogin(idToken));
    }
  }
}
