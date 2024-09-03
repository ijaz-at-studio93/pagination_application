import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hello/paginated_list_view.dart';
import 'package:pagination_applicatoin/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Query query = FirebaseFirestore.instance.collection('test');

  @override
  void initState() {
    super.initState();
    // query.count().get().then((v) {
    //   print(v.count);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaginatedListView(
        query: query,
        limit: 5,
        itemBuilder: (context, document) {
          final data = document.data() as Map<String, dynamic>;
          return Center(
            child: ListTile(
              title: Text(data['ab']),
            ),
          );
        },
      ),
    );
  }
}
