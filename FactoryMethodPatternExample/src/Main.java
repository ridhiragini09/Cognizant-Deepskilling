public class Main {
    public static void main(String[] args) {
        // Word Document
        DocumentFactory wordFactory = new WordDocumentFactory();
        MyDocument wordDoc = wordFactory.createDocument();
        wordDoc.open();

        // PDF Document
        DocumentFactory pdfFactory = new PdfDocumentFactory();
        MyDocument pdfDoc = pdfFactory.createDocument();
        pdfDoc.open();

        // Excel Document
        DocumentFactory excelFactory = new ExcelDocumentFactory();
        MyDocument excelDoc = excelFactory.createDocument();
        excelDoc.open();
    }
}
