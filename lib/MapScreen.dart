import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MapScreen extends StatelessWidget {
  final double latitude;
  final double longitude;

  MapScreen({required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    String htmlContent = '''
      <!DOCTYPE html>
      <html>
        <head>
          <title>Leaflet.js Map</title>
          <meta charset="utf-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.7.1/leaflet.css" />
          <style>
            html, body, #map {
              height: 100%;
              margin: 0;
              padding: 0;
            }
          </style>
        </head>
        <body>
          <div id="map"></div>

          <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.7.1/leaflet.js"></script>
          <script>
            var latitude = $latitude;
            var longitude = $longitude;

            var map = L.map('map').setView([latitude, longitude], 13);

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
              attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors',
              maxZoom: 18,
            }).addTo(map);

            L.marker([latitude, longitude]).addTo(map);
          </script>
        </body>
      </html>
    ''';

    return InAppWebView(
      initialData: InAppWebViewInitialData(data: htmlContent),
      // ),
    );
  }
}
