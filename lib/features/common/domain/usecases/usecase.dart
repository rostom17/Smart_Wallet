abstract class Usecase<ReturnType, Parameters> {
  Future<ReturnType> call(Parameters params);
}
