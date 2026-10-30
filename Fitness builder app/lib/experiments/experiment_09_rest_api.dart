import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Experiment09RestApi extends StatefulWidget {
  const Experiment09RestApi({super.key});

  @override
  State<Experiment09RestApi> createState() => _Experiment09RestApiState();
}

class _Experiment09RestApiState extends State<Experiment09RestApi> {
  late Future<List<dynamic>> _posts;

  @override
  void initState() {
    super.initState();
    _posts = fetchPosts();
  }

  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=10'));
    if (response.statusCode != 200) throw Exception('Request failed: ${response.statusCode}');
    return jsonDecode(response.body) as List<dynamic>;
  }

  void reload() => setState(() => _posts = fetchPosts());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 9: REST API'),
        actions: [IconButton(onPressed: reload, icon: const Icon(Icons.refresh), tooltip: 'Reload')],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
          if (snapshot.hasError) return Center(child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const Icon(Icons.cloud_off, size: 48),
              const SizedBox(height: 12),
              Text('Could not load demo data.\n${snapshot.error}', textAlign: TextAlign.center),
              const SizedBox(height: 12),
              FilledButton(onPressed: reload, child: const Text('Try again')),
            ]),
          ));
          final posts = snapshot.data ?? [];
          if (posts.isEmpty) return const Center(child: Text('No records returned.'));
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index] as Map<String, dynamic>;
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: ListTile(
                  leading: CircleAvatar(child: Text('${post['id']}')),
                  title: Text('${post['title']}', maxLines: 2, overflow: TextOverflow.ellipsis),
                  subtitle: Text('${post['body']}', maxLines: 2, overflow: TextOverflow.ellipsis),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
