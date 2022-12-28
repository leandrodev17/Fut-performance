abstract class Database<T> {
    Future getAll();
    Future get(int id);
    Future remove(int id);
    Future post(data);
    Future put(data);
}