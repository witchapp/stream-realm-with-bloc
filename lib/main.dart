import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realm/realm.dart';
import 'package:realm_with_clean_architech/data_layer/data_layer.dart';
import 'package:realm_with_clean_architech/domain_layer/domain_layer.dart';
import 'package:realm_with_clean_architech/presentation_layer/bloc/cubit/get_status_cubit.dart';
import 'package:realm_with_clean_architech/presentation_layer/presentation_layer.dart';

late Realm realm;
late LocalDataSource localDataSource;
void main() {
  LocalConfiguration config = Configuration.local([Car.schema, Status.schema]);
  realm = Realm(config);
  print(realm.config.path);
  localDataSource = LocalDataSourceImpl(realm);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetCarBloc(
            CarRepositoryImpl(localDataSource: localDataSource),
          ),
        ),
        BlocProvider(
          create: (context) => GetCarStatusBloc(
            CarRepositoryImpl(localDataSource: localDataSource),
          ),
        ),
         BlocProvider(
          create: (context) => GetStatusCubit(
            CarRepositoryImpl(localDataSource: localDataSource),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CarListPage(localDataSource: localDataSource),
      ),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
