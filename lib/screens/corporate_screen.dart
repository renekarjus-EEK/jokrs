import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jokrs/services/corporate.dart';
import 'package:jokrs/services/firestore.dart';

class CorporateScreen extends StatefulWidget {
  const CorporateScreen({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<CorporateScreen> {
  late Future<CorporateGenerator> futureCorp;
  var jokeToFS = Favorites();
  //variables for word checkboxes
  bool isChecked1 = false;
  bool isVisible1 = false;
  bool isChecked2 = false;
  bool isVisible2 = false;
  bool isChecked3 = false;
  bool isVisible3 = false;
  bool isChecked4 = false;
  bool isVisible4 = false;
  //variable for favorite button
  bool isVisible=true;

  @override
  void initState() {
    super.initState();
    futureCorp = getCorporateBs();
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
              futureCorp = getCorporateBs();
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
            ),
            Text(
              'Test yourself - how many corporate BS words can you use in a meeting?',
              style: GoogleFonts.comfortaa(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
            ),

            //1 word used
            Row(
              children: [
                Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: Colors.white,
                  ),
                  child: Checkbox(
                    checkColor: Colors.black,
                    activeColor: Colors.white,
                    value: isChecked1,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked1 = value!;
                        isVisible1 == false
                            ? isVisible1 = true
                            : isVisible1 = false;
                      });
                    },
                  ),
                ),
                Text(
                  '1',
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Visibility(
                  child: Text(
                    " - you have achieved the rank of noob!",
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  visible: isVisible1,
                ),
              ],
            ),

            //2 words used
            Row(
              children: [
                Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: Colors.white,
                  ),
                  child: Checkbox(
                    checkColor: Colors.black,
                    activeColor: Colors.white,
                    value: isChecked2,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked2 = value!;
                        isVisible2 == false
                            ? isVisible2 = true
                            : isVisible2 = false;
                      });
                    },
                  ),
                ),
                Text(
                  '2',
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Visibility(
                  child: Text(
                    " - you really like to talk smart, don't you?",
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  visible: isVisible2,
                ),
              ],
            ),

            //3 words used
            Row(
              children: [
                Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: Colors.white,
                  ),
                  child: Checkbox(
                    checkColor: Colors.black,
                    activeColor: Colors.white,
                    value: isChecked3,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked3 = value!;
                        isVisible3 == false
                            ? isVisible3 = true
                            : isVisible3 = false;
                      });
                    },
                  ),
                ),
                Text(
                  '3',
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Visibility(
                  child: Text(
                    " - you may now decline the next meeting",
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  visible: isVisible3,
                ),
              ],
            ),

            //4 words used
            Row(
              children: [
                Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: Colors.white,
                  ),
                  child: Checkbox(
                    checkColor: Colors.black,
                    activeColor: Colors.white,
                    value: isChecked4,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked4 = value!;
                        isVisible4 == false
                            ? isVisible4 = true
                            : isVisible4 = false;
                      });
                    },
                  ),
                ),
                Text(
                  '4',
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Visibility(
                  child: Text(
                    " - get a drink and go to a vacation!",
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  visible: isVisible4,
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
            ),

            //Corporate BS API & Add to Favorites
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: FutureBuilder<CorporateGenerator>(
                        future: futureCorp,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              children: [
                                Text(
                                  snapshot.data!.corporateBs,
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
                                        jokeToFS.sendJokeToFireStore('corporate',
                                            snapshot.data!.corporateBs);
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
