import SwiftUI

public struct AlertModalModel {
    
    public struct Action {
        public let title: LanguageString
        public let theme: RegularButtonView.Theme
        public let callBack: CompletionBlock
        
        public init(
            title: LanguageString,
            theme: RegularButtonView.Theme,
            callBack: @escaping CompletionBlock
        ) {
            self.title = title
            self.callBack = callBack
            self.theme = theme
        }
    }
    
    public struct Form: Hashable {
        public let model: RegularTextFieldView.Model
        
        @Binding
        public var input: String
        
        public init(model: RegularTextFieldView.Model, input: Binding<String>) {
            self.model = model
            self._input = input
        }
        
        public static func == (lhs: Form, rhs: Form) -> Bool {
            lhs.model == rhs.model
        }
        
        public func hash(into hasher: inout Hasher) {
            return hasher.combine(model)
        }
    }
    
    public let title: LanguageString
    public let description: LanguageString
    public let forms: [Form]
    public let primaryAction: Action
    public let secondaryAction: Action?
    
    public init(
        title: LanguageString,
        description: LanguageString,
        forms: [Form],
        primaryAction: Action,
        secondaryAction: Action? = nil
    ) {
        self.title = title
        self.description = description
        self.forms = forms
        self.primaryAction = primaryAction
        self.secondaryAction = secondaryAction
    }
}

struct AlertModalView: View {
    
    private let model: AlertModalModel
    
    private var horizontalPadding: CGFloat {
        16
    }
    
    init(model: AlertModalModel) {
        self.model = model
    }
    
    var body: some View {
        baseBackgroundView(Colors.modalBackgroundColor.color) {
            VStack(spacing: 20) {
                HeaderImageView(icon: .formIcon)
                titlesView
                formViews
                buttonsView
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

private extension AlertModalView {
        
    @ViewBuilder
    var titlesView: some View {
        VStack {
            Text(model.title.localized)
                .foregroundColor(Colors.baseTitle1ForegroundColor.color)
                .font(.title)
                .bold()
            Text(model.description.localized)
                .multilineTextAlignment(.center)
                .padding(.horizontal, horizontalPadding)
                .font(.body)
                .foregroundColor(Colors.baseTitle1ForegroundColor.color)
        }
    }
    
    @ViewBuilder
    var formViews: some View {
        VStack(spacing: 10) {
            ForEach(model.forms, id: \.self) { model in
                RegularTextFieldView(with: model.model, inputText: model.$input)
                    .padding(.horizontal, horizontalPadding)
            }
        }
    }
    
    @ViewBuilder
    var buttonsView: some View {
        HStack {
            RegularButtonView(
                title: model.primaryAction.title,
                theme: model.primaryAction.theme,
                callback: model.primaryAction.callBack
            )
            
            if let secondary = model.secondaryAction {
                RegularButtonView(
                    title: secondary.title,
                    theme: secondary.theme,
                    callback: secondary.callBack
                )
            }
        }
        .padding(.horizontal, horizontalPadding)
        .padding(.bottom, 30)
    }
}

struct AlertModalView_Previews: PreviewProvider {
    static var previews: some View {
        AlertModalView(
            model:
                    .init(
                        title: .registerNameModalTitle,
                        description: .registerNameModalDescription,
                        forms: [
                            AlertModalModel.Form(
                                model: RegularTextFieldView.Model(placeHolder: .registerNameModalPlaceholder),
                                input: .constant(""))
                        ],
                        primaryAction: .init(
                            title: .send,
                            theme: .accept,
                            callBack: {}
                        ),
                        secondaryAction: .init(
                            title: .close,
                            theme: .reject,
                            callBack: {}
                        )
                    )
        )
    }
}
