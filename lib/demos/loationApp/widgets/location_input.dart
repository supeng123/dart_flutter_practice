import 'package:flutter/material.dart';
import 'package:location/location.dart';
class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getCurrentUseLocation() async {
    final locData = await Location().getLocation();
    print(locData.latitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 170,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(border: Border.all(width:1, color: Colors.grey)),
            child: _previewImageUrl == null
                ? Text(
                    'no location presenting',
                    textAlign: TextAlign.center,
                  )
                : Image.network(
                    _previewImageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.location_on),
              label: Text('Current location'),
              textColor: Theme.of(context).primaryColor,
              onPressed: _getCurrentUseLocation,
            ),
            FlatButton.icon(
              icon: Icon(Icons.location_on),
              label: Text('Select on Map'),
              textColor: Theme.of(context).primaryColor,
              onPressed: () {
                
              },
            )
          ],
        )
      ],
    );
  }
}
