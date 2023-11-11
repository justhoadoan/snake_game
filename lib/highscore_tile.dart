import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HighScoreTile extends StatelessWidget {
  final String documentId;
  const HighScoreTile ({
    Key? key,
    required this.documentId,
    }) : super (key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference highscores = 
    FirebaseFirestore.instance.collection('Highscores');
 
 return FutureBuilder<DocumentSnapshot>(
  future: highscores.doc(documentId).get(),
  builder:(context, snapshot){
    if (snapshot.connectionState == ConnectionState.done){
      Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        
        return Row(
         children:[
           Text(data['Score'].toString()),
           SizedBox(
            width: 10 ,
           ),
            Text(data['Name']),
            ],
          );
   } else {
     return const Text('Loading...');
   }
  }
 );    
}
}