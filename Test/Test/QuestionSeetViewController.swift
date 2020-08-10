import UIKit
import GradientAnimator
import MarqueeLabel

class QuestionSeetViewController: UIViewController{
    
    private let viewWidth : CGFloat = UIScreen.main.bounds.width
    private let viewHeight : CGFloat = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientView = GradientAnimator(frame: self.view.frame,
                                            theme: GradientThemes.BlueLagoon,
                                            _startPoint: GradientPoints.bottomLeft,
                                            _endPoint: GradientPoints.topRight,
                                            _animationDuration: 3.0)
        self.view.insertSubview(gradientView, at: 0)
        gradientView.startAnimate()
        
        setupLabel(text: "")
    }
    
    func setupLabel(text: String) {
        let messageLabel = MarqueeLabel()
        messageLabel.frame = CGRect(x: 20, y: 50, width: viewWidth - 40, height: 80)
        messageLabel.center.x = viewWidth / 2
        messageLabel.text = text
        messageLabel.textColor = .white
        messageLabel.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        messageLabel.type = .left
        messageLabel.fadeLength = 20.0
        messageLabel.animationDelay = 5.0
        messageLabel.speed = .duration(30)
        self.view.addSubview(messageLabel)
    }
}
