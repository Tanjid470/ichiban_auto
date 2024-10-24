# Security Policy
*Avoiding pushing Google credentials to GitHub for security reasons. In the class I attached, ensure that the credentials (e.g., API keys) are stored securely. Instead of hardcoding them, use environment variables or secret management services to inject them dynamically. This prevents accidental exposure of sensitive information when sharing or pushing code to repositories like GitHub.*
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
