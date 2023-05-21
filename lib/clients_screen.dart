import 'package:flutter/material.dart';
import 'client_screen.dart';
import 'edit_client_screen.dart';

class DataSearch extends SearchDelegate<String> {
  List<String> _data = ['Name 1', 'Name 2'];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _data.where((data) => data.contains(query)).toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList =
        _data.where((data) => data.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            query = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }
}

class ClientScreen extends StatelessWidget {
  const ClientScreen({Key? key}) : super(key: key);

  final avatar =
      'https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clients'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ExpansionTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(avatar),
                ),
                title: Text(
                  'Mr. Name 1',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Text('Payment: \$0.00\n\$0.00'),
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Mobile:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                SizedBox(width: 8),
                                Text('2355-59854-54',
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "Chiffre d'affaire:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                SizedBox(width: 8),
                                Text('0.00\$', style: TextStyle(fontSize: 12)),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  'Adresse:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '123 Main St Anytown,',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () {
                          // Handle icon tap
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ExpansionTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(avatar),
                ),
                title: Text(
                  'Mr. Name 1',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Text('Payment: \$0.00\n\$0.00'),
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Mobile:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                SizedBox(width: 8),
                                Text('2355-59854-54',
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "Chiffre d'affaire:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                SizedBox(width: 8),
                                Text('0.00\$', style: TextStyle(fontSize: 12)),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  'Adresse:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '123 Main St Anytown,',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () {
                          // Handle icon tap
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ExpansionTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(avatar),
                ),
                title: Text(
                  'Mr. Name 1',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Text('Payment: \$0.00\n\$0.00'),
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Mobile:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                SizedBox(width: 8),
                                Text('2355-59854-54',
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "Chiffre d'affaire:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                SizedBox(width: 8),
                                Text('0.00\$', style: TextStyle(fontSize: 12)),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  'Adresse:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '123 Main St Anytown,',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () {
                          // Handle icon tap
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClientInfoScreen()),
              );
            },
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: ExpansionTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(avatar),
                  ),
                  title: Text(
                    'Mr. Name 1',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text('Payment: \$0.00\n\$0.00'),
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Mobile:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  SizedBox(width: 8),
                                  Text('2355-59854-54',
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    "Chiffre d'affaire:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  SizedBox(width: 8),
                                  Text('0.00\$',
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    'Adresse:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    '123 Main St Anytown,',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            // setState(() {
                            //   isExpanded = !isExpanded;
                            // });
                          },
                          child: Icon(Icons.visibility),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // ExpansionTile(
          //   leading: CircleAvatar(
          //     backgroundImage: NetworkImage(avatar),
          //   ),
          //   title: Text(
          //     'Mr. Name 2',
          //     style: TextStyle(fontWeight: FontWeight.bold),
          //   ),
          //   subtitle: Text('Payment: \$0.00\n\$0.00'),
          //   children: [
          //     // Add more child widgets as needed
          //   ],
          // ),
          // more ExpansionTiles if needed
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditClient(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
