import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/lists.dart';
import 'package:ecommerce/screens/category_screen/category_details.dart';
import 'package:ecommerce/widgets/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      appBar: AppBar(
        title:categories.text.fontFamily(bold).white.make()
      ),
      body:Container(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
            itemCount: categoriesImages.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 200)
            , itemBuilder: (context,index){
          return  Column(
              children: [
                Image.asset(categoriesImages[index],height: 120,width:200,fit: BoxFit.cover,),
                10.heightBox,
                categoriesTitle[index].text.color(darkFontGrey).align(TextAlign.center).make()
              ],
            ).box.white.color(whiteColor).roundedSM.outerShadowSm.clip(Clip.antiAlias).make().onTap(() {
              Get.to(()=> CategoryDetails(title : categoriesTitle[index]));
          })

         ;
            }),
      )
    ));
  }
}
