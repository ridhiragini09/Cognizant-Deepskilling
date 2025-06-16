public class WordDocumentFactory extends DocumentFactory {
    @Override
    public MyDocument createDocument() {
        return new WordDocument();
    }
}
