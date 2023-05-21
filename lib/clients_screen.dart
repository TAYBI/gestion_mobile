import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;

void request() async {
  var httpClient = new HttpClient();
  var ioClient = new IOClient(httpClient);
  var url = Uri.parse(
      'http://178.238.238.52:8084/OmagAPI/controllers/client/lire.php?myDB=omag_67_DEMO');
  var request = new http.Request('GET', url);
  request.headers.addAll({'Content-Type': 'application/json'});
  var response = await ioClient.send(request);

  if (response.statusCode == 200) {
    // Parse the Content-Type header
    var contentType = MediaType.parse(response.headers['content-type'] ?? '');

    // Check if the media type is correct
    if (contentType.mimeType == 'application/json') {
      // Request was successful, handle the response
      var responseBody = await response.stream.bytesToString();
      // ...
    } else {
      // Invalid media type, handle the error
      print('Invalid media type: ${contentType.mimeType}');
    }
  } else {
    // Request failed, handle the error
    print('Request failed with status: ${response.statusCode}');
  }
}

void main() {
  request();
}


// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void request() async {
//   var url = Uri.parse(
//       'http://178.238.238.52:8084/OmagAPI/controllers/client/lire.php?myDB=omag_67_DEMO');
//   var response = await http.get(
//     url,
//     headers: {'Content-Type': 'application/json'},
//   );

//   if (response.statusCode == 200) {
//     // Request was successful, handle the response
//     var responseBody = json.decode(response.body);
//     // ...
//   } else {
//     // Request failed, handle the error
//     print('Request failed with status: ${response.statusCode}');
//   }
// }

// class ClientsScreen extends StatelessWidget {
//   const ClientsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     request();

//     return MaterialApp(
//       title: "Clients",
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'Clients',
//           ),
//           centerTitle: true,
//         ),
//       ),
//     );
//   }
// }


// --------------------------------------------------------------------------------
// class ClientsScreen extends StatefulWidget {
//   @override
//   _ClientsScreenState createState() => _ClientsScreenState();
// }

// class _ClientsScreenState extends State<ClientsScreen> {
//   late List<dynamic> _data;
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }

//   Future<void> _fetchData() async {
//     try {
//       final response = await http.get(Uri.parse(
//           'http://178.238.238.52:8084/OmagAPI/controllers/client/lire.php?myDB=omag_67_DEMO'));
//       if (response.statusCode == 200) {
//         // setState(() {
//         _data = jsonDecode(response.body);
//         //   _isLoading = false;
//         // });
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (error) {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Clients'),
//       ),
//       body:
//           // _isLoading
//           //     ? Center(child: CircularProgressIndicator())
//           ListView.builder(
//         itemCount: _data.length,
//         itemBuilder: (context, index) {
//           final item = _data[index];
//           return Card(
//             child: InkWell(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => EditClient(),
//                   ),
//                 );
//               },
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       item['nom'],
//                       style: TextStyle(
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 8.0),
//                     Text(
//                       item['tel'],
//                       style: TextStyle(fontSize: 16.0),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// // -------------------------------------------------------------------




// fetchData() async {
//   final response = await http.get(Uri.parse(
//       'http://178.238.238.52:8084/OmagAPI/controllers/client/lire.php?myDB=omag_67_DEMO'));
//   if (response.statusCode == 200) {
//     List data = jsonDecode(response.body);
//     print(data);
//     return data;
//   } else {
//     print('Request failed with status: ${response.statusCode}.');
//     return [];
//   }
// }

// class DataSearch extends SearchDelegate<String> {
//   List<String> _data = ['Name 1', 'Name 2'];

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, '');
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     final results = _data.where((data) => data.contains(query)).toList();
//     return ListView.builder(
//       itemCount: results.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(results[index]),
//           onTap: () {
//             close(context, results[index]);
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final suggestionList =
//         _data.where((data) => data.startsWith(query)).toList();
//     return ListView.builder(
//       itemCount: suggestionList.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(suggestionList[index]),
//           onTap: () {
//             query = suggestionList[index];
//             showResults(context);
//           },
//         );
//       },
//     );
//   }
// }

// class ClientScreen extends StatelessWidget {
//   const ClientScreen({Key? key}) : super(key: key);

