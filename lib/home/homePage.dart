import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_http_request/models/user.dart';
import 'package:riverpod_http_request/services/services.dart';
import 'package:riverpod_http_request/widgets/loadingScreen.dart';

class HomePageScreen extends ConsumerWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userDataProvider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Users"),
        ),
        body: data.when(
          data: (data) {
            List<UserModel> users = data.map((e) => e).toList();
            return Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 0),
              child: Center(
                child: Column(
                  children: [
                    for (var user in users)
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: [
                              Row(
                                children: [Text(user.firstName), const SizedBox(width: 3.0), Text(user.lastName)],
                              ),
                              const SizedBox(height: 10.0),
                              SizedBox(
                                height: 30.0,
                                child: Row(
                                  children: [
                                    Text(user.email),
                                    const Spacer(),
                                    Image(
                                      image: NetworkImage(user.avatar),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
            child: LoadingScreen(),
          ),
        ),
      ),
    );
  }
}
