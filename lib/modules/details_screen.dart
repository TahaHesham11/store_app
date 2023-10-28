import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/constans.dart';
import 'package:store_app/cubit/home_cubit.dart';
import 'package:store_app/models/product.dart';

class DetailsScreen extends StatelessWidget {

  final int id;
  final int price;
  final String title;
  final String description;
  final String image;

  final int? tripId;

  DetailsScreen({
   required this.id,
   required this.title,
   required this.image,
   required this.price,
   required this.description,
    this.tripId
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return Scaffold (
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kBackgroundColor,
        leading:IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
        ),
        title: Text(
          "رجوع",
          style: TextStyle(
            color: Colors.black
          )
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20 ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: (Radius.circular(50.0)),
                bottomLeft: (Radius.circular(50.0)),
              ),
              color:kBackgroundColor

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: size.width *0.8,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Container(
                          height: size.width *0.7,
                          width: size.width * 0.7,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Image.asset(
                          image,
                          height: size.width * 0.75,
                          width: size.width * 0.75,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(

                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2.5),
                        padding: EdgeInsets.all(3.0),
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: kTextLightColor)
                        ),
                        child:Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kTextLightColor
                          ),
                        ),
                      ),

                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2.5),
                      padding: EdgeInsets.all(3.0),
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: kTextLightColor)
                      ),
                      child:Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2.5),
                      padding: EdgeInsets.all(3.0),
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: kTextLightColor)
                      ),
                      child:Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                   title,

                  ),
                ),
                Text(
    'السعر: \$${price}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
            child: Text(
              description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){

        HomeCubit.get(context).manageFavorite(id);

      },

        child: Icon(
          HomeCubit.get(context).isFavorite(id) ? Icons.star : Icons.star_border_outlined,
          color: Colors.black,

        ),
        backgroundColor: Colors.deepOrange,
      ),

    );
  },
);
  }
}
