public class ExcelDocumentFactory extends DocumentFactory {
    @Override
    public MyDocument createDocument() {
        return new ExcelDocument();
    }
}
