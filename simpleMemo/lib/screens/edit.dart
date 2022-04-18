import 'package:flutter/material.dart';
import 'package:flutter_app/database/db.dart';
import 'package:flutter_app/database/memo.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class EditPage extends StatelessWidget {
  String title = '';
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
        IconButton(onPressed: saveDB, icon: const Icon(Icons.save))
      ]),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              onChanged: (String title) {
                this.title = title;
              },
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                // border: OutlineInputBorder(),
                hintText: "제목을 적어주세요",
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            TextField(
              onChanged: (String text) {
                this.text = text;
              },
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                // border: OutlineInputBorder(),
                hintText: "제목을 적어주세요",
              ),
            ),
          ],
        ),
      ),
    );
  }

  String strToSha512(String text) {
    var bytes = utf8.encode(text);
    var digest = sha1.convert(bytes);
    return digest.toString();
  }

  Future<void> saveDB() async {
    DBHelper sd = DBHelper();

    var memo = Memo(
      id: strToSha512(DateTime.now().toString()),
      title: this.title,
      text: this.text,
      createTime: DateTime.now().toString(),
      editTime: DateTime.now().toString(),
    );

    await sd.insertMemo(memo);

    print(await sd.memos());
  }
}
