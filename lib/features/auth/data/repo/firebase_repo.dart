import 'package:app1/core/models/user_model.dart';
import 'package:app1/features/admin/trips/data/models/trip_model.dart';
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






  final CollectionReference _tripsCollection = 
      FirebaseFirestore.instance.collection('trips');

  Future<Map<String, dynamic>> addTrip({
    required String destination,
    required String origin,
    required int totalSeats,
    required String paymentMethod,
    required TripStatus status,
    required int price,
    required int availableSeats,
    required String description,
    required String createdBy,
  }) async {
    try {
      final tripId = _tripsCollection.doc().id;
      
      final trip = TripModel(
        id: tripId,
        destination: destination,
        origin: origin,
        totalSeats: availableSeats,
        paymentMethod: paymentMethod,
        status: status,
        price: price,
        availableSeats: availableSeats,
        description: description,
        startDate: DateTime.now(),
        createdBy: createdBy,
      );

      await _tripsCollection.doc(tripId).set(trip.toMap());

      return {'success': true, 'trip': trip};
    } catch (error) {
      return {'success': false, 'error': error.toString()};
    }
  }

  Future<List<TripModel>> getTrips() async {
    try {
      final querySnapshot = await _tripsCollection
          .where('isActive', isEqualTo: true)
          .orderBy('startDate')
          .get();

      return querySnapshot.docs
          .map((doc) => TripModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }

  Future<TripModel?> getTripById(String tripId) async {
    try {
      final doc = await _tripsCollection.doc(tripId).get();
      if (doc.exists) {
        return TripModel.fromMap(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<void> updateTripSeats(String tripId, int newSeats) async {
    await _tripsCollection.doc(tripId).update({
      'availableSeats': newSeats,
    });
  }


  // Future<void> Trip ({}) async{
  //   try{
  //   await firestore
  //         .collection('users')
  //         .doc(user.uid)
  //         .set(userModel.toMap());

  //     return {'success': true, 'user': userModel};
  //   } catch (error) {
  //     return {'success': false, 'error': error.toString()};
  //   }
  // }
  







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