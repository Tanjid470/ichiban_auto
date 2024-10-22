# Security Policy

 ```bash
class GoogleSheetInit{
  static const _credentials = r'''
  {
   YOUR_GOOGLE_API_KEY
  }
  ''';
  static const _spreadSheetId = YOUR_SHEET_ID;

  static final gSheets = GSheets(_credentials);
  late var spreadSheet;
  Future inti() async{
    try{
       spreadSheet = await gSheets.spreadsheet(_spreadSheetId);
    }
    catch(exception){
      log("Init error : $exception");
    }
  }
}
