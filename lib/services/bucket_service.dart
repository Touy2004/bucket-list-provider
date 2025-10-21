import 'package:bucket_list_provider/model/bucket_model.dart';
import 'package:flutter/material.dart';

class BucketService extends ChangeNotifier {
  final List<Bucket> _buckets = [
    Bucket("a", true),
    Bucket("b", false),
    Bucket("c", true),
    Bucket("d", false),
  ];

  get buckets => _buckets;

  void deleteBucket(int index) {
    _buckets.removeAt(index);
    notifyListeners();
  }

  void updateIsDone(int index) {
    _buckets[index].isDone = !_buckets[index].isDone;
    notifyListeners();
  }

  void addBucket(String job) {
    Bucket newBucket = Bucket(job, false);
    _buckets.add(newBucket);
    notifyListeners();
  }
}
