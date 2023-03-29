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
    context.read<GetCarBloc>().add(const OnGetCarDetailEvent());
    super.initState();
  }

  void getAllCars() {
    context.read<GetCarBloc>().add(OnGetCarDetailEvent());
  }

  void getCarStatus(String carModel) {
    context.read<GetCarStatusBloc>().add(OnGetCarStatusEvent(carModel));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car List Page'),
      ),
      body: BlocBuilder<GetCarBloc, GetCarState>(
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
                child: 
                
                
                ListView.separated(
                  itemBuilder: (context, index) {
                    String carModel = state.carList[index]!.model;
                    String carUsed =
                        state.carList[index]!.kilometers.toString();
                    print(
                        'model => $carModel, car used => $carUsed, index => $index');
                    getCarStatus(carModel);
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Model: $carModel'),
                        Text('used: $carUsed'),
                        carStatusWidget(index),
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
      ),
    );
  }

  Widget carStatusWidget(int carListindex) {
    return BlocBuilder<GetCarStatusBloc, GetCarStatusState>(
      builder: (BuildContext context, state) {
        if (state is GetCarStatusSuccess) {
          print('car status => ${state.carStatusList[carListindex]!.status}');
          String status = state.carStatusList[carListindex]!.status;
          return Text('Status: $status');
        }
        if (state is GetCarStatusNoData) {
          return const Text('Stats: N/A');
        }
        return const SizedBox();
      },
    );
  }
}
