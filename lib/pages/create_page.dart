import 'package:bucket_list_provider/services/bucket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Create Bucket List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: "Enter what you want to do",
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  String job = textController.text;
                  if (job.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please enter something"),
                      ),
                    );
                  } else {
                    context.read<BucketService>().addBucket(job);
                    Navigator.pop(context);
                  }
                },
                child: Text("Add"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
