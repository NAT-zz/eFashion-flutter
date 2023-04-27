import 'package:finalproj/consts/consts.dart';
import 'package:flutter/services.dart';

class FirestoreServices {
  static getUser(uid) {
    return firestore
        .collection(usersCollections)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  //get products by category
  static getProducts(category) {
    return firestore
        .collection(productsCollection)
        .where('p_category', isEqualTo: category)
        .snapshots();
  }

  //get cart
  static getCart(uid) {
    return firestore
        .collection(cartCollection)
        .where('added_by', isEqualTo: uid)
        .snapshots();
  }

  //delete doc
  static deleteDocument(docId) async {
    return await firestore.collection(cartCollection).doc(docId).delete();
  }

  // get all chat messages
  static getChatMessages(docId) {
    return firestore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messagesCollection)
        .orderBy('created_on', descending: false)
        .snapshots();
  }

  static getAllOrders() {
    return firestore
        .collection(ordersCollection)
        .where('order_by', isEqualTo: currentUser!.uid)
        .snapshots();
  }

  static getWishLists() {
    return firestore
        .collection(productsCollection)
        .where('p_wishlist', arrayContains: currentUser!.uid)
        .snapshots();
  }

  static getAllMessages() {
    return firestore.collection(chatsCollection).where('fromId', isEqualTo: currentUser!.uid).snapshots();
  }
}
