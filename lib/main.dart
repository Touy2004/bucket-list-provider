import 'package:bucket_list_provider/pages/home_page.dart';
import 'package:bucket_list_provider/services/bucket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BucketService(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bucket List Provider',
      // initialRoute: "/",
      // routes: routes
      home: HomePage(),
    );
  }
}
