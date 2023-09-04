abstract class UserRepository {
  Future<bool> signIn({required String email, required String password});
}
