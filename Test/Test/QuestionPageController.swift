import UIKit
import GradientAnimator
import MarqueeLabel
import WCLShineButton
import FluentIcons

struct Page {
    
    var messageLabel : String = ""
    var questionLabel : String = ""
}

class QuestionPageCell : UICollectionViewCell {
    
    var page : Page? {
        didSet{
            guard let messageLabel = page?.messageLabel else { return }
            self.messageLabel.text = messageLabel
            
            guard let questionLabel = page?.questionLabel else { return }
            self.questionLabel.text = questionLabel
        }
    }
    
    private let messageLabel : UILabel = {
        let messageLabel = MarqueeLabel()
        messageLabel.textColor = .white
        messageLabel.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        messageLabel.type = .left
        messageLabel.fadeLength = 10.0
        messageLabel.animationDelay = 5.0
        messageLabel.speed = .duration(30)
        return messageLabel
    }()
    
    private let questionLabel : UILabel = {
        let questionLabel = UILabel()
        questionLabel.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        questionLabel.textColor = .white
        return questionLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton(image: UIImage(fluent: .circle24Regular), frame: CGRect(x: self.frame.width / 2 - 50, y: self.frame.height / 2 + 40, width: 50, height: 50), selector: #selector(onClickNoButton))
        setupButton(image: UIImage(fluent: .dismiss28Filled), frame: CGRect(x: self.frame.width / 2 + 50, y: self.frame.height / 2 + 40, width: 50, height: 50), selector: #selector(onClickYesButton))
        
        messageLabel.frame = CGRect(x: 20, y: 50, width: self.frame.width - 40, height: 80)
        messageLabel.center.x = self.frame.width / 2
        self.addSubview(messageLabel)
        
        questionLabel.frame = CGRect(x: 0, y: 0, width: self.frame.width - 40, height: 80)
        questionLabel.center.x = self.frame.width / 2
        questionLabel.center.y = self.frame.height / 2
        self.addSubview(questionLabel)
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
        self.addSubview(shiningButton)
    }
    
    @objc func onClickYesButton() {
        
    }
    
    @objc func onClickNoButton() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class QuestionPageController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    private let pages = [
        Page(messageLabel: "アイウエオ", questionLabel: "かきくけこ"),
        Page(messageLabel: "さしすせそ", questionLabel: "たちつてと")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.register(QuestionPageCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.isPagingEnabled = true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! QuestionPageCell
        cell.page = pages[indexPath.item]
        
        let gradientView = GradientAnimator(frame: self.view.frame,
                                            theme: GradientThemes.BlueLagoon,
                                            _startPoint: GradientPoints.bottomLeft,
                                            _endPoint: GradientPoints.topRight,
                                            _animationDuration: 3.0)
        cell.insertSubview(gradientView, at: 0)
        gradientView.startAnimate()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }
}
