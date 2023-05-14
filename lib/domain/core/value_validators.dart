import 'package:dartz/dartz.dart';
import 'package:times_wire/domain/core/failures.dart';
Either<ValueFailure<String>,String> validateMaxStringLegth(String input,int maxLength){
  if(input.length<=maxLength){
    return right(input);
  }else{
    return left(ValueFailure.exceedingLength(failedValue: input, max: maxLength));
  }
}
Either<ValueFailure<String>,String> validateMinStringLength(String input,int minLength){
  if(input.length>=minLength){
    return right(input);
  }else{
    return left(ValueFailure.shortLength(failedValue: input, min: minLength));
  }
}
Either<ValueFailure<String>, String> validateStringNotEmpty(String input){
if(input.trim().isNotEmpty){
  return right(input);
}else{
  return left(ValueFailure.empty(failedValue: input));
}
}
Either<ValueFailure<String>, String> validateSingleLine(String input) {
if(!input.contains("\n")){
return right(input);
}else{
  return left(ValueFailure.multiLine(failedValue: input));
}
}

// Either<ValueFailure<KtList<T>>,KtList<T>> validateMaxListLength<T>(KtList<T> input,int maxLength) {
//  if(input.size<=maxLength){
//    return right(input);
//  }else{
//    return left(ValueFailure.listTooLong(failedValue: input,max:maxLength));
//  }
// }
