import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/lists.dart';
import 'package:ecommerce/widgets/featured_button.dart';
import 'package:ecommerce/widgets/home_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightGrey,
      height: context.height,
      width: context.width,
      padding: EdgeInsets.all(12),
      child: SafeArea(
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                color: lightGrey,
                height: 60,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                      suffixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: lightGrey,
                      hintText: searchAnyThing,
                      hintStyle: TextStyle(color: textfieldGrey)),
                )),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        itemCount: slidersList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(slidersList[index],
                                  fit: BoxFit.fill)
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        }),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          2,
                          (index) => homeButton(
                                height: context.screenHeight * 0.15,
                                width: context.screenWidth / 2.5,
                                icon: index == 0 ? icTodaysDeal : icFlashDeal,
                                title: index == 0 ? todayDeal : flashsale,
                              )),
                    ),
                    10.heightBox,
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        itemCount: SecondSlidersList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(SecondSlidersList[index],
                                  fit: BoxFit.fill)
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        }),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          3,
                          (index) => homeButton(
                                height: context.screenHeight * 0.15,
                                width: context.screenWidth / 3.5,
                                icon: index == 0
                                    ? icTopCategories
                                    : index == 1
                                        ? icBrands
                                        : icTopSeller,
                                title: index == 0
                                    ? topCategories
                                    : index == 1
                                        ? brand
                                        : topSeller,
                              ) ),
                    ),
                    10.heightBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: featuredCategories.text.color(darkFontGrey).fontFamily(semibold).size(18).make(),
                    ),
                    10.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                              featureImages1.length, (index) => Column(
                                children: [
                                  featuredButton( image: featureImages1[index],title: featureTitle1[index],),
                                  10.heightBox,
                                  featuredButton( image: featureImages2[index],title: featureTitle2[index],),
                                ],
                              )),
                        ),
                    ),
                    10.heightBox,
                    Container(
                      padding: EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: redColor
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            featuredProducts.text.white.color(darkFontGrey).fontFamily(semibold).size(18).make(),
                            10.heightBox,
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
                    ),
                    10.heightBox,
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        itemCount: slidersList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(slidersList[index],
                              fit: BoxFit.fill)
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        }),
                    10.heightBox,
                    Align(alignment:Alignment.topLeft,child: allProducts.text.white.color(darkFontGrey).fontFamily(semibold).size(18).make()),
                    10.heightBox,
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                        shrinkWrap:true,
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,mainAxisSpacing: 8,
                                              crossAxisSpacing: 8,mainAxisExtent: 300),
                                              itemBuilder:(context,index){
                                               return Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Image.asset(imgP5,width: 200,height:200,fit: BoxFit.cover,),
                                                      Spacer(),
                                                      "Laptop 4GB/64GB".text.white.color(darkFontGrey).fontFamily(semibold).make(),
                                                      5.heightBox,
                                                      //// featuredContent.text.white.color(lightGrey).fontFamily(semibold).size(15).make(),
                                                      //  5.heightBox,
                                                      "\$600".text.white.color(redColor).fontFamily(bold).size(16).make(),

                                                    ],
                                                  ).box.white.roundedSM.padding(EdgeInsets.all(12)).margin(EdgeInsets.symmetric(horizontal: 4)).color(whiteColor).make();
                                                } )


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
