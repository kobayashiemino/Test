import UIKit
import TKSubmitTransition

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    private let viewWidth : CGFloat = UIScreen.main.bounds.width
    private let viewHeight : CGFloat = UIScreen.main.bounds.height
    private let startButton = TKTransitionSubmitButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        startButton.frame = CGRect(x: 0, y: 0, width: viewWidth / 3, height: 80)
        startButton.center.x = viewWidth / 2
        startButton.center.y = viewHeight / 2 + 120
        startButton.backgroundColor = .systemPink
        startButton.setTitle("YES!", for: .normal)
        startButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 14)
        startButton.addTarget(self, action: #selector(didStartYourLoading), for: .touchUpInside)
        self.view.addSubview(startButton)
    }
    
    @objc func didStartYourLoading() {
        startButton.startLoadingAnimation()
        didFinishYourLoading()
    }
    
    func didFinishYourLoading() {
        startButton.startFinishAnimation(1.5){
            //Your Transition
            let QuestionSeetVC = QuestionSeetViewController()
            QuestionSeetVC.transitioningDelegate = self
            self.present(QuestionSeetVC, animated: true, completion: nil)
        }
    }
}

