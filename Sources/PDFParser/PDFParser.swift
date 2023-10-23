import PDFKit

public struct PDFParser {
    public var pagesCount: Int = 0
    
    private var document: PDFDocument?
    private let url: URL?
    
    public init(url: URL? = nil) {
        self.url = url
        if let url,
           let document = PDFDocument(url: url) {
            self.document = document
            self.pagesCount = document.pageCount
        }
    }
    
    public func getText(at page: Int) -> NSAttributedString? {
        guard let document,
              let page = document.page(at: page),
              let text = page.attributedString,
              !text.string.replacingOccurrences(of: " ", with: "").isEmpty else {
            return nil
        }
        
        return text
    }
    
    public func getPageView(at page: Int) -> UIImage? {
        guard let document,
              let page = document.page(at: page) else {
            return nil
        }
        return page.thumbnail(of: page.bounds(for: .mediaBox).size, for: .mediaBox)
    }
}
