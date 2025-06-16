public class PdfDocumentFactory extends DocumentFactory {
    @Override
    public MyDocument createDocument() {
        return new PdfDocument();
    }
}
