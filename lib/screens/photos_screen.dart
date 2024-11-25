import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['https://www.googleapis.com/auth/drive.readonly'],
  );

  List<String> _photoUrls = [];
  bool _isLoading = false;

  Future<void> _fetchPhotos() async {
    try {
      setState(() {
        _isLoading = true;
      });

      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account == null) {
        throw Exception('User cancelled sign-in');
      }

      final headers = await account.authHeaders;
      final client = http.Client();

      final response = await client.get(
        Uri.parse(
            'https://www.googleapis.com/drive/v3/files?q=\'1lxy7joxsM52VG34grzczX4xVnAm9zdnE\' in parents&fields=files(id,name,webContentLink)'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _photoUrls = (data['files'] as List)
              .map((file) => 'https://drive.google.com/uc?id=${file['id']}')
              .toList();
        });
      } else {
        throw Exception('Failed to load photos: ${response.body}');
      }
    } catch (e) {
      print('Error fetching photos: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Drive Photos'),
        backgroundColor: Colors.blue,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _photoUrls.isEmpty
          ? const Center(child: Text('No photos found'))
          : GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: _photoUrls.length,
        itemBuilder: (context, index) {
          return Image.network(
            _photoUrls[index],
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error, color: Colors.red);
            },
          );
        },
      ),
    );
  }
}
