import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jokrs/services/chuck.dart';
import 'package:jokrs/services/firestore.dart';

class ChuckScreen extends StatefulWidget {
  const ChuckScreen({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<ChuckScreen> {
  late Future<Chuck> futureChuck;
  var jokeToFS = Favorites();
  bool isVisible=true;

  //CollectionReference chuckToFirebase = FirebaseFirestore.instance.collection('favorites');

  @override
  void initState() {
    super.initState();
    futureChuck = getChuckJoke();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.refresh,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              futureChuck = getChuckJoke();
              isVisible=true;
            });
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/smaller_jokrs.png'),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/favorites_screen');
            },
            icon: Image.asset('assets/fav_list_inv.png'),
            color: Colors.white,
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/chuck_rev_loopfinal.gif'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: FutureBuilder<Chuck>(
                        future: futureChuck,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              children: [
                                Text(
                                  snapshot.data!.chuckJoke,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.comfortaa(
                                    textStyle: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                ),
                                
                                //Add to favorites
                                Visibility(
                                  visible:isVisible,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: TextButton.icon(
                                      icon: Image.asset(
                                        'assets/add_to_fav_inv.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                      label: Text(
                                        'Add to favorites',
                                        style: GoogleFonts.comfortaa(
                                          textStyle:
                                          TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        side: BorderSide(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isVisible=false;
                                        });
                                        jokeToFS.sendJokeToFireStore(
                                            'chuck', snapshot.data!.chuckJoke);
                                        final snackBar = SnackBar(
                                          content: Text('Added to favorites',
                                              style: GoogleFonts.comfortaa(),
                                          ),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          // By default, show a loading spinner.
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
