import 'package:cloud_firestore/cloud_firestore.dart';

class Favorites {
  CollectionReference chuckToFirebase =
      FirebaseFirestore.instance.collection('favorites');

  Future <void> sendJokeToFireStore(String jokeType, String joke) async {
    if (jokeType == 'chuck') {
      chuckToFirebase.add({'jokeType': 'A Chuck Norris joke', 'joke': joke});
    } else if (jokeType == 'dad') {
      chuckToFirebase.add({'jokeType': 'A Dad joke', 'joke': joke});
    } else if (jokeType == 'it') {
      chuckToFirebase.add({'jokeType': 'An IT joke', 'joke': joke});
    } else {
      chuckToFirebase.add({'jokeType': 'A Corporate BS', 'joke': joke});
    }
  }
}

