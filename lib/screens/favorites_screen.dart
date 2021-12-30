import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<FavoritesScreen> {
  final Future<QuerySnapshot> results =
  FirebaseFirestore.instance.collection('favorites').get();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/smaller_jokrs.png'),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading:IconButton(
          icon: Icon(
            Icons.home_outlined,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
      ),
      body: Container(
        color: Colors.black,
        child: FutureBuilder<QuerySnapshot>(
          future: results,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Loading');
            }
            final data = snapshot.requireData;
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
                Text(
                  'Saved favorites',
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            '${data.docs[index]['jokeType']}',
                            style: GoogleFonts.comfortaa(
                              textStyle: TextStyle(color: Colors.amber),
                            ),
                          ),
                          Text(
                            '${data.docs[index]['joke']}',
                            style: GoogleFonts.comfortaa(
                              textStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog<AlertDialog>(
                                  context: context,
                                  builder: (context){
                                    return AlertDialog(
                                      actions: [
                                        TextButton(
                                            onPressed: (){
                                              Navigator.pushNamed(context, '/favorites_screen');
                                            },
                                            child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: (){
                                            FirebaseFirestore.instance.collection('favorites').doc(data.docs[index].reference.id).delete();
                                            Navigator.pushNamed(context, '/favorites_screen');
                                          },
                                          child: Text('Delete'),
                                        ),
                                      ],
                                      content: Text('Do you want to delete this joke?'),
                                    );
                                  },
                              );
                              /*FirebaseFirestore.instance
                                  .collection('favorites')
                                  .doc(data.docs[index].reference.id)
                                  .delete();
                              Navigator.pushNamed(context, '/favorites_screen');*/
                            },
                            child: Text(
                              'Delete',
                              style: GoogleFonts.comfortaa(
                                textStyle: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
