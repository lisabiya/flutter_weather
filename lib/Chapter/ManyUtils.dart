import 'dart:async';
import 'dart:io';

import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';


void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future getImage(ChangeImage change) async {
  File image = await ImagePicker.pickImage(source: ImageSource.gallery);
  change(image);
}

typedef ChangeImage(File _image);

typedef RefreshView();