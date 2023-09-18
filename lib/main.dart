import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Photo Gallery'),
          centerTitle: true,
        ),
        body: PhotoGallery(),
      ),
    );
  }
}

class PhotoGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Welcome to My Photo Gallery!',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 6,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  final message = 'Image ${index + 1} clicked';
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                    ),
                  );
                },
                child: Card(
                  elevation: 4.0,
                  child: Column(
                    children: [
                      Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLDjh5sKzTc9LVtW-bK79Z__xTWO7Wrz4G8rSZBTnwERXj42ucFd8yE1x5ay7D-Rlpnm0&usqp=CAU',
                        height: 75,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Image ${index + 1}'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: Image.asset('assets/images/cat.jpg.jpg'),
            title: Text('Photo 1'),
            subtitle: Text('This is a photo with a subtitle.'),
          ),

          ListTile(
            leading: Image.asset('assets/images/cat.jpg.jpg'),
            title: Text('Photo 2'),
            subtitle: Text('Another photo with a subtitle.'),
          ),

          ListTile(
            leading: Image.asset('assets/images/cat.jpg.jpg'),
            title: Text('Photo 3'),
            subtitle: Text('Yet another photo with a subtitle.'),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Photos Uploaded Successfully!'),
                ),
              );
            },
            child: Text('Upload Photos'),
          ),
        ],
      ),
    );
  }
}
