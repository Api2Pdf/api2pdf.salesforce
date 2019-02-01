@isTest
public class Api2PdfClientTest{
    @isTest
    public static void wkhtmlToPdfFromHtmlTest(){
    
        System.Test.setMock(HttpCalloutMock.class, new Api2PdfClientMockout());
        System.Test.startTest();
        
        Api2PdfClient a2pClient = new Api2PdfClient('Test');
        Api2PdfResponse res = a2pClient.wkhtmlToPdfFromHtml('<p>test</p>', true, 'test.pdf');
        System.Test.stopTest();       
        
        System.assertEquals(res.getSuccess(), true);
       
    }
    
    @isTest
    public static void wkhtmlToPdfFromHtmlWithOptionsTest(){
    
        System.Test.setMock(HttpCalloutMock.class, new Api2PdfClientMockout());
        System.Test.startTest();
        
        Api2PdfClient a2pClient= new Api2PdfClient('Test');
        Map<String, String> options = new Map<String, String>();
        options.put('orientation', 'landscape');
        options.put('pageSize', 'A4');
        Api2PdfResponse res = a2pClient.wkhtmlToPdfFromHtml('<p>test</p>', true, 'test.pdf', options);
        System.Test.stopTest();       
        
        System.assertEquals(res.getSuccess(), true);
       
    }
    
    @isTest
    public static void wkhtmlToPdfFromUrlTest(){
    
        System.Test.setMock(HttpCalloutMock.class, new Api2PdfClientMockout());
        System.Test.startTest();
        
        Api2PdfClient a2pClient= new Api2PdfClient('Test');
        Api2PdfResponse res = a2pClient.wkhtmlToPdfFromUrl('https://www.google.com', true, 'test.pdf');
        System.Test.stopTest();       
        
        System.assertEquals(res.getSuccess(), true);
       
    }
    
    @isTest
    public static void wkhtmlToPdfFromUrlWithOptionsTest(){
    
        System.Test.setMock(HttpCalloutMock.class, new Api2PdfClientMockout());
        System.Test.startTest();
        
        Api2PdfClient a2pClient= new Api2PdfClient('Test');
        Map<String, String> options = new Map<String, String>();
        options.put('orientation', 'landscape');
        options.put('pageSize', 'A4');
        Api2PdfResponse res = a2pClient.wkhtmlToPdfFromUrl('https://www.google.com', true, 'test.pdf', options);      
        System.Test.stopTest();    
        System.assertEquals(res.getSuccess(), true);
       
    }
    
    @isTest
    public static void headlessChromeFromHtmlTest(){
    
        System.Test.setMock(HttpCalloutMock.class, new Api2PdfClientMockout());
        System.Test.startTest();
        
        Api2PdfClient a2pClient = new Api2PdfClient('Test');
        Api2PdfResponse res = a2pClient.headlessChromeFromHtml('<p>test</p>', true, 'test.pdf');
        System.Test.stopTest();       
        
        System.assertEquals(res.getSuccess(), true);
       
    }
    
    @isTest
    public static void headlessChromeFromHtmlWithOptionsTest(){
    
        System.Test.setMock(HttpCalloutMock.class, new Api2PdfClientMockout());
        System.Test.startTest();
        
        Api2PdfClient a2pClient= new Api2PdfClient('Test');
        Map<String, String> options = new Map<String, String>();
        options.put('orientation', 'landscape');
        options.put('pageSize', 'A4');
        Api2PdfResponse res = a2pClient.headlessChromeFromHtml('<p>test</p>', true, 'test.pdf', options);
        
        System.assertEquals(res.getSuccess(), true);
       
    }
    
    @isTest
    public static void headlessChromeFromUrlTest(){
    
        System.Test.setMock(HttpCalloutMock.class, new Api2PdfClientMockout());
        System.Test.startTest();
        
        Api2PdfClient a2pClient = new Api2PdfClient('Test');
        Api2PdfResponse res = a2pClient.headlessChromeFromUrl('https://www.google.com', true, 'test.pdf');
        System.Test.stopTest();       
        
        System.assertEquals(res.getSuccess(), true);
       
    }
    
     @isTest
    public static void headlessChromeFromUrlOptionsTest(){
    
        System.Test.setMock(HttpCalloutMock.class, new Api2PdfClientMockout());
        System.Test.startTest();
        
        Api2PdfClient a2pClient= new Api2PdfClient('Test');
        Map<String, String> options = new Map<String, String>();
        options.put('orientation', 'landscape');
        options.put('pageSize', 'A4');
        Api2PdfResponse res = a2pClient.headlessChromeFromUrl('https://www.google.com', true, 'test.pdf', options);
        
        System.assertEquals(res.getSuccess(), true);
       
    }
    
    @isTest
    public static void libreofficeConvertTest(){
    
        System.Test.setMock(HttpCalloutMock.class, new Api2PdfClientMockout());
        System.Test.startTest();
        
        Api2PdfClient a2pClient = new Api2PdfClient('Test');
        Api2PdfResponse res = a2pClient.libreofficeConvert('http://homepages.inf.ed.ac.uk/neilb/TestWordDoc.doc', true, 'test.pdf');
        System.Test.stopTest();       
        
        System.assertEquals(res.getSuccess(), true);
       
    }
    
    @isTest
    public static void mergePdfTest(){
    
        System.Test.setMock(HttpCalloutMock.class, new Api2PdfClientMockout());
        System.Test.startTest();
        
        Api2PdfClient a2pClient = new Api2PdfClient('Test');
        String[] urls = new List<String>();
        urls.add('http://www.orimi.com/pdf-test.pdf');
        urls.add('http://www.orimi.com/pdf-test.pdf');
        Api2PdfResponse res = a2pClient.mergePdf(urls, true, 'test.pdf');
        System.Test.stopTest();       
        
        System.assertEquals(res.getSuccess(), true);
       
    }
}