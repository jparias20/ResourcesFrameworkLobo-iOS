import SwiftUI

fileprivate extension View {
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

public struct RegularButtonView: View {
    
    public enum Theme {
        case accept
        case reject
        
        var backgroundColor: Color {
            switch self {
            case .accept:
                return Colors.submitButtonBackgroundColor.color
            case .reject:
                return Colors.rejectButtonBackgroundColor.color
            }
        }
        
        var foregroundColor: Color {
            switch self {
            case .accept:
                return Colors.submitButtonForegroundColor.color
            case .reject:
                return Colors.rejectButtonForegroundColor.color
            }
        }
    }
    
    private let title: LanguageString
    private let callback: CompletionBlock
    private let theme: Theme
    
    public init(title: LanguageString,
                theme: Theme = .accept,
                callback: @escaping CompletionBlock) {
        
        self.title = title
        self.theme = theme
        self.callback = callback
    }
    
    public var body: some View {
        Button {
            hideKeyboard()
            callback()
        } label: {
            Text(title.localized)
                .bold()
                .frame(maxWidth: .infinity)
                .frame(height: Constants.regularHeight)
                .foregroundColor(theme.foregroundColor)
                .background(theme.backgroundColor)
                .cornerRadius(Constants.regularCornerRadius)
        }
    }
}

struct RegularButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RegularButtonView(title: LanguageString.logIn, callback: {})
            .previewLayout(.fixed(width: 320, height: 100))
    }
}
