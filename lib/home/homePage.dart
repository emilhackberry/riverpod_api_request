import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_http_request/dataProvider/dataProvider.dart';
import 'package:riverpod_http_request/models/user.dart';

class HomePageScreen extends ConsumerWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(userDataProvider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("App title"),
        ),
        body: _data.when(
          data: (_data) {
            List<UserModel> users = _data.map((e) => e).toList();
            return Padding(
              padding: const EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 0),
              child: Center(
                child: Column(
                  children: [
                    for (var user in users)
                      Card(
                        surfaceTintColor: Colors.amberAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: [
                              Row(
                                children: [Text(user.firstName), const SizedBox(width: 3.0), Text(user.lastName)],
                              ),
                              const SizedBox(height: 10.0),
                              Row(
                                children: [
                                  Text(user.email),
                                  Image(
                                    image: NetworkImage(user.avatar),
                                  )
                                ],
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
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
