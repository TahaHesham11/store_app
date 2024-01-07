import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/constans.dart';
import 'package:store_app/cubit/home_cubit.dart';
import 'package:store_app/cubit/home_state.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/modules/details_screen.dart';

class HomeScreen extends StatelessWidget {

 final int? id;
 final int? price;
 final String? title;
 final String? description;
 final String? image;

  const HomeScreen({super.key, this.id,this.title,this.price,this.description,this.image});


 //HomeScreen({super.key, this.id});



  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {},
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'مرحبا بكم في متجر الالكترونيات',
          style: GoogleFonts.getFont('Almarai'),
        ),

      ),

      body:
      SafeArea(
        child: Column(
        children: [
          SizedBox(height: kDefaultPadding / 2,),
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    )
                  ),
                  margin: EdgeInsets.only(top: 70.0),
                ),

                ListView.builder(
                  physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index) => buildProductItem (context ,size,HomeCubit.get(context).getAllProducts[index]),
                  itemCount: HomeCubit.get(context).getAllProducts.length

                )
              ],
            ),
          )
        ],
        ),
    ),



    );
  },
);


  }

  Widget buildProductItem (context ,size, Product productModel, ) =>   InkWell(
    onTap: ()
    {

      navigateTo(context, DetailsScreen(
        id: productModel.id!,
        title: productModel.title!,
        image: productModel.image!,
        price: productModel.price!,
        description: productModel.description!,
      ));
      print(productModel.id);

    },
    child: Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      height: 190.0,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [

          Container(
            height: 166.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0,15),
                      blurRadius: 15,
                      color: Colors.black26
                  )
                ]
            ),
          ),

          Positioned(
              top: 0.0,
              left: 0.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                height: 160.0,
                width: 200.0,
                child: Image.asset(
                  productModel.image!,
                  fit: BoxFit.cover,
                ),
              )
          ),
          Positioned(
            right: 0.0,
            bottom: 0.0,
            child: SizedBox(height: 136,width: size.width -200,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Text( productModel.title!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      productModel.subTitle!,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 5.0,
                      ),
                      decoration: BoxDecoration(
                          color:  kSecondaryColor,
                          borderRadius: BorderRadius.circular(22.0)
                      ),
                      child: Text(
                          'السعر: \$${productModel.price}'
                      ),
                    ),
                  )
                ],
              ),
            ),

          )
        ],
      ),

    ),
  );


}
