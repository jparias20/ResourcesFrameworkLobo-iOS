import SwiftUI

public struct RegularTextFieldView: View {
    
    public struct Model: Hashable {
        let leftIcon: Image?
        let rightIcon: Image?
        let placeHolder: LanguageString
        let textContentType: UITextContentType
        let keyboardType: UIKeyboardType
        
        @Binding
        var inputText: String
        
        public init(leftIcon: Image? = Images.email.image,
                    rightIcon: Image? = nil,
                    textContentType: UITextContentType = .emailAddress,
                    keyboardType: UIKeyboardType = .emailAddress,
                    placeHolder: LanguageString,
                    inputText: Binding<String>) {
            
            self.leftIcon = leftIcon
            self.rightIcon = rightIcon
            self.textContentType = textContentType
            self.keyboardType = keyboardType
            self.placeHolder = placeHolder
            self._inputText = inputText
        }
        
        public static func == (lhs: RegularTextFieldView.Model, rhs: RegularTextFieldView.Model) -> Bool {
            lhs.placeHolder == rhs.placeHolder
        }
        
        public func hash(into hasher: inout Hasher) {
            return hasher.combine(placeHolder)
        }
    }
    
    @State
    private var model: Model
    
    public init(with model: Model) {
        self.model = model
    }
    
    public var body: some View {
        
        HStack {
            if let leftIcon = model.leftIcon {
                leftIcon
                    .foregroundColor(Colors.baseTitle1ForegroundColor.color)
            }
            
            TextField("", text: model.$inputText)
                .placeholder(when: model.inputText.isEmpty) {
                    Text(model.placeHolder.localized).foregroundColor(Colors.baseTitle2ForegroundColor.color)
                }
                .foregroundColor(Colors.baseTitle1ForegroundColor.color)
                .textContentType(model.textContentType)
                .keyboardType(model.keyboardType)
                .autocapitalization(.none)
                .submitLabel(.done)
                .disableAutocorrection(true)
            
            if let rightIcon = model.rightIcon {
                rightIcon
                    .foregroundColor(Colors.baseTitle1ForegroundColor.color)
            }
        }
        .padding()
        .frame(height: Constants.regularHeight)
        .background {
            RoundedRectangle(cornerRadius: Constants.regularCornerRadius, style: .continuous)
                .fill(Colors.baseTextViewBackgroundColor.color)
        }
    }
}

struct RegularTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RegularTextFieldView.Model(leftIcon: Images.email.image,
                                               rightIcon: Images.email.image,
                                               placeHolder: LanguageString.emailPlaceholder,
                                               inputText: .constant(""))
        RegularTextFieldView(with: model)
            .previewLayout(.fixed(width: 320, height: 100))
    }
}
