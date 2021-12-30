import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jokrs/services/useless_fact.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<UselessFact> futureUselessFact;

  @override
  void initState() {
    super.initState();
    futureUselessFact = getUselessFact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white.withOpacity(0.6),
          child: Icon(
            Icons.refresh,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              futureUselessFact = getUselessFact();
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
          children: <Widget>[
            Expanded(
              child: Row(
                children: [

                  //Chuck picture and link
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/chuck3.jpg'),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          //color: Colors.white.withOpacity(0.5),
                          child: TextButton(
                            child: Text('CHUCK NORRIS JOKES', style:GoogleFonts.comfortaa()),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue.withOpacity(0.7),
                              primary: Colors.white,
                              textStyle: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/chuck_screen');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Dad picture and link
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/dadjoke.jpg'),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          //color: Colors.white.withOpacity(0.5),
                          child: TextButton(
                            child: Text("         DADS' JOKES         ", style:GoogleFonts.comfortaa()),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue.withOpacity(0.7),
                              primary: Colors.white,
                              textStyle: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/dad_screen');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [

                  //Corporate picture and link
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/phb.png'),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: TextButton(
                            child: Text(
                              "       CORPORATE BS       ", style:GoogleFonts.comfortaa()
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue.withOpacity(0.7),
                              primary: Colors.white,
                              textStyle: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/corporate_screen');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  //IT picture and link
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/itguy.jpg'),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          //color: Colors.white.withOpacity(0.5),
                          child: TextButton(
                            child: Text("            IT JOKES            ", style:GoogleFonts.comfortaa()),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue.withOpacity(0.7),
                              primary: Colors.white,
                              textStyle: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/prog_screen');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //Random useless fact section
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: FutureBuilder<UselessFact>(
                      future: futureUselessFact,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Here's a totally random useless fact for you:",
                                  style: GoogleFonts.comfortaa(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Text(
                                  snapshot.data!.uselessFact,
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
                              ],
                            ),
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
          ],
        ),
      ),
    );
  }
}