//   final avatar =
//       'https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Clients'),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               showSearch(context: context, delegate: DataSearch());
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.filter_alt),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: Icon(Icons.more_vert),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: ListView(
//         children: <Widget>[
//           Card(
//             elevation: 1,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(4),
//             ),
//             child: Padding(
//               padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
//               child: ExpansionTile(
//                 leading: CircleAvatar(
//                   backgroundImage: NetworkImage(avatar),
//                 ),
//                 title: Text(
//                   'Mr. Name 1',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 subtitle: Text('Payment: \$0.00\n\$0.00'),
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(top: 8),
//                     child: ListTile(
//                       title: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Text(
//                                   'Mobile:',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 12),
//                                 ),
//                                 SizedBox(width: 8),
//                                 Text('2355-59854-54',
//                                     style: TextStyle(fontSize: 12)),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//                             Row(
//                               children: [
//                                 Text(
//                                   "Chiffre d'affaire:",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 12),
//                                 ),
//                                 SizedBox(width: 8),
//                                 Text('0.00\$', style: TextStyle(fontSize: 12)),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//                             Row(
//                               children: [
//                                 Text(
//                                   'Adresse:',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 12),
//                                 ),
//                                 SizedBox(width: 8),
//                                 Text(
//                                   '123 Main St Anytown,',
//                                   style: TextStyle(fontSize: 12),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       trailing: IconButton(
//                         icon: Icon(Icons.visibility),
//                         onPressed: () {
//                           // Handle icon tap
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           ListView.builder(
//             itemCount: data.length,
//             itemBuilder: (BuildContext context, int index) {
//               if (index == 0) {
//                 fetchData(); // call the fetchData() function when the ListView is loaded
//               }
//               return ListTile(
//                 title: Text(data[index]['title']),
//                 subtitle: Text(data[index]['body']),
//               );
//             },
//           ),

//           Card(
//             elevation: 1,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(4),
//             ),
//             child: Padding(
//               padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
//               child: ExpansionTile(
//                 leading: CircleAvatar(
//                   backgroundImage: NetworkImage(avatar),
//                 ),
//                 title: Text(
//                   'Mr. Name 1',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 subtitle: Text('Payment: \$0.00\n\$0.00'),
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(top: 8),
//                     child: ListTile(
//                       title: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Text(
//                                   'Mobile:',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 12),
//                                 ),
//                                 SizedBox(width: 8),
//                                 Text('2355-59854-54',
//                                     style: TextStyle(fontSize: 12)),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//                             Row(
//                               children: [
//                                 Text(
//                                   "Chiffre d'affaire:",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 12),
//                                 ),
//                                 SizedBox(width: 8),
//                                 Text('0.00\$', style: TextStyle(fontSize: 12)),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//                             Row(
//                               children: [
//                                 Text(
//                                   'Adresse:',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 12),
//                                 ),
//                                 SizedBox(width: 8),
//                                 Text(
//                                   '123 Main St Anytown,',
//                                   style: TextStyle(fontSize: 12),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       trailing: IconButton(
//                         icon: Icon(Icons.visibility),
//                         onPressed: () {
//                           // Handle icon tap
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           Card(
//             elevation: 1,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(4),
//             ),
//             child: Padding(
//               padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
//               child: ExpansionTile(
//                 leading: CircleAvatar(
//                   backgroundImage: NetworkImage(avatar),
//                 ),
//                 title: Text(
//                   'Mr. Name 1',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 subtitle: Text('Payment: \$0.00\n\$0.00'),
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(top: 8),
//                     child: ListTile(
//                       title: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Text(
//                                   'Mobile:',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 12),
//                                 ),
//                                 SizedBox(width: 8),
//                                 Text('2355-59854-54',
//                                     style: TextStyle(fontSize: 12)),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//                             Row(
//                               children: [
//                                 Text(
//                                   "Chiffre d'affaire:",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 12),
//                                 ),
//                                 SizedBox(width: 8),
//                                 Text('0.00\$', style: TextStyle(fontSize: 12)),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//                             Row(
//                               children: [
//                                 Text(
//                                   'Adresse:',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 12),
//                                 ),
//                                 SizedBox(width: 8),
//                                 Text(
//                                   '123 Main St Anytown,',
//                                   style: TextStyle(fontSize: 12),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       trailing: IconButton(
//                         icon: Icon(Icons.visibility),
//                         onPressed: () {
//                           // Handle icon tap
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ClientInfoScreen()),
//               );
//             },
//             child: Card(
//               elevation: 1,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(4),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
//                 child: ExpansionTile(
//                   leading: CircleAvatar(
//                     backgroundImage: NetworkImage(avatar),
//                   ),
//                   title: Text(
//                     'Mr. Name 1',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   ),
//                   subtitle: Text('Payment: \$0.00\n\$0.00'),
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(top: 8),
//                       child: ListTile(
//                         title: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     'Mobile:',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 12),
//                                   ),
//                                   SizedBox(width: 8),
//                                   Text('2355-59854-54',
//                                       style: TextStyle(fontSize: 12)),
//                                 ],
//                               ),
//                               SizedBox(height: 8),
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Chiffre d'affaire:",
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 12),
//                                   ),
//                                   SizedBox(width: 8),
//                                   Text('0.00\$',
//                                       style: TextStyle(fontSize: 12)),
//                                 ],
//                               ),
//                               SizedBox(height: 8),
//                               Row(
//                                 children: [
//                                   Text(
//                                     'Adresse:',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 12),
//                                   ),
//                                   SizedBox(width: 8),
//                                   Text(
//                                     '123 Main St Anytown,',
//                                     style: TextStyle(fontSize: 12),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         trailing: GestureDetector(
//                           onTap: () {
//                             // setState(() {
//                             //   isExpanded = !isExpanded;
//                             // });
//                           },
//                           child: Icon(Icons.visibility),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // ExpansionTile(
//           //   leading: CircleAvatar(
//           //     backgroundImage: NetworkImage(avatar),
//           //   ),
//           //   title: Text(
//           //     'Mr. Name 2',
//           //     style: TextStyle(fontWeight: FontWeight.bold),
//           //   ),
//           //   subtitle: Text('Payment: \$0.00\n\$0.00'),
//           //   children: [
//           //     // Add more child widgets as needed
//           //   ],
//           // ),
//           // more ExpansionTiles if needed
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => EditClient(),
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
