import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproj/consts/consts.dart';
import 'package:finalproj/services/firestore_service.dart';
import 'package:finalproj/widgets_common/loading_indicator.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WishlishScreen extends StatelessWidget {
  const WishlishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              "My Wishlist".text.color(darkFontGrey).fontFamily(semibold).make(),
        ),
        body: StreamBuilder(
            stream: FirestoreServices.getWishLists(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: loadingIndicator(),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return "No items yet!".text.color(darkFontGrey).makeCentered();
              } else {
                return Container();
              }
            }));
  }
}
