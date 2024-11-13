import 'package:flutter/material.dart';
import 'package:manpromanpro_mobile/model/proyek.dart';
import 'package:manpromanpro_mobile/utils/reusable_widget.dart';
import 'package:manpromanpro_mobile/utils/jwt_utils.dart';

class ProyekScreen extends StatefulWidget {
  const ProyekScreen({super.key});

  @override
  State<ProyekScreen> createState() => _ProyekScreenState();
}

class _ProyekScreenState extends State<ProyekScreen> {
  Future<List<Proyek>?> fetchProyek() async {
    try {
      // TODO
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ManproManpro'),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  showLogoutDialog(context);
                },
                icon: const Icon(
                  Icons.logout_outlined,
                  size: 30,
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: Future.wait([fetchProyek(), getUsernameFromJwt()]),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.data == null) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const Padding(
                padding: EdgeInsets.all(12),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Proyek tidak ditemukan",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }

          // TODO
          String username = '';

          if (snapshot.data![0] == null) {
            return Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      Text.rich(TextSpan(
                        text: 'Hello, ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: '$username!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.blue.shade600)),
                        ],
                      )),
                      const SizedBox(height: 20),
                      const Text(
                        "Proyek tidak ditemukan",
                        style: TextStyle(fontSize: 16),
                      )
                    ])));
          } else {
            return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text.rich(TextSpan(
                        text: 'Hello, ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: '$username!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.blue.shade600)),
                        ],
                      )),
                      const SizedBox(height: 20), //
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data![0].length,
                        itemBuilder: (_, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5.0,
                                    offset: Offset(0, 3)),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // TODO
                              ],
                            ),
                          );
                        },
                      ),
                    ]));
          }
        },
      ),
    );
  }
}
