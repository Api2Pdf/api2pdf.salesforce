@isTest
public class Api2PdfControllerTest{

    @isTest
    public static void wkhtmlToPdfFromHtmlTest(){
    
        System.Test.setMock(HttpCalloutMock.class, new Api2PdfClientMockout());
        System.Test.startTest();
        
        Api2PdfController controller = new Api2PdfController ('Test');
        controller.wkhtmlToPdfFromHtml();
        System.Test.stopTest();       
        
        System.assertEquals(controller.PdfResponse.getSuccess(), true);
       
    }
    
    @isTest
    public static void wkhtmlToPdfFromHtmlWithOptionsTest(){
    
        System.Test.setMock(HttpCalloutMock.class, new Api2PdfClientMockout());
        System.Test.startTest();
        
        Api2PdfController controller = new Api2PdfController ('Test');
        controller.wkhtmlToPdfFromHtmlWithOptions();
        System.Test.stopTest();       
        
        System.assertEquals(controller.PdfResponse.getSuccess(), true);
       
    }
    
    
    @isTest
    public static void wkhtmlToPdfFromUrlTest(){
    
        System.Test.setMock(HttpCalloutMock.class, new Api2PdfClientMockout());
        System.Test.startTest();
        
        Api2PdfController controller = new Api2PdfController ('Test');
        controller.wkhtmlToPdfFromUrl();
        System.Test.stopTest();       
        
        System.assertEquals(controller.PdfResponse.getSuccess(), true);
       
    }
    
    @isTest
    public static void wkhtmlToPdfFromUrlWithOptionsTest(){
    
        System.Test.setMock(HttpCalloutMock.class, new Api2PdfClientMockout());
        System.Test.startTest();
        
        Api2PdfController controller = new Api2PdfController ('Test');
        controller.wkhtmlToPdfFromUrlWithOptions();
        System.Test.stopTest();       
        
        System.assertEquals(controller.PdfResponse.getSuccess(), true);
       
    }
    
    @isTest
    public static void headlessChromeFromHtmlTest(){
    
        System.Test.setMock(HttpCalloutMock.class, new Api2PdfClientMockout());
        System.Test.startTest();
        
        Api2PdfController controller = new Api2PdfController ('Test');
        controller.headlessChromeFromHtml();
        System.Test.stopTest();       
        
        System.assertEquals(controller.PdfResponse.getSuccess(), true);
       
    }
    
    @isTest
    public static void headlessChromeFromHtmlWithOptionsTest(){
    
        System.Test.setMock(HttpCalloutMock.class, new Api2PdfClientMockout());
        System.Test.startTest();
        
        Api2PdfController controller = new Api2PdfController ('Test');
        controller.headlessChromeFromHtmlWithOptions();
        System.Test.stopTest();       
        
        System.assertEquals(controller.PdfResponse.getSuccess(), true);
       
    }

    @isTest
    public static void headlessChromeFromUrlTest(){
    
        System.Test.setMock(HttpCalloutMock.class, new Api2PdfClientMockout());
        System.Test.startTest();
        
        Api2PdfController controller = new Api2PdfController ('Test');
        controller.headlessChromeFromUrl();
        System.Test.stopTest();       
        
        System.assertEquals(controller.PdfResponse.getSuccess(), true);
       
    }
    
    @isTest
    public static void headlessChromeFromUrlOptionsTest(){
    
        System.Test.setMock(HttpCalloutMock.class, new Api2PdfClientMockout());
        System.Test.startTest();
        
        Api2PdfController controller = new Api2PdfController ('Test');
        controller.headlessChromeFromUrlOptions();
        System.Test.stopTest();       
        
        System.assertEquals(controller.PdfResponse.getSuccess(), true);
       
    }
    
    @isTest
    public static void libreofficeConvertTest(){
    
        System.Test.setMock(HttpCalloutMock.class, new Api2PdfClientMockout());
        System.Test.startTest();
        
        Api2PdfController controller = new Api2PdfController ('Test');
        controller.libreofficeConvert();
        System.Test.stopTest();       
        
        System.assertEquals(controller.PdfResponse.getSuccess(), true);
       
    }
    
    @isTest
    public static void mergePdfTest(){
    
        System.Test.setMock(HttpCalloutMock.class, new Api2PdfClientMockout());
        System.Test.startTest();
        
        Api2PdfController controller = new Api2PdfController ('Test');
        controller.mergePdf();
        System.Test.stopTest();       
        
        System.assertEquals(controller.PdfResponse.getSuccess(), true);
       
    }
}