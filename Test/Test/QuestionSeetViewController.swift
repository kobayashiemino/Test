import UIKit
import GradientAnimator
import MarqueeLabel
import WCLShineButton
import FluentIcons

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
    }
    
    func setupMessageLabel(text: String) {
        let messageLabel = MarqueeLabel()
        messageLabel.frame = CGRect(x: 20, y: 50, width: viewWidth - 40, height: 80)
        messageLabel.center.x = viewWidth / 2
        messageLabel.text = text
        messageLabel.textColor = .white
        messageLabel.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        messageLabel.type = .left
        messageLabel.fadeLength = 10.0
        messageLabel.animationDelay = 5.0
        messageLabel.speed = .duration(30)
        self.view.addSubview(messageLabel)
    }
    
    func setupQuestionLabel(text: String) {
        let questionLabel = UILabel()
        questionLabel.frame = CGRect(x: 0, y: 0, width: viewWidth - 40, height: 80)
        questionLabel.center.x = viewWidth / 2
        questionLabel.center.y = viewHeight / 2
        questionLabel.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        questionLabel.text = text
        questionLabel.textColor = .white
        self.view.addSubview(questionLabel)
    }
    
    func setupButton(image: UIImage, frame: CGRect, selector: Selector) {
        var params = WCLShineParams()
        params.bigShineColor = UIColor(rgb: (r: 252, g: 134, b:
        170))
        params.smallShineColor = UIColor(rgb: (r: 253, g: 177, b: 71))
        
        let shiningButton = WCLShineButton(frame: frame, params: params)
        shiningButton.fillColor = UIColor(rgb: (r: 252, g: 134, b:
        170))
        shiningButton.color = .white
        shiningButton.image = .custom(image)
        shiningButton.addTarget(self, action: selector, for: .valueChanged)
        self.view.addSubview(shiningButton)
    }
    
    @objc func onClickYesButton() {
        
    }
    
    @objc func onClickNoButton() {
        
    }
}
