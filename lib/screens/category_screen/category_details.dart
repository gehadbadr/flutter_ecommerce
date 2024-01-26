import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/lists.dart';
import 'package:ecommerce/screens/category_screen/product_details.dart';
import 'package:ecommerce/widgets/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
        appBar: AppBar(title: title!.text.fontFamily(bold).white.make()),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(
                        categoriesTitle.length,
                        (index) => categoriesTitle[index]
                            .text
                            .size(16)
                            .color(darkFontGrey)
                            .fontFamily(semibold)
                            .makeCentered()
                            .box
                            .white
                            .size(120, 60)
                            .color(whiteColor)
                            .rounded
                            .margin(EdgeInsets.symmetric(horizontal: 4))
                            .make())),
              ),
              10.heightBox,
              Expanded(
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: productsImages.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        mainAxisExtent: 250),

                    itemBuilder: (context, index) {
                      return  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(productsImages[index],width: 200,height:180,fit: BoxFit.fill,),
                          productsTitle[index].text.white.color(darkFontGrey).fontFamily(semibold).make(),
                          5.heightBox,
                          "\$${productsPrice[index]}".text.white.color(redColor).fontFamily(bold).size(16).make(),

                        ],
                      ).box.white.roundedSM.outerShadowSm.padding(EdgeInsets.all(12)).margin(EdgeInsets.symmetric(horizontal: 4)).color(whiteColor).make().onTap(() {
                        Get.to(()=>ProductDetails(title:productsTitle[index] ));
                      });

                    }),
              ),
            ],
          ),
        )));
  }
}
