import Foundation

public enum LanguageString: String {
    case send
    case reject
    
    case emailPlaceholder
    case passwordPlaceholder
    case forgotPassword
    case logIn
    case loginDifferentMethods
    case loginFooterDescription
    
    case errorTitle
    
    case errorEmailEmptyDescription
    case errorInvalidEmailDescription
    case errorPasswordEmptyDescription
    case errorWrongPasswordDescription
    case errorUnknownTitleDescription
    case errorWeakPasswordDrescription
    
    case registerNameModalTitle
    case registerNameModalDescription
    case registerNameModalPlaceholder
    case registerNameModalEmptyDescription
    
    case joinARoomButton
    case createARoomButton
    
    case logout
    
    public var localized: String {
        return localize()
    }
}

private extension LanguageString {
    
    static let errorCopy: String = "**ERROR*COPY**"
    
    static let sourceNotFound = "sourceNotFound"
    
    func localize() -> String {
        let copy = getCopy(tryPrefered: true)
        guard copy != LanguageString.errorCopy else {
            let copy = getCopy(tryPrefered: false)
            guard copy != LanguageString.errorCopy else {
                showErrorNoCopy(for: self)
                return ""
            }
            return copy
        }
        guard !copy.isEmpty else {
            showErrorEmpty(for: self)
            return ""
        }
        return copy
    }
    
    func getCopy(tryPrefered: Bool) -> String {
        let bundle = Utils.currentBundle
        let copy = NSLocalizedString(self.rawValue,
                                     tableName: "Localizable",
                                     bundle: bundle,
                                     value: LanguageString.errorCopy,
                                     comment: "")
        return copy
    }
    
    func showErrorNoCopy(for key: LanguageString) {
        let lang: String = Locale.preferredLanguages.first ?? "?"
        print("Language: Key '\(key.rawValue)' not found for \(lang) language code...")
    }
    
    func showErrorEmpty(for key: LanguageString) {
        print("Language: Key '\(key.rawValue)' found, but its copy is empty...")
    }
}
