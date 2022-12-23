import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foodie_app/controller/food_controller.dart';
import 'package:foodie_app/model/food.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore_example/firebase_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';

class FirebaseCls {

  static DatabaseReference? dbRef;

  static void initialize(){
    Firebase.initializeApp();
  }


   static void insert_cart_data_(Food food,Map addCart){
     // dbRef = FirebaseDatabase.instance.ref().child('CartFoodItems');
     //
     // if (dbRef != null) {
     //   dbRef!.child('testingemail').child(food.name).push().set(addCart);
     //   // dbRef!.push().set('abcd@gmail.com');
     //   // dbRef!.child('abcd@gmail.com').push().set(addCart);
     // }

     String loginUser = "testchecknewdata";
     String mainRoot = 'CartFoodItems/';

     DatabaseReference ref= FirebaseDatabase.instance.ref(mainRoot); // FirebaseDatabase.instance.ref(mainRoot+food.name).set(addCart) as DatabaseReference;

      print(ref.child(loginUser));
     if(ref.child(loginUser) == null ){

     // }
     //
     //   if(data == null) {
        print("NULLLLLL");
         double total = food.price * food.quantity;
         // DatabaseReference ref1 = FirebaseDatabase.instance.ref(mainRoot);

         ref.set({
           loginUser: {
             "name": food.name,
             "price": food.price,
             "quantity": food.quantity,
             "total": total
           }
         });
       }else{
         print("NOOOOONULLLLLL");
         ref!.child(loginUser).child(food.name).set(addCart);
       }

       // ref1.child(food.name).push().set(addCart);

  }


  // Future<void> getData() async {
  //   var collection = FirebaseFirestore.instance.collection('CartFoodItems');
  //   var querySnapshot = await collection.get();
  //   for (var queryDocumentSnapshot in querySnapshot.docs) {
  //     Map<String, dynamic> data = queryDocumentSnapshot.data();
  //     print(data.length);
  //     var name = data['name'];
  //     var phone = data['total'];
  //     print(name);
  //   }
  // }

//   static Map<int, String> fetch_data(){
//
//     String result = "";
//      Map<int, String> values;
//     String loginUser = "testchecknewdata";
//     String mainRoot = 'CartFoodItems/$loginUser';
//     DatabaseReference starCountRef =
//     FirebaseDatabase.instance.ref(mainRoot);
//     starCountRef.onValue.listen((DatabaseEvent event) {
//       final data = jsonEncode(event.snapshot.value);
//       // updateStarCount(data);
//       final extractedData = jsonDecode(data) as Map<String, dynamic>;
//
//       // print(extractedData.keys.toString());
//
// // print(extractedData.keys.first.toString());
//       result = extractedData.keys.toString();
//       print("-----"+result);
//       String chk = result.substring(1);
//       String remove_str = chk.replaceAll(")", " ");
//       final split = remove_str.split(',');
//        values = {
//         for (int i = 0; i < split.length; i++)
//           i: split[i]
//       };
//       print("a");
//       print(values);
//       // return values;
//     });
//     //
//     // return values;
//
//
//      // dbRef!.keepSynced(true);
//      //
//      // try {
//      //   final counterSnapshot = dbRef!.get();
//      //
//      //   print(
//      //     'Connected to directly configured database and read '
//      //         // '${counterSnapshot.value}',
//      //   );
//      // } catch (err) {
//      //   print(err);
//      // }
//
//     // CollectionReference student = FirebaseFirestore.instance.collection('CartFoodItems');
//     // CollectionReference students = FirebaseFirestore.instance.collection('CartFoodItems');
//     // Future<void> getData() async {
//     //   QuerySnapshot querySnapshot = students.get() as QuerySnapshot<Object?>;
//     //
//     //   // Get data from docs and convert map to List
//     //   final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
//     //
//     //   print("FIREBASE DATA-----------");
//     //   print(allData);
//     // // }
//
//
//
//
//     // QuerySnapshot querySnapshot = await Firestore.instance.collection("collection").getDocuments();
//     // var list = querySnapshot.documents;
//
//     // var snap = dbRef!.once();
//     //
//     // print('content of database /test: ${snap.toString()}');
//
//     // CollectionReference _collectionRef =
//     // FirebaseFirestore.instance.collection('collection');
//     // Future<void> getData() async {
//     //   // Get docs from collection reference
//     //   QuerySnapshot querySnapshot = await _collectionRef.get();
//     //
//     //   // Get data from docs and convert map to List
//     //   final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
//     //
//     //   print(allData);
//     }



    static void delete_data(){

//       String loginUser = "testchecknewdata";
//     String mainRoot = 'CartFoodItems/$loginUser';
//     DatabaseReference starCountRef =
//     FirebaseDatabase.instance.ref(mainRoot);
//     starCountRef.onValue.listen((DatabaseEvent event) {
//
//       final data = jsonEncode(event.snapshot.value);
// //
//       });
    }

    // Stream<List<Food>> getRide() {
    //   return dbRef!.collection('ride')
    //       .snapshots()
    //       .map((list) => list.documents.map((doc) => Food.fromFirestore(doc))
    //       .toList());
    // }


    // dbRef!.addChildEventListener(new ChildEventListener() {
    //       @Override
    //       public void onChildAdded(DataSnapshot dataSnapshot, String s) {
    //       String value=dataSnapshot.getValue(String.class);
    //       arrayList.add(value);
    //       arrayAdapter = new ArrayAdapter<String>(MainActivity.this, android.R.layout.simple_list_item_1, arrayList);
    //       listView.setAdapter(arrayAdapter);
    //
    //       }
    //
    //       @Override
    //       public void onChildChanged(DataSnapshot dataSnapshot, String s) {
    //
    //       }
    //
    //       @Override
    //       public void onChildRemoved(DataSnapshot dataSnapshot) {
    //
    //       }
    //       });

    // dbRef('testingemail').once('value').then(function(snapshot) {
        // var country = snapshot.key ;
        //
        // snapshot.forEach(function(snapshot1) {
        // console.log(snapshot1.key); //
        // snapshot.forEach(function(snapshot2) {
        // console.log(snapshot2.key); //
        //
        // snapshot2.forEach(function(snapshot3) {
        // console.log(snapshot3.key);
        // console.log(snapshot3.val().first_name)
        // });
        // });
        // });


    // Container(
    //   child: FirebaseAnimatedList(
    //     query: dbRef,
    //     itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
    //
    //       Map fooditems = snapshot.value as Map;
    //       print(fooditems);
    //       // Map fooditems = snapshot.value as Map;
    //       // fooditems['testingemail'] = snapshot.key;
    //       //
    //       //  listItem(student: student);
    //       // cartFood.add(fooditems:fooditems);
    //       // cartFood.assignAll(cartFood.distinctBy((item) => item));
    //       return cartListView(context);
    //     },
    //   ),
    // ),

  // }

// @override
// Widget build(BuildContext context) {
//   return Scaffold();
// }
}

