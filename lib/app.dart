import 'package:crud_app/product_list_screen.dart';
import 'package:flutter/material.dart';

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud App',
      debugShowCheckedModeBanner: false,
      home: const ProductListScreen(),
      themeMode: ThemeMode.light,
      theme: _lightTheme(),
      darkTheme: _darkTheme(),
    );
  }

  ThemeData _lightTheme(){
    return ThemeData(
        brightness: Brightness.light,
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromWidth(double.maxFinite),
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
          ),
        )
    );
  }
  ThemeData _darkTheme(){
    return ThemeData(
        brightness: Brightness.dark,
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromWidth(double.maxFinite),
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),

          ),
        )
    );
  }

}