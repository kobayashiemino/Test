import UIKit
import GradientAnimator

class QuestionSeetViewController: UIViewController{
    
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
}
