import 'package:firbase_project/core/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepository {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRepository({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
  })  : firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        firestore = firestore ?? FirebaseFirestore.instance;

  Future<Map<String, dynamic>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      final user = userCredential.user;
      if (user == null) {
        return {'success': false, 'error': 'Sign in failed'};
      }

      final userDoc = await firestore.collection('users').doc(user.uid).get();
      
      if (!userDoc.exists) {
        final userModel = UserModel(
          uid: user.uid,
          email: user.email!,
          name: user.email!.split('@')[0], 
          role: UserRole.user, 
          createdAt: DateTime.now(),
        );
        
        await firestore
            .collection('users')
            .doc(user.uid)
            .set(userModel.toMap());
        
        return {'success': true, 'user': userModel};
      }

      final userModel = UserModel.fromMap(userDoc.data()!);
      return {'success': true, 'user': userModel};
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      
      switch (e.code) {
        case 'invalid-credential':
        case 'wrong-password':
          errorMessage = 'Incorrect email or password';
          break;
        case 'user-not-found':
          errorMessage = 'No account found with this email';
          break;
        case 'user-disabled':
          errorMessage = 'This account has been disabled';
          break;
        case 'too-many-requests':
          errorMessage = 'Too many failed attempts. Try again later';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email address';
          break;
        case 'network-request-failed':
          errorMessage = 'Network error. Check your connection';
          break;
        default:
          errorMessage = 'Login failed. Please try again';
      }
      return {'success': false, 'error': errorMessage};
    } catch (error) {
      return {'success': false, 'error': 'An unexpected error occurred'};
    }
  }

  Future<Map<String, dynamic>> signUp({
    required String email,
    required String password,
    required String name,
    required UserRole role,
    String? phoneNumber,
  }) async {
    try {

      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
        return {'success': false, 'error': 'Please enter a valid email address'};
      }

      if (password.length < 6) {
        return {'success': false, 'error': 'Password must be at least 6 characters'};
      }

      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      final user = userCredential.user;
      if (user == null) {
        return {'success': false, 'error': 'Account creation failed'};
      }

      await user.sendEmailVerification();

      final userModel = UserModel(
        uid: user.uid,
        email: user.email!,
        name: name,
        phoneNumber: phoneNumber,
        role: role,
        createdAt: DateTime.now(),
      );

      await firestore
          .collection('users')
          .doc(user.uid)
          .set(userModel.toMap());

      return {
        'success': true, 
        'user': userModel,
        'message': 'Account created successfully!'
      };
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'This email is already registered';
          break;
        case 'weak-password':
          errorMessage = 'Password is too weak. Use at least 6 characters';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email address';
          break;
        case 'operation-not-allowed':
          errorMessage = 'Email/password accounts are not enabled. Contact support';
          break;
        default:
          errorMessage = 'Registration failed: ${e.message}';
      }
      return {'success': false, 'error': errorMessage};
    } catch (error) {
      return {'success': false, 'error': 'Failed to create account'};
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<UserModel?> getCurrentUser() async {
    final user = firebaseAuth.currentUser;
    if (user != null) {
      try {
        final userDoc = await firestore.collection('users').doc(user.uid).get();
        if (userDoc.exists) {
          return UserModel.fromMap(userDoc.data()!);
        }
      } catch (_) {}
    }
    return null;
  }
}