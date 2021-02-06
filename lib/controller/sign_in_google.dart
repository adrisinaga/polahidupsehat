import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pola_hidup_sehat/controller/register_controller.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

// Add these three variables to store the info
// retrieved from the FirebaseUser
String nameData;
String emailData;
String imageUrlData;

final RegisterController _registerController =
Get.put(RegisterController());

Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult = await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    ///Checking if email and name is null
    assert(user.email!=null);
    assert(user.displayName!=null);
    assert(user.photoURL!=null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    ///Store retrieved data
    nameData=user.displayName;
    emailData=user.email;
    imageUrlData=user.photoURL;

    if(nameData.contains(" ")){
      nameData = nameData.substring(0,nameData.indexOf(" "));
    }

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('signInWithGoogle succeeded: $user');



    return '$user';
  }

  return null;
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Signed Out");
}