
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/lists.dart';
import 'package:ecommerce/widgets/bg_widget.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  final String? title;
  ProductDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      backgroundColor: lightGrey,
        appBar: AppBar(title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(onPressed:(){},icon: Icon(Icons.share),),
          IconButton(onPressed:(){},icon: Icon(Icons.favorite_border_outlined)),
        ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          height: 350,
                          enlargeCenterPage: true,
                          itemCount: productImages.length,
                          itemBuilder: (context, index) {
                            return Image.asset(productImages[index],
                                width:double.infinity ,
                                fit: BoxFit.cover)
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(EdgeInsets.symmetric(horizontal: 8))
                                .make();
                          }),
                      10.heightBox,
                      productDesc.text.color(darkFontGrey).size(16).fontFamily(semibold).make(),
                      10.heightBox,
                      //rating
                      VxRating(onRatingUpdate: (value){},normalColor: textfieldGrey,selectionColor: golden,size: 25,stepInt:true,count:5),
                      10.heightBox,
                      "\$30,000".text.color(redColor).fontFamily(bold).size(18).make(),
                      10.heightBox,
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              "Seller".text.white.fontFamily(semibold).make(),
                              5.heightBox,
                              "In House Brands".text.color(darkFontGrey).fontFamily(semibold).size(16).make(),

                            ],),
                          ),
                          CircleAvatar(backgroundColor: Colors.white,
                          child: Icon(Icons.message_rounded,color: darkFontGrey,),)
                        ],
                      ).box.height(60).padding(EdgeInsets.symmetric(horizontal: 16)).color(textfieldGrey).roundedSM.make(),
                      10.heightBox,
                      //colors
                      Row(children: [
                        "Color : ".text.color(textfieldGrey).make(),
                        10.widthBox,
                        Row(
                          children:
                          List.generate(3, (index) =>
                              VxBox().size(40, 40).color(Vx.randomPrimaryColor).roundedFull.margin(EdgeInsets.symmetric(horizontal: 4)).make())
                        )
                      ],).box.padding(EdgeInsets.all(8)).white.roundedSM.shadow.make(),
                      10.heightBox,
                      //Quantity
                      Row(children: [
                        "Quantity : ".text.color(textfieldGrey).make(),
                        10.widthBox,
                        Row(
                            children:[
                              IconButton(onPressed: (){}, icon: Icon(Icons.add,)),
                              "0".text.color(darkFontGrey).fontFamily(bold).size(16).make(),
                              IconButton(onPressed: (){}, icon: Icon(Icons.remove,)),
                              10.widthBox,
                              "10 available".text.color(textfieldGrey).fontFamily(bold).size(16).make(),

                            ])
                      ],).box.padding(EdgeInsets.all(8)).white.roundedSM.shadow.make(),
                      10.heightBox,
                      //Total Price
                      Row(children: [
                        "Total Price : ".text.color(textfieldGrey).make(),
                        10.widthBox,
                        Row(
                            children:[
                             10.widthBox,
                              "\$30,000".text.color(redColor).fontFamily(bold).size(18).make(),

                            ])
                      ],).box.padding(EdgeInsets.all(8)).white.roundedSM.shadow.make(),
                      10.heightBox,
                      //Product description
                      "Product description".text.color(darkFontGrey).fontFamily(semibold).make(),
                      10.heightBox,
                      "Product description Product description Product description Product description Product description Product description Product description".text.color(darkFontGrey).make(),
                      10.heightBox,
                      ListView(
                        shrinkWrap: true,
                        children: List.generate(productListViewitem.length,(index) =>
                            ListTile(title: productListViewitem[index].text.color(darkFontGrey).fontFamily(semibold).make(),
                              trailing: Icon(Icons.arrow_forward),).box.white.roundedSM.margin(EdgeInsets.symmetric(vertical: 5)).make()
                        )
                      ),
                      10.heightBox,
                      productsYouMayLike.text.color(darkFontGrey).fontFamily(semibold).make(),
                      10.heightBox,
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children:List.generate(6 , (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(imgP1,width: 150,fit: BoxFit.cover,),
                                5.heightBox,
                                "Laptop 4GB/64GB".text.white.color(darkFontGrey).fontFamily(semibold).make(),
                                5.heightBox,
                                //// featuredContent.text.white.color(lightGrey).fontFamily(semibold).size(15).make(),
                                //  5.heightBox,
                                "\$600".text.white.color(redColor).fontFamily(bold).size(16).make(),

                              ],
                            ).box.white.roundedSM.padding(EdgeInsets.all(8)).margin(EdgeInsets.symmetric(horizontal: 4)).color(whiteColor).make()
                            )
                            )
                          ],
                        ),
                      ),

                    ],
                  ),


                ),
              ),
            ),
            SizedBox(
                width:double.infinity,
                height: 60,
                child: customButton(bgColor:redColor ,textColor:whiteColor ,title:"Add to cart",onPress:(){})),
          ],
        )));
  }
}
