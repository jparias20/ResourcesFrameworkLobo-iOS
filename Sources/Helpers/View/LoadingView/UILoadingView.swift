import UIKit
import Lottie
import dotLottie

public final class UILoadingView: UIView {
    
    public static func show(in view: UIView) -> UILoadingView {
        let loadingView = UILoadingView()
        loadingView.alpha = 0
        
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadingView)
        
        NSLayoutConstraint.activate([
            loadingView.topAnchor.constraint(equalTo: view.topAnchor),
            loadingView.leftAnchor.constraint(equalTo: view.leftAnchor),
            loadingView.rightAnchor.constraint(equalTo: view.rightAnchor),
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        UIView.animate(withDuration: 0.3,
                       delay: 0.2,
                       options: .curveEaseInOut,
                       animations: { [weak loadingView] in
            loadingView?.alpha = 1
        }, completion: nil)
                
        return loadingView
    }
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = Colors.modalBackgroundColor.uiColor
        
        insertSubview(backgroundView, at: 0)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.heightAnchor.constraint(equalTo: heightAnchor),
            backgroundView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
        
        DotLottie.isLogEnabled = true
        guard let url = URL(string: Constants.regularLottieURLString) else { return }
        
        DotLottie.load(from: url) { [weak self] animation, _ in
            guard let self = self, let animation = animation else { return }
            
            let animationView = AnimationView()
            animationView.animation = animation
            animationView.bounds = CGRect(x: 0, y: 0, width: 250, height: 250)
            animationView.center = self.center
            
            self.addSubview(animationView)
            animationView.play()
            animationView.loopMode = .loop
        }
    }
    
    public func remove() {
        UIView.animate(withDuration: 0.2,
                       delay: 0.2,
                       options: .curveEaseInOut,
                       animations: { [weak self] in
            self?.alpha = 0
        }, completion: { [weak self] _ in
            self?.removeFromSuperview()
        })
    }
}
