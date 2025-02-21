// ignore_for_file: prefer_const_constructors

import 'dart:convert'; // For JSON parsing
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Books List',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'Baskerville',
      ),
      home: BooksListScreen(),
    );
  }
}

class BooksListScreen extends StatefulWidget {
  @override
  _BooksListScreenState createState() => _BooksListScreenState();
}

class _BooksListScreenState extends State<BooksListScreen> {
  // Static JSON data for the books
  final String jsonData = '''
  [
  {
    "userId": 1,
    "id": 1,
    "title": "The Great Gatsby",
    "body": "A story about the mysterious Jay Gatsby and his unrelenting love for Daisy Buchanan.",
    "image_url": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmkHKwNvkL0uA9AC7Xie-PVEImYpyLiYyN_g&s",
    "author": {"name": "Alice Johnson", "email": "alice@example.com"}
  },
  {
    "userId": 2,
    "id": 2,
    "title": "To Kill a Mockingbird",
    "body": "A gripping novel about racial injustice in the Deep South, seen through the eyes of Scout Finch.",
    "image_url": "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1612238791i/56916837.jpg",
    "author": {"name": "Bob Smith", "email": "bob@example.com"}
  },
  {
    "userId": 3,
    "id": 3,
    "title": "1984",
    "body": "A dystopian novel depicting a totalitarian regime that controls every aspect of life.",
    "image_url": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxibw6d9pEQ78A-DPrxghpZIcLyqEJ7ZavJodkkrpyEEEU2MhI80cyQFXCtYfIcp7Loow&usqp=CAU",
    "author": {"name": "Charlie Brown", "email": "charlie@example.com"}
  },
  {
    "userId": 4,
    "id": 4,
    "title": "Pride and Prejudice",
    "body": "A romantic novel exploring the themes of love, reputation, and class distinctions.",
    "image_url": "https://rukminim2.flixcart.com/image/850/1000/kkec4280/book/d/h/d/pride-prejudice-original-imafzra6pfewjjwb.jpeg?q=20&crop=false",
    "author": {"name": "Diana Prince", "email": "diana@example.com"}
  },
  {
    "userId": 5,
    "id": 5,
    "title": "Moby-Dick",
    "body": "The thrilling tale of Captain Ahab's obsessive quest to hunt the great white whale.",
    "image_url": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTl4pxbBl0oV5KqSOYnRjZmM-pE--gntwggGw&s",
    "author": {"name": "Ethan Hunt", "email": "ethan@example.com"}
  },
  {
    "userId": 6,
    "id": 6,
    "title": "The Hobbit",
    "body": "A fantastical journey of Bilbo Baggins as he sets off on an adventure with dwarves.",
    "image_url": "https://upload.wikimedia.org/wikipedia/en/b/b3/The_Hobbit-_An_Unexpected_Journey.jpeg",
    "author": {"name": "Fiona Gallagher", "email": "fiona@example.com"}
  },
  {
    "userId": 7,
    "id": 7,
    "title": "War and Peace",
    "body": "An epic historical novel that intertwines the lives of five families during the Napoleonic Wars.",
    "image_url": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXlBdgOc4kUHOboqtlcS91SLy--JYj2N9zEg&s",
    "author": {"name": "George Lucas", "email": "george@example.com"}
  },
  {
    "userId": 8,
    "id": 8,
    "title": "The Catcher in the Rye",
    "body": "A coming-of-age novel following the experiences of the rebellious Holden Caulfield.",
    "image_url": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSM4NToGqFGG0WzWr58n9i_zcGehrIrbU1Saw&s",
    "author": {"name": "Hannah Baker", "email": "hannah@example.com"}
  },
  {
    "userId": 9,
    "id": 9,
    "title": "Brave New World",
    "body": "A futuristic novel that explores a world of genetic engineering and mind control.",
    "image_url": "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1685133828i/162412555.jpg",
    "author": {"name": "Ian Malcolm", "email": "ian@example.com"}
  },
  {
    "userId": 10,
    "id": 10,
    "title": "Frankenstein",
    "body": "A gothic novel about a scientist who creates a living creature, leading to unforeseen consequences.",
    "image_url": "https://rukminim2.flixcart.com/image/750/900/xif0q/book/n/j/v/frankenstein-original-imahfj8e5nqsgmta.jpeg?q=20&crop=false",
    "author": {"name": "Jessica Jones", "email": "jessica@example.com"}
  }
]
  ''';

  List<Map<String, dynamic>> books = [];
  List<Map<String, dynamic>> filteredBooks = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    List<dynamic> booksJson = json.decode(jsonData);
    books = List<Map<String, dynamic>>.from(booksJson);
    filteredBooks = books;

    searchController.addListener(() {
      filterBooks();
    });
  }

  void filterBooks() {
    setState(() {
      filteredBooks = books
          .where((book) => book['title']
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow[50], // Light pastel yellow background
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 70.0,
                  bottom:
                      21.0), // Specific padding for top, bottom, left, and right
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search for a book...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredBooks.length,
                physics: BouncingScrollPhysics(), // Smooth scrolling effect
                itemBuilder: (context, index) {
                  final book = filteredBooks[index];
                  return MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        // On hover, you can change color or other properties
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        // On hover exit, reset the effect
                      });
                    },
                    child: Card(
                      margin: EdgeInsets.all(8.0),
                      elevation: 4.0,
                      color: Colors.yellow[50],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        leading: Image.network(
                          book['image_url'],
                          fit: BoxFit.contain,
                          height: 100,
                          width: 100,
                        ),
                        title: Text(
                          book['title'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          '${book['body']}\nBy: ${book['author']['name']}',
                          style: TextStyle(fontSize: 14),
                        ),
                        isThreeLine: true,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  book['title'],
                                  style: TextStyle(fontFamily: 'Baskerville'),
                                ),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.network(book['image_url']),
                                    SizedBox(height: 8.0),
                                    Text(book['body']),
                                    SizedBox(height: 8.0),
                                    Text('Author: ${book['author']['name']}'),
                                    SizedBox(height: 8.0),
                                    Text(
                                        'Email: ${book['author']['email']}'), // Added email here
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
