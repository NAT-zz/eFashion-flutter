import 'package:finalproj/consts/consts.dart';

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
  static deleteDocument(docId){
    return firestore.collection(cartCollection).doc(docId).delete();
  }
}
