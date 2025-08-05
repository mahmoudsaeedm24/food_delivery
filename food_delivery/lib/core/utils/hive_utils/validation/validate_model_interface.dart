abstract class ValidateModelInterface<T> {
  bool isValid(T item);

  List<T> validateItems(List<T> items){
    return items.where(isValid).toList();
  }

  Future<List<T>> loadValidateItems(String boxName);
}
