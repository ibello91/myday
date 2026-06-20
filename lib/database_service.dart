class DatabaseService {
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  // Create (update)
  Future<void> create({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final DatabaseReference ref = _firebaseDatabase.ref().child(path);
    await ref.set(data);
  }

  // Read
  Future<DataSnapshot?> read({required String path}) async {
    final DatabaseReference ref = _firebaseDatabase.ref().child(path);
    final DataSnapshot snapshot = await ref.get();
    return snapshot.exists ? snapshot : null;
  }

  /// Update
  Future<void> update({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final DatabaseReference ref = _firebaseDatabase.ref().child(path);
    await ref.update(data);
  }

  // Delete
  Future<void> delete({required String path}) async {
    final DatabaseReference ref = _firebaseDatabase.ref().child(path);
    await ref.remove();
  }
}

class FirebaseDatabase {
  FirebaseDatabase._();

  static final FirebaseDatabase instance = FirebaseDatabase._();

  DatabaseReference ref() => DatabaseReference('/');
}

class DatabaseReference {
  final String path;

  DatabaseReference(this.path);

  DatabaseReference child(String childPath) {
    final normalizedPath = path.endsWith('/')
        ? '$path$childPath'
        : '$path/$childPath';
    return DatabaseReference(normalizedPath);
  }

  Future<void> set(Map<String, dynamic> data) async {}

  Future<DataSnapshot> get() async => DataSnapshot(false);

  Future<void> update(Map<String, dynamic> data) async {}

  Future<void> remove() async {}
}

class DataSnapshot {
  final bool exists;

  DataSnapshot(this.exists);
}
