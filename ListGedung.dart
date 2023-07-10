import 'package:flutter/material.dart';
import 'package:panjiartamasinaga/kelompok/ListGedungProvider.dart';
import 'package:panjiartamasinaga/kelompok/hotel1.dart';
import 'package:provider/provider.dart';

class ListGedungScreen extends StatefulWidget {
  const ListGedungScreen({super.key});

  @override
  State<ListGedungScreen> createState() => _ListGedungScreenState();
}

class _ListGedungScreenState extends State<ListGedungScreen> {
  @override
  void initState() {
    Future.microtask(() {
      Provider.of<ListGedungProvider>(context, listen: false).initialData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "List Gedung",
          ),
          actions: [
            menuList(context),
          ],
        ),
        body: ListView(
          children: [
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              height: 40,
              color: Color.fromARGB(255, 221, 206, 206),
              child: const Center(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Cari Gedung', prefixIcon: Icon(Icons.search)),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputChip(
                  label: Text("ulangtahun"),
                  selectedColor: Colors.blue,
                ),
                InputChip(label: Text("seminar")),
                InputChip(label: Text("wedding")),
                InputChip(label: Text("lainnya"))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: body(context),
            ),
          ],
        ));
  }

  menuList(BuildContext context) {
    final prov = Provider.of<ListGedungProvider>(context);

    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            child: ListTile(
              onTap: () => prov.ubahList('hp'),
              leading: const Icon(Icons.phone),
              title: const Text('HP'),
            ),
          ),
          const PopupMenuDivider(),
          PopupMenuItem(
            child: ListTile(
              onTap: () {
                print('laptop');
                prov.ubahList('laptop');
                Navigator.pop(context);
              },
              leading: const Icon(Icons.laptop),
              title: const Text('Laptop'),
            ),
          ),
        ];
      },
    );
  }

  body(BuildContext context) {
    final prov = Provider.of<ListGedungProvider>(context);

    if (prov.data == null) {
      return const CircularProgressIndicator();
    } else {
      return ListView(
          shrinkWrap: true,
          children: List.generate(prov.data["data"]!.length, (index) {
            var item = prov.data['data']![index];
            return Column(children: [
              Card(
                // elevation: 0,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: Image.network(
                        item['img'],
                        height: 90,
                      ),
                      title: Text(
                        item['model'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        item['desc'].toString().length >= 100
                            ? item['desc'].toString().substring(0, 100) +
                                "...read more"
                            : item['desc'],
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 12),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.black,
                            ),
                            Text(item['developer'],
                                style: TextStyle(color: Colors.black))
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Rp. ${item['price'].toString()},-',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Rating ${item['rating'].toString()}'),
                          ],
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => (Hotel1())));
                              },
                              child: Text(
                                "Selengkapnya...",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ]);
          }));
    }
  }
}
