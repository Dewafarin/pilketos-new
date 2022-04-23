import 'package:flutter/material.dart';
import 'package:pilketos/shared/shared.dart';

class Kandidat extends StatefulWidget {
  const Kandidat({Key? key}) : super(key: key);

  @override
  _KandidatState createState() => _KandidatState();
}

class _KandidatState extends State<Kandidat> {
  List nama = [
    "SI A",
    "SI B",
    "SI C",
    "SI D",
    "SI E",
    "SI D",
    "SI E",
    "SI F",
    "SI G",
    "SI H"
  ];
  List kelas = [
    "XI RPL A",
    "XI RPL B",
    "XI RPL C",
    "XI RPL D",
    "XI RPL E",
    "XI RPL F",
    "XI RPL G",
    "XI RPL H",
    "XI RPL I",
    "XI RPL J",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Kandidat Ketua Osis',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: ListTile(
                        title: Text(
                          nama[index],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),

                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(kelas[index]),
                        ),
                        leading: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage("assets/images/user.jpg"),
                        ), //awalan pada circle image
                        trailing: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.0, vertical: 10.0),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            height: 30.0,
                            onPressed: () {},
                            color: Color(0xfffB33030),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Text(
                              'Vote',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) =>
                          EntryItem(
                        data[index],
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class Entry {
  final String title;
  final List<Entry> children;
  Entry(this.title, [this.children = const <Entry>[]]);
}

final List<Entry> data = <Entry>[
  Entry('Visi dan Misi', <Entry>[
    Entry('Visi', <Entry>[
      Entry(
          'Membentuk OSIS yang mampu mewadahi kreasi, inovasi, serta prestasi siswa di berbagai bidang dengan tetap menjunjung karakter berakhlak mulia.')
    ]),
    Entry('Misi', <Entry>[
      Entry(''' 
      1. Misi 1 
      2. Misi 2 
      3. Misi 3 
      4. Misi 4
      '''),
    ])
  ])
];

class EntryItem extends StatelessWidget {
  final Entry entry;

  const EntryItem(this.entry);

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(root.title, style: TextStyle(fontSize: 13.0)),
      );
    }

    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title,
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
