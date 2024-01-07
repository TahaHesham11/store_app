import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/bloc_observer.dart';
import 'package:store_app/constans.dart';
import 'package:store_app/cubit/home_cubit.dart';
import 'package:store_app/modules/taps_item.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..emitGetProduct(context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('ar', 'AE'), // English
          ],

          theme: ThemeData(
            scaffoldBackgroundColor: Colors.blue,
            primaryColor: kPrimaryColor,
            textTheme: GoogleFonts.almaraiTextTheme(Theme
                .of(context)
                .textTheme),
          ),

          home: TapsItemScreen()
      ),
    );
  }
}

