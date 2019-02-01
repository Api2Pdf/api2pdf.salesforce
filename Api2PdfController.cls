public with sharing class Api2PdfController {
    
    
    
    private Api2PdfClient a2pClient = null;
    public String PdfUrl {get;set;}
    public Api2PdfResponse PdfResponse {get;set;}
    public string ApiKeyForTest{get;set;}
    
    public Api2PdfController (){
        Api2PdfConfig__c setting = Api2PdfConfig__c.getOrgDefaults();
        a2pClient = new Api2PdfClient(setting.Api_Key__c);
    }
    
    public Api2PdfController (string apiKey){
        a2pClient = new Api2PdfClient(apiKey);
    }

    public void wkhtmlToPdfFromHtml(){
        PdfResponse = a2pClient.wkhtmlToPdfFromHtml('<p>test</p>', true, 'test.pdf');
        PdfUrl= PdfResponse.getPdf();
    }

     public void wkhtmlToPdfFromHtmlWithOptions(){
        Map<String, String> options = new Map<String, String>();
        options.put('orientation', 'landscape');
        options.put('pageSize', 'A4');
        PdfResponse = a2pClient.wkhtmlToPdfFromHtml('<p>test</p>', true, 'test.pdf', options);
        PdfUrl= PdfResponse.getPdf();
    }

    public void wkhtmlToPdfFromUrl(){
        PdfResponse = a2pClient.wkhtmlToPdfFromUrl('https://www.google.com', true, 'test.pdf');
        PdfUrl= pdfResponse.getPdf();
    }

    public void wkhtmlToPdfFromUrlWithOptions(){
        Map<String, String> options = new Map<String, String>();
        options.put('orientation', 'landscape');
        options.put('pageSize', 'A4');
        PdfResponse = a2pClient.wkhtmlToPdfFromUrl('https://www.google.com', true, 'test.pdf', options);
        PdfUrl= PdfResponse.getPdf();
    }

    public void headlessChromeFromHtml(){
        PdfResponse = a2pClient.headlessChromeFromHtml('<p>test</p>', true, 'test.pdf');
        PdfUrl= PdfResponse.getPdf();
    }

    public void headlessChromeFromHtmlWithOptions(){
        Map<String, String> options = new Map<String, String>();
        options.put('orientation', 'landscape');
        options.put('pageSize', 'A4');
        PdfResponse = a2pClient.headlessChromeFromHtml('<p>test</p>', true, 'test.pdf', options);
        PdfUrl= PdfResponse.getPdf();
    }

    public void headlessChromeFromUrl(){
        PdfResponse = a2pClient.headlessChromeFromUrl('https://www.google.com', true, 'test.pdf');
        PdfUrl= pdfResponse.getPdf();
    }

    public void headlessChromeFromUrlOptions(){
        Map<String, String> options = new Map<String, String>();
        options.put('orientation', 'landscape');
        options.put('pageSize', 'A4');
        PdfResponse = a2pClient.headlessChromeFromUrl('https://www.google.com', true, 'test.pdf', options);
        PdfUrl= PdfResponse.getPdf();
    }

     public void libreofficeConvert(){
        PdfResponse = a2pClient.libreofficeConvert('http://homepages.inf.ed.ac.uk/neilb/TestWordDoc.doc', true, 'test.pdf');
        PdfUrl= PdfResponse.getPdf();
    }

     public void mergePdf(){
        String[] urls = new List<String>();
        urls.add('http://www.orimi.com/pdf-test.pdf');
        urls.add('http://www.orimi.com/pdf-test.pdf');
        PdfResponse = a2pClient.mergePdf(urls, true, 'test.pdf');
        PdfUrl= PdfResponse.getPdf();
    }

}