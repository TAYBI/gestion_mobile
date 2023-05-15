import 'package:flutter/material.dart';

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
          ],
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://example.com/avatar1.jpg'),
                ),
                title: Text('Mr. Name 1'),
                subtitle: Text('Payment: \$0.00\n\$0.00'),
                onTap: () {
                  // Handle card tap
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://example.com/avatar2.jpg'),
                ),
                title: Text('Mr. Name 2'),
                subtitle: Text('Payment: \$0.00\n\$0.00'),
                onTap: () {
                  // Handle card tap
                },
              ),
            ),
            // more cards if needed
          ],
        ));
  }
}
