
import '../../core/models/package_model.dart';
import 'package_list_repository.dart';

class PackageListController{
PackageListRepository _packageListRepository;
PackageResponse? _packageResponse;
  PackageListController(this._packageListRepository);


       Future<PackageResponse?> getPackages() async {
   
         _packageResponse= await _packageListRepository.getPackages();



  }
}