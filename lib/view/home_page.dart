
import 'package:eduon_app/cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            
              appBar: AppBar(
                title: const Center(
                  child: Text(
                    "EDUON",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                backgroundColor: Colors.white,
                leading: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                actions: const [
                  CircleAvatar(),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              body: Builder(
                builder: (context) {
                  if (state is HomeLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is HomeErrorState) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else if (state is HomeCompleteState) {
                    return ListView.builder(itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: size.width,
                          height: size.height * 0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red),
                        ),
                      );

                    });
                  } else {
                    return const SizedBox();
                  }
                },
              ));
        },
      ),
    );
  }
}
