public class Api2PdfSettingsController{
  
  public String ApiKey{get;set;}
  
  public Api2PdfSettingsController(){
     Api2PdfConfig__c setting = Api2PdfConfig__c.getOrgDefaults();
     ApiKey = setting.Api_Key__c;
  }
  
  public void saveApiKey(){
      Api2PdfConfig__c setting = Api2PdfConfig__c.getOrgDefaults();
      setting.Api_Key__c = ApiKey;
      upsert setting;
  }

}