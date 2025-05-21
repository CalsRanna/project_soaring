import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_soaring/page/exercise/exercise_view_model.dart';
import 'package:signals/signals_flutter.dart';

@RoutePage()
class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  final viewModel = GetIt.instance.get<ExerciseViewModel>();

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('E')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 16,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Watch(
                    (context) => ListView.builder(
                      controller: viewModel.scrollController,
                      itemBuilder: (context, index) {
                        return Text(viewModel.logs.value[index]);
                      },
                      itemCount: viewModel.logs.value.length,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: viewModel.start,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border.all()),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text('Start'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
