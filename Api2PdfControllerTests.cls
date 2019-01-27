@isTest
public class Api2PdfControllerTests {

    public static testMethod  void testApi2PdfController() {
      
        Api2PdfController controller = new Api2PdfController ();
       
        controller.headlessChromeFromHtml();

        System.assertNotEquals(controller.PdfUrl, '');
    }
}