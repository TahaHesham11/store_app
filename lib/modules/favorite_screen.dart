import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/constans.dart';
import 'package:store_app/cubit/home_cubit.dart';
import 'package:store_app/models/product.dart';

class FavoriteScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    if(HomeCubit.get(context).getFavoriteProducts.isEmpty){
      return Center(child: Text('لا توجد منتجات في المفضله',
        style: TextStyle(
          color: kBackgroundColor,
          fontSize: 20.0
      ),));
    }else{
      return Scaffold (
          appBar: AppBar(
            centerTitle: true,
            title: Text(

                'Favorite'
            ),
          ),


          body:  SafeArea(
            child: Column(
              children: [
                SizedBox(height: kDefaultPadding / 2),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                          ),
                        ),
                        margin: EdgeInsets.only(top: 70.0),
                      ),

                      ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context,index) => buildProductItem (context ,size,HomeCubit.get(context).getFavoriteProducts[index]),
                          itemCount: HomeCubit.get(context).getFavoriteProducts.length

                      )



                    ],
                  ),
                ),
              ],
            ),
          )

      );

    }
  },
);
  }


  Widget buildProductItem (context ,size, Product productModel, ) =>   Container(
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

  );

}
