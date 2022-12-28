import 'database_abs.dart';
import 'objectbox.g.dart';

class ObjectBoxDatabase<T> implements Database {
  Store? _store;
  Future<Store> getStore() async {
    return _store ??= await openStore();
  }

  Future<Box> getBox() async {
    final store = await getStore();
    return store.box<T>();
  }

  @override
  Future get(id) async {
    final box = await getBox();
    box.get(id);
  }

  @override
  Future getAll() async {
    final box = await getBox();
    return box.getAll();
  }

  @override
  Future post(data) async {
    final box = await getBox();
    box.put(data);
  }

  @override
  Future put(data) async {
    final box = await getBox();
    box.put(data);
  }

  @override
  Future remove(int id) async {
    final box = await getBox();
    box.remove(id);
  }
}
