import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ClientDetailsScreen.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({super.key});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  List<dynamic> users = [];
  List<dynamic> filteredUsers = [];
  bool showSearchBar = false;
  bool showScrollToTop = false;
  bool isLoading = false; // add isLoading state
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      final threshold = 200;
      final currentPosition = scrollController.position.pixels;
      setState(() {
        showScrollToTop = currentPosition > threshold;
      });
    });

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: showSearchBar
            ? Visibility(
                visible: true,
                child: TextField(
                  onChanged: (value) {
                    filterUsers(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search users',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              )
            : Text('Clients'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                showSearchBar = !showSearchBar;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () {
              _showFilterDialog(context); // show filter dialog on button press
            },
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Importer CSV'),
                value: 'import',
              ),
              PopupMenuItem(
                child: Text('Exporter CSV'),
                value: 'export',
              ),
            ],
            onSelected: (value) {
              if (value == 'import') {
                // handle import CSV option
              } else if (value == 'export') {
                // handle export CSV option
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: getData, // add onRefresh callback
            child: ListView.builder(
              controller: scrollController,
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                final user = filteredUsers[index];
                final name = user['name']['first'];
                final email = user['email'];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClientDetailsScreen(user: user),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(name),
                        subtitle: Text(email),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (showScrollToTop)
            Positioned(
              bottom: 16,
              right: 16,
              child: FloatingActionButton(
                onPressed: () {
                  scrollController.animateTo(
                    0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Icon(Icons.arrow_upward),
              ),
            ),
          if (isLoading) // show circular progress indicator while loading
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }

// \\\\\\\\\\\\

// \\\\\\\\\\\\\\\\\
// \\\\\\\\\\\\\\\\\

  void _showFilterDialog(BuildContext context) {
    String? filterFamille = 'famille 1';
    bool filterAvecCredit = false;
    bool filterBloque = false;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 200),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.redAccent,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          contentPadding: EdgeInsets.only(top: 12),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12, bottom: 4),
                    child: Text('Famille:'),
                  ),
                  SizedBox(
                    width: 200,
                    child: DropdownButtonFormField<String>(
                      value: filterFamille,
                      onChanged: (value) {
                        setState(() {
                          filterFamille = value;
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: OutlineInputBorder(),
                      ),
                      items: [
                        DropdownMenuItem(
                          value: 'famille 1',
                          child: Text('Famille 1'),
                        ),
                        DropdownMenuItem(
                          value: 'famille 2',
                          child: Text('Famille 2'),
                        ),
                        DropdownMenuItem(
                          value: 'famille 3',
                          child: Text('Famille 3'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CheckboxListTile(
                value: filterAvecCredit,
                onChanged: (value) {
                  setState(() {
                    filterAvecCredit = value!;
                  });
                },
                title: Text('Avec crédit'),
              ),
              CheckboxListTile(
                value: filterBloque,
                onChanged: (value) {
                  setState(() {
                    filterBloque = value!;
                  });
                },
                title: Text('Bloqué'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // handle filter submission
                // filterUsers();
                Navigator.pop(context);
              },
              child: Text('Apply'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

// \\\\\\\\\\\\\\\\\
// \\\\\\\\\\\\\\\\\

  void filterUsers(String query) {
    final lowercaseQuery = query.toLowerCase();
    setState(() {
      filteredUsers = users.where((user) {
        final name = user['name']['first'].toLowerCase();
        return name.contains(lowercaseQuery);
      }).toList();
    });
  }

  Future<void> getData() async {
    setState(() {
      isLoading = true; // set isLoading to true when refreshing
    });

    const url = 'https://randomuser.me/api/?results=50';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
      filteredUsers = users;
      isLoading = false; // set isLoading to false when done loading
    });
  }
}
