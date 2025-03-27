import 'package:base/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base/di/injection.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = getIt<HomeBloc>()..add(const HomeStarted());
    return BlocProvider(
      create: (context) => homeBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                homeBloc.add(const LogoutRequested());
              },
            ),
          ],
        ),
        body: const HomeContent(),
      ),
    );
  }
} 