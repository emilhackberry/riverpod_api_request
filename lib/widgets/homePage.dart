import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_http_request/services/api_controller.dart';
import 'package:riverpod_http_request/services/auth_service.dart';
import 'package:riverpod_http_request/widgets/loadingScreen.dart';
import 'package:riverpod_http_request/widgets/loading_text.dart';
import 'package:riverpod_http_request/widgets/snack_bar.dart';
import 'package:riverpod_http_request/widgets/top_text_loaded.dart';

class HomePageScreen extends ConsumerWidget {
  const HomePageScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(apiControllerProvider(authService: ref.watch(authServiceProvider)));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: data.isLoading ? const LoadingText() : const TopTextLoaded(),
          leading: (const SnackBarPage()),
        ),
        body: data.when(
          data: (users) {
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
