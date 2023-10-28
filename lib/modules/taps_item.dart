import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/home_cubit.dart';

class TapsItemScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState >(
  listener: (context, state) {},
  builder: (context, state) {
    return Scaffold (

      body: HomeCubit.get(context).screens[HomeCubit.get(context).current],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: HomeCubit.get(context).current,
        onTap: (index)
        {
          HomeCubit.get(context).changeNavBar(index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),
        ],
      ),

    );
  },
);
  }
}
