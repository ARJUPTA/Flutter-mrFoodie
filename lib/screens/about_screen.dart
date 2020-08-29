import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  static const routeName = '/about-screen';

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  AppBar ourAppBar = AppBar(title: Text('About'),);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourAppBar,
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Container(
                width: double.infinity,
                height: (MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - ourAppBar.preferredSize.height)*0.32,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text('Mr. Foodie', style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.w700),),
                    Divider(),
                    SizedBox(height: (MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - ourAppBar.preferredSize.height)*0.01,),
                    Text("This app allows users to submit their reciepes and explore the reciepes submitted by others. \n \nThough this app is still not connected to server but i'll soon connect it to firebase and then it\'ll be in a proper working condition. \n\nBut that may take a while, as I'm currently working on another project."),
                  ],
                ),
              )
            ),
            Card(
              elevation: 5,
              child: Container(
                width: double.infinity,
                height: (MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - ourAppBar.preferredSize.height)*0.22,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text('About the Developer', style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.w700),),
                    Divider(),
                    SizedBox(height: (MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - ourAppBar.preferredSize.height)*0.01,),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        children: [
                          Icon(Icons.devices),
                          SizedBox(width: 10,),
                          Text('Ankit Kumar Sharma', style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      )
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        children: [
                          Icon(Icons.mail_outline),
                          SizedBox(width: 10,),
                          Linkify(
                            text: 'mailto:ankit.kumar.cse19@itbhu.ac.in',
                            linkStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.normal),
                            onOpen: (link) async {
                              if(await canLaunch(link.url))
                                await launch(link.url);
                              else
                                throw 'Could not launch $link';
                            },
                          )
                        ],
                      )
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        children: [
                          Icon(Icons.code),
                          SizedBox(width: 10,),
                          Linkify(
                            text: "https://www.github.com/AnonySharma",
                            linkStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.normal),
                            onOpen: (link) async {
                              if(await canLaunch(link.url))
                                await launch(link.url);
                              else
                                throw 'Could not launch $link';
                            },
                          )
                        ],
                      )
                    )
                  ],
                ),
              )
            )
          ]
        ),
      ),
    );
  }
}