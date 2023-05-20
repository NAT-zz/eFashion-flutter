import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproj/consts/consts.dart';
import 'package:finalproj/consts/lists.dart';
import 'package:finalproj/controllers/admin/home_admin_contronller.dart';
import 'package:finalproj/models/category_model.dart';
import 'package:finalproj/services/firestore_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProductAdminController extends GetxController {
  var isLoading = false.obs;
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var quantityController = TextEditingController();
  var descController = TextEditingController();

  var categoryList = <String>[].obs;
  var subcategoryList = <String>[].obs;

  List<Category> categories = [];
  var imageLinks = [];
  var imageList = RxList<dynamic>.generate(3, (index) => null);
  var categoryValue = ''.obs;
  var subcategoryValue = ''.obs;
  var selectedColorIndex = [].obs;
  var listColor = [];

  reset() {
    isLoading = false.obs;
    nameController.text = '';
    priceController.text = '';
    quantityController.text = '';
    descController.text = '';
    subcategoryList.clear();
    categoryList.clear();
    // categoryList = <String>[].obs;
    // subcategoryList = <String>[].obs;

  // categories.clear();
  
  imageLinks.clear();
  listColor.clear();
  // imageList = RxList<dynamic>.generate(3, (index) => null);
  categoryValue.value = '';
  subcategoryValue.value = '';
  selectedColorIndex.clear();
  }

  getSelectedColors() {
    selectedColorIndex.clear();
    if (listColor.isNotEmpty) {
      for (int i=0; i<colorList.length; i++) {
        if (listColor.contains(colorList[i])) {
          selectedColorIndex.add(i);
        }
      }
    }
  }
  getSubcategoryList(title) async {
    subcategoryList.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = categoryModelFromJson(data);
    var s =
        decoded.categories.where((element) => element.name == title).toList();

    for (var e in s[0].subcategory) {
      subcategoryList.add(e);
    }
  }

  getCategoryList() async {
    categoryList.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = categoryModelFromJson(data);

    for (var item in decoded.categories) {
      categoryList.add(item.name);
    }
  }

  pickImage(index, context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 80);
      if (img == null) {
        return;
      } else {
        imageList[index] = File(img.path);
      }
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }


  uploadImages() async {
    imageLinks.clear();
    for (var item in imageList) {
      if (item != null) {
        var filename = basename(item.path);
        var destination = 'images/vendors/${currentUser!.uid}/$filename';
        Reference ref = FirebaseStorage.instance.ref().child(destination);
        await ref.putFile(item);
        var n = await ref.getDownloadURL();
        imageLinks.add(n);
      }
    }
    if (imageLinks.isEmpty) {
      imageLinks.add('https://th.bing.com/th/id/OIF.mMe6RjQUzW445EsTHMrysA?pid=ImgDet&rs=1');
      imageLinks.add('https://th.bing.com/th/id/OIF.mMe6RjQUzW445EsTHMrysA?pid=ImgDet&rs=1');
      imageLinks.add('https://th.bing.com/th/id/OIF.mMe6RjQUzW445EsTHMrysA?pid=ImgDet&rs=1');
    }
  }

  uploadProduct(context) async {
    var store = firestore.collection(productsCollection).doc();
    try {
      await store.set({
      'is_featured': false,
      'p_category': categoryValue.value,
      'p_subcategory' : subcategoryValue.value,
      'p_colors': FieldValue.arrayUnion(listColor),
      'p_imgs': FieldValue.arrayUnion(imageLinks),
      'p_wishlist': FieldValue.arrayUnion([]),
      'p_desc': descController.text,
      'p_name': nameController.text,
      'p_price': priceController.text,
      'p_quantity': quantityController.text,
      'p_seller': Get.find<HomeAdminController>().username,
      'p_rating': "5.0",
      'vendor_id': currentUser!.uid,
      'featured_id': '',
    });
    isLoading(false);
    VxToast.show(context, msg: 'Product uploaded');
    } catch (e) {
      VxToast.show(context, msg: e.toString());
      print(e.toString());
    }
  }

  addFeature(docId) async {
    var store = firestore.collection(productsCollection).doc(docId);
    await store.set({
      'featured_id': currentUser!.uid,
      'is_featured': true,
    } , SetOptions(merge: true));
  }

  removeFeature(docId) async {
    var store = firestore.collection(productsCollection).doc(docId);
    await store.set({
      'featured_id': '',
      'is_featured': false,
    } , SetOptions(merge: true));
  }

  removeProduct(docId) async {
    await firestore.collection(productsCollection).doc(docId).delete();
  }

  // changeColorIndex(index) {
  //   colorIndex.value = index;
  // }

  // increaseQuantity(totalQuantity) {
  //   if (quantity.value < totalQuantity) {
  //     quantity.value++;
  //   }
  // }

  // decreaseQuantity() {
  //   if (quantity.value > 0) {
  //     quantity.value--;
  //   }
  // }

  // calculateTotalPrice(price) {
  //   totalPrice.value = price * quantity.value;
  // }

  // addToCart({title, img, sellername, color, qty, tprice, context, vendorId}) async {
  //   await firestore.collection(cartCollection).doc().set({
  //     'title': title,
  //     'img': img,
  //     'sellername': sellername,
  //     'color': color,
  //     'qty': qty,
  //     'vendor_id': vendorId,
  //     'tprice': tprice,
  //     'added_by': currentUser!.uid
  //   }).catchError((error) {
  //     VxToast.show(context, msg: error.toString());
  //   });
  // }

  // resetValue() {
  //   totalPrice.value = 0;
  //   quantity.value = 0;
  //   colorIndex.value = 0;
  // }

  // addToWishlist(docId, context) async {
  //   await firestore.collection(productsCollection).doc(docId).set({
  //     'p_wishlist': FieldValue.arrayUnion([currentUser!.uid])
  //   }, SetOptions(merge: true));
  //   isFav(true);
  //   VxToast.show(context, msg: "Added to wishlist");
  // }

  // removeFromWishlist(docId, context) async {
  //   await firestore.collection(productsCollection).doc(docId).set({
  //     'p_wishlist': FieldValue.arrayRemove([currentUser!.uid])
  //   }, SetOptions(merge: true));
  //   isFav(false);
  //   VxToast.show(context, msg: "Removed from wishlist");
  // }

  // checkIfFav(data) async {
  //   if (data['p_wishlist'].contains(currentUser!.uid)) {
  //     isFav(true);
  //   } else {
  //     isFav(false);
  //   }
  // }
}
