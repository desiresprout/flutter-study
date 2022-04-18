import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'edit.dart';
import 'package:flutter_app/database/db.dart';
import 'package:flutter_app/database/memo.dart';
import 'package:flutter_app/screens/view.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 30, top: 30, bottom: 20),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "메모메모",
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.blue,
                  ),
                ),
              )),
          Expanded(child: memoBuilder(context))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => EditPage()));
        },
        tooltip: '메모를 추가하려면 클릭하세요',
        label: Text("메모 추가"),
        icon: Icon(Icons.add),
      ),
    );
  }

  Future<List<Memo>> loadMemo() async {
    DBHelper dbHelper = DBHelper();
    return await dbHelper.memos();
  }

  Future<void> deleteMemo(memoID) async {
    DBHelper dbHelper = DBHelper();
    await dbHelper.deleteMemo(memoID);
  }

  void showAlertDialog(BuildContext context) async {
    String result = await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('삭제 경고'),
          content: Text("정말 삭제하시겠습니까?"),
          actions: <Widget>[
            TextButton(
              child: Text('삭제'),
              onPressed: () {
                Navigator.pop(context, "삭제");
              },
            ),
            TextButton(
              child: Text('취소'),
              onPressed: () {
                Navigator.pop(context, "취소");
              },
            ),
          ],
        );
      },
    );
  }

  Widget memoBuilder(BuildContext pageContext) {
    return FutureBuilder<List<Memo>>(
      builder: (context, snap) {
        if (snap.data == null || snap.data!.isEmpty) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              '지금 바로 "메모 추가" 버튼을 눌러\n새로운 메모를 추가해보세요!\n\n\n\n\n\n\n\n\n',
              style: TextStyle(fontSize: 15, color: Colors.blueAccent),
              textAlign: TextAlign.center,
            ),
          );
        }
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(20),
          itemCount: snap.data!.length,
          itemBuilder: (context, index) {
            Memo memo = snap.data![index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    pageContext,
                    CupertinoPageRoute(
                        builder: (context) => ViewPage(id: memo.id)));
              },
              onLongPress: () {
                setState(() {
                  showAlertDialog(pageContext);
                  // deleteMemo(memo.id);
                });
              },
              child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            memo.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            memo.text,
                            style: TextStyle(fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            "최종 수정 시간: " + memo.editTime.split('.')[0],
                            style: TextStyle(fontSize: 11),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    border: Border.all(
                      color: Colors.blue,
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(color: Colors.lightBlue, blurRadius: 3)
                    ],
                    borderRadius: BorderRadius.circular(12),
                  )),
            );
          },
        );
      },
      future: loadMemo(),
    );
  }
}
