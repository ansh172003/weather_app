import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({super.key});

  // launchUrl(String url) async {
  //   if (await canLaunchUrl(Uri.parse(url))) {
  //     await launchUrl(url);
  //   } else {
  //     throw "Could not launch $url";
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Made with 🖤 by Ansh Goel",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Connect with me on",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _launchURLLinkedIn,
                icon: FaIcon(
                  FontAwesomeIcons.linkedin,
                  size: 16,
                ),
              ),
              IconButton(
                onPressed: _launchURLMail,
                icon: Icon(
                  Icons.mail,
                  size: 20,
                ),
              ),
              IconButton(
                onPressed: _launchURLInstagram,
                icon: FaIcon(
                  FontAwesomeIcons.instagram,
                  size: 16,
                ),
              ),
            ],
          ),
          Text(
            "Special thanks to Rivaan for tutorial",
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}

_launchURLMail() async {
  const url = 'mailto:ansh172003@gmail.com';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLLinkedIn() async {
  const url = 'https://www.linkedin.com/in/ansh172003/';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLInstagram() async {
  const url = 'https://www.instagram.com/ansh.g.17/';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
