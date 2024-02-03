import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/provider/api_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
        ),
        body: ref.watch(apiProvider).when(
              data: (data) {
                if (data == null) {
                  return Center(child: Text('no data found'));
                } else {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text(data[index].id.toString()),
                            ),
                            title: Text(data[index].title),
                            subtitle: Text(data[index].body),
                          ),
                          Divider()
                        ],
                      );
                    },
                  );
                }
              },
              error: (error, stackTrace) => Center(
                child: TextButton(
                    onPressed: () {
                      ref.invalidate(apiProvider);
                    },
                    child: Text('Retry')),
              ),
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}
