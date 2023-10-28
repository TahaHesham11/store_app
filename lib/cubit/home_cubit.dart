import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/modules/favorite_screen.dart';
import 'package:store_app/modules/home_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context)=>BlocProvider.of(context);



  List<Widget> screens = [
    HomeScreen(),
    FavoriteScreen(),
  ];

  int current = 0;
  void changeNavBar(index) {
    current = index;
    emit(HomeChangeNavBarState());

  }

  Product? productModel;

  List<Product> getAllProducts =[];

  List<Product> getFavoriteProducts =[];

  void emitGetProduct(context)
  {

    DefaultAssetBundle.of(context).loadString("images/test.json").then((value) {

  var response = json.decode(value);

  response.forEach((element){

productModel = Product.fromJson(element);

getAllProducts.add(productModel!);

  });

emit(HomeGetProductSuccessState());
}).catchError((error){
  emit(HomeGetProductErrorState(error));

});

  }


  void manageFavorite(int id) {
    var existingIndex = getFavoriteProducts.indexWhere((element) => element.id == id);

    if (existingIndex >= 0) {
      // إذا وجد العنصر، قم بإزالته من القائمة
      getFavoriteProducts.removeAt(existingIndex);
      emit(HomeRemoveFavoriteState());
    } else {
      // إذا لم يتم العثور على العنصر، تحقق من وجوده في قائمة المنتجات الكلية
      var productToAdd = getAllProducts.firstWhere((element) => element.id == id  );

      if (productToAdd != null) {
        getFavoriteProducts.add(productToAdd);
        emit(HomeAddFavoriteState());
      } else {
        // يمكنك التعامل مع حالة عدم العثور على المنتج بالشكل الذي تراه مناسبًا هنا.
      }
    }
  }


  bool isFavorite(int id)
  {
    return getFavoriteProducts.any((element) =>

    element.id == id

    );

  }
  

}




