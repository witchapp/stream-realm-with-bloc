import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realm_with_clean_architech/data_layer/data_layer.dart';
import 'package:realm_with_clean_architech/data_layer/repositories/repositories.dart';
import 'package:realm_with_clean_architech/domain_layer/domain_layer.dart';
import 'package:realm_with_clean_architech/presentation_layer/presentation_layer.dart';

class CarListPage extends StatefulWidget {
  final LocalDataSource localDataSource;
  const CarListPage({super.key, required this.localDataSource});

  @override
  State<CarListPage> createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  late final CarRepository _carRepository;
  Stream<List<CarEntity?>>? _carEntityStream;

  @override
  void initState() {
    // context.read<GetCarBloc>().add(OnGetCarDetailEvent());
    _carRepository = CarRepositoryImpl(localDataSource: widget.localDataSource);
    super.initState();
  }

  void getAllCars() {
    context.read<GetCarBloc>().add(OnGetCarDetailEvent());
    // setState(() {
    //   GetCarDetailUseCase(_carRepository).execute();
    // });
  }

  Widget carList = BlocBuilder<GetCarBloc, GetCarState>(
    builder: (context, state) {
      print('state $state');
      if (state is GetCarDetailLoading) {
        return const CircularProgressIndicator();
      }
      if (state is GetCarDetailSuccess) {
        print(state.carList);
        if (state.carList.isEmpty) {
          return const Center(
            child: Text('No Data'),
          );
        }
        if (state.carList.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.separated(
              itemBuilder: (context, index) {
                String carModel = state.carList[index]!.model;
                String carUsed = state.carList[index]!.kilometers.toString();
                print('model => $carModel, car used => $carUsed');
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Model Name: $carModel'),
                    Text('used(K.M.): $carUsed')
                  ],
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.carList.length,
            ),
          );
        }
      }
      return const Text('error');
    },
  );

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car List Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            carList,
            ElevatedButton(onPressed: getAllCars, child: const Text('Get Cars')),
          ],
        ),
      ),
    );
  }
}
