public virtual class Api2PdfRequestModelBase{
    public Boolean InlinePdf{get;set;}
    public String FileName{get;set;}
    public Map<String, String> options = new Map<String, String>();
}