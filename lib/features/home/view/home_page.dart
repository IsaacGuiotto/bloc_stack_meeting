import 'package:bloc_stack_meeting/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeBloc = HomeBloc();

  @override
  void initState() {
    _homeBloc.add(FetchHomeList());
    super.initState();
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Motivos do porque usar XCode",
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 32),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 24,
                ),
                BlocBuilder<HomeBloc, HomeState>(
                    bloc: _homeBloc,
                    builder: (context, state) {
                      if (state is HomeLoading) {
                        return const Text(
                          "Loading...",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        );
                      }

                      if (state is HomeError) {
                        return Text(
                          state.error,
                          style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        );
                      }
                      if (state is HomeList) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.homeList.length,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Card(
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(state.homeList[i]),
                                  ),
                                ),
                              );
                            });
                      }
                      return Container();
                    }),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  child: const Text("Log out"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
