import 'package:bucket_list_provider/model/bucket_model.dart';
import 'package:bucket_list_provider/pages/create_page.dart';
import 'package:bucket_list_provider/services/bucket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BucketService>(
      builder: (context, bucketService, child) {
        List<Bucket> bucketList = bucketService.buckets;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Screen"),
          ),
          body: ListView.builder(
            itemCount: bucketList.length,
            itemBuilder: (context, index) {
              bool isDone = bucketList[index].isDone;
              return ListTile(
                leading: Text(
                  bucketList[index].job,
                  style: TextStyle(
                    fontSize: 20,
                    color: isDone ? Colors.grey : Colors.black,
                    decoration: isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    // context.read<BucketService>().deleteBucket(index);
                    bucketService.deleteBucket(index);
                  },
                  icon: Icon(Icons.delete),
                ),
                onTap: () {
                  bucketService.updateIsDone(index);
                },
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CreatePage();
                  },
                ),
              );
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
