import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/lists.dart';
import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/screens/profile_screen/components/card_details.dart';
import 'package:ecommerce/screens/profile_screen/edit_profile_screen.dart';
import 'package:ecommerce/services/firestore_services.dart';
import 'package:ecommerce/widgets/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      body: StreamBuilder(
        stream: FirestoreServices.getUser(currentUser!.uid),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          }else{
            var data = snapshot.data!.docs[0];
            print(data);
            return  SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding:EdgeInsets.all(8.0) ,child:Align(alignment:Alignment.topRight,child: Icon(Icons.edit,color: whiteColor, )), ).onTap(() {Get.to(()=>EditProfileScreen(data :data));}),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal:
                        8.0),
                    child: Row(
                      children: [
                        data['imageUrl'] ==''
                        ?Image.asset(imgProfile2,width:100,fit:BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
                        :Image.network(data['imageUrl'],width:100,height:100,fit:BoxFit.cover,).box.height(100).width(100).roundedFull.clip(Clip.antiAlias).make(),
                        Expanded(child: Column(
                          children: [
                            "${data['name']}".text.white.fontFamily(bold).make(),
                            "${data['email']}".text.white.fontFamily(semibold).make(),
                          ],)
                        ),
                        OutlinedButton(
                          onPressed: ()async{
                            await Get.put(AuthController().signoutMethod(context));
                            Get.offAll(()=> LoginScreen());
                          },
                          child: logout.text.white.fontFamily(semibold).make(),
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(color: whiteColor)
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      cardDetails(count:data['cart_count'] ,title:"in your cart",width:context.screenWidth/3.4),
                      cardDetails(count:data['wishlist_count'] ,title:"in your wish list",width:context.screenWidth/3.4),
                      cardDetails(count:data['order_count'] ,title:"your orders",width:context.screenWidth/3.4),
                    ],
                  ).box.color(redColor).padding(EdgeInsets.symmetric(vertical: 20)).make(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.language,size: 22,color: whiteColor,),
                          "Language".text.white.fontFamily(semibold).make()
                        ],
                      )    ,
                      Column(
                        children: [
                          Icon(Icons.language,size: 22,color: whiteColor,),
                          "Language".text.white.fontFamily(semibold).make()
                        ],
                      )    ,
                      Column(
                        children: [
                          Icon(Icons.language,size: 22,color: whiteColor,),
                          "Language".text.white.fontFamily(semibold).make()
                        ],
                      )    ,
                    ],
                  ).box.padding(EdgeInsets.only(bottom: 20)).color(redColor).make(),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: profileListViewitem.length,
                    itemBuilder: (context,index){return ListTile(
                      title: profileListViewitem[index].text.color(darkFontGrey).fontFamily(semibold).make(),
                      leading: Image.asset(profileListViewImages[index],width: 22,),
                    ).box.white.make();},
                    separatorBuilder: (context,index){return Divider(color: lightGrey,) ;},
                  ).box.white.roundedSM.shadowSm.margin(EdgeInsets.all(12)).padding(EdgeInsets.symmetric(horizontal: 16)).make().box.color(redColor).make(),

                ],
              ),
            ),
          );
          }

        },
      ),

    ));
  }
}
