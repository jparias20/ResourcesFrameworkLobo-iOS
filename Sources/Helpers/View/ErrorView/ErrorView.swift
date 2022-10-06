import SwiftUI

public enum ErrorType {
    case emailEmpty
    case passwordEmpty
    case unknown
    case emailAlreadyInUse
    case invalidEmail
    case wrongPassword
    case weakPassword
    case nameEmpty
        
    var errorDescription: String {
        switch self {
        default:
            return LanguageString.errorTitle.localized
        }
    }
    
    var recoverySuggestion: String {
        switch self {
        case .emailEmpty:
            return LanguageString.errorEmailEmptyDescription.localized
            
        case .passwordEmpty:
            return LanguageString.errorPasswordEmptyDescription.localized
            
        case .invalidEmail:
            return LanguageString.errorInvalidEmailDescription.localized
            
        case .wrongPassword:
            return LanguageString.errorWrongPasswordDescription.localized
            
        case .weakPassword:
            return LanguageString.errorWeakPasswordDrescription.localized
            
        case .nameEmpty:
            return LanguageString.registerNameModalEmptyDescription.localized
            
        default:
            return LanguageString.errorUnknownTitleDescription.localized
        }
    }
}

struct ErrorView: View {
    
    private let buttonAction: CompletionBlock?
    private let error: ErrorType
    
    init(error: ErrorType, _ buttonAction: CompletionBlock?) {
        self.buttonAction = buttonAction
        self.error = error
    }
    
    var body: some View {
        ZStack {
            Colors.modalBackgroundColor.color
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                
                Images.errorIcon.image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.top, 30)
                
                Text(error.errorDescription)
                    .foregroundColor(Colors.baseTitle1ForegroundColor.color)
                    .font(.title)
                    .bold()

                Text(error.recoverySuggestion)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 8)
                    .font(.body)
                    .foregroundColor(Colors.baseTitle1ForegroundColor.color)
                
                
                RegularButtonView(title: LanguageString.close, theme: .reject) {
                    buttonAction?()
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 30)

            }.frame(width: self.mainViewFrame.width * 0.8)
            .background {
                Rectangle()
                    .fill(Colors.baseBackgroundColor.color)
                    .cornerRadius(Constants.regularCornerRadius)
                    .shadow(
                        color: Colors.modalShadowColor.color,
                        radius: Constants.regularShadowRadius
                    )
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Colors.baseBackgroundColor.color
                .edgesIgnoringSafeArea(.all)
            
            ErrorView(error: .emailEmpty, nil)
        }
        .preferredColorScheme(.dark)
        
        ZStack {
            Colors.baseBackgroundColor.color
                .edgesIgnoringSafeArea(.all)
            
            ErrorView(error: .emailEmpty, nil)
        }
        .preferredColorScheme(.light)
        
    }
}
