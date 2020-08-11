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
        Page(messageLabel: "0を1にする力", questionLabel: ""),
        Page(messageLabel: "人と人との間のことをできているか", questionLabel: ""),
        Page(messageLabel: "誰もやっていないことを生み出す", questionLabel: ""),
        Page(messageLabel: "夢がない人は、こうなりたいを思い出す", questionLabel: ""),
        Page(messageLabel: "偶然を起点に何かあるんじゃないかという癖をつけてほしい", questionLabel: ""),
        Page(messageLabel: "そういう人(鍵と鍵穴の関係の人)と出会ってコミュニケーションするとコンスタントに閃ける", questionLabel: ""),
        Page(messageLabel: "夢は形になると幼少期から思ってここまできた", questionLabel: ""),
        Page(messageLabel: "同じとこに向かう個性バラバラの仲間が大事", questionLabel: ""),
        Page(messageLabel: "人に何をどうやって伝えるか", questionLabel: ""),
        Page(messageLabel: "人を振り向かせるプレゼンテーション、キャッチコピーどんな仕事も大事", questionLabel: ""),
        Page(messageLabel: "日常を楽しくしていく訓練", questionLabel: ""),
        Page(messageLabel: "人に伝える時に何が一番シンプルに伝わるか、simple is strongが大事", questionLabel: ""),
        Page(messageLabel: "人に伝わらなかったらクリエイティブの意味がない", questionLabel: ""),
        Page(messageLabel: "1個につき1個じゃダメ、最低10個考えて、最低10こ持ってくる", questionLabel: ""),
        Page(messageLabel: "街歩いてて出会ったことないものに出会うのは人間力高い", questionLabel: ""),
        Page(messageLabel: "気になったことをほっとかないのは人間力高い", questionLabel: ""),
        Page(messageLabel: "人の心を動かす", questionLabel: ""),
        Page(messageLabel: "褒める人は絶対大事", questionLabel: ""),
        Page(messageLabel: "働きながら泳ぎながら学ぶ", questionLabel: ""),
        Page(messageLabel: "数学はできないが図工はできた", questionLabel: ""),
        Page(messageLabel: "世界の方が自分より大きい", questionLabel: ""),
        Page(messageLabel: "自分をおもちゃにして実験する", questionLabel: ""),
        Page(messageLabel: "ホモファーベルからホモルーデンスになるのが人生の課題", questionLabel: ""),
        Page(messageLabel: "下手に出る人はいや", questionLabel: ""),
        Page(messageLabel: "自分をコントロールする人もいや", questionLabel: ""),
        Page(messageLabel: "束縛する人はだめ", questionLabel: ""),
        Page(messageLabel: "いつでも後藤くん楽しそうだねと言われるのが成功の道", questionLabel: ""),
        Page(messageLabel: "あてどない自分をどう面白く編集するか", questionLabel: ""),
        Page(messageLabel: "才能っていうのはケチったらダメ", questionLabel: ""),
        Page(messageLabel: "自分が収集した情報や面白いことを垂れ流す人の方がうまくいく", questionLabel: ""),
        Page(messageLabel: "パクってくださいじゃないとだめ", questionLabel: ""),
        Page(messageLabel: "篠山紀信さんが特別なのは、みんなができることをもっと極めているから", questionLabel: ""),
        Page(messageLabel: "先輩に編集の方法を教わったわけじゃない", questionLabel: ""),
        Page(messageLabel: "できないって言ったら成功できない", questionLabel: ""),
        Page(messageLabel: "できるって言ってから調べたり学習したりする", questionLabel: ""),
        Page(messageLabel: "世界が先生", questionLabel: ""),
        Page(messageLabel: "自分も写真をうまいって思っていないとできない", questionLabel: ""),
        Page(messageLabel: "プラットフォームをどう構築するかが編集", questionLabel: ""),
        Page(messageLabel: "戦略的編集スキルがいろんな分野で必要になる", questionLabel: ""),
        Page(messageLabel: "速さと深さは両立しないが、うまくいけば成功", questionLabel: ""),
        Page(messageLabel: "作戦立てて企画書作る力が重要", questionLabel: ""),
        Page(messageLabel: "考えることを企画書にする", questionLabel: ""),
        Page(messageLabel: "アイデアを形にするノウハウがある", questionLabel: ""),
        Page(messageLabel: "中学生がわかる内容じゃないと企画通らない", questionLabel: ""),
        Page(messageLabel: "朝から晩まで何かいいことないかなと考えている", questionLabel: ""),
        Page(messageLabel: "アマチュアだから素朴な質問ができる", questionLabel: ""),
        Page(messageLabel: "なんでだろうと思うのがアマチュア", questionLabel: ""),
        Page(messageLabel: "僕はキャリアがないから毎日必死", questionLabel: ""),
        Page(messageLabel: "ケチケチして偉そうな人はダメ", questionLabel: ""),
        Page(messageLabel: "編集者は不可能も起こるって思っている人", questionLabel: ""),
        Page(messageLabel: "それぞれの人の中にはモチーフがいる", questionLabel: ""),
        Page(messageLabel: "モチーフには動機がいる", questionLabel: ""),
        Page(messageLabel: "モチーフをすぐ諦めるのはだめ", questionLabel: ""),
        Page(messageLabel: "ダメだと言われても諦めない", questionLabel: ""),
        Page(messageLabel: "今回は合わないけどなんか覚えてるというポジションを狙う", questionLabel: ""),
        Page(messageLabel: "運がいいと思っていないと成功しない", questionLabel: ""),
        Page(messageLabel: "自分の力だけではうまくいかない", questionLabel: ""),
        Page(messageLabel: "植物や空と海と友達になって彼らのバイブレーションとうまくいっていないとだめ", questionLabel: ""),
        Page(messageLabel: "世界が自分の味方をしてくれているという体になる", questionLabel: ""),
        Page(messageLabel: "満員電車で、降りる人を予想する訓練を積む、小さな変化が大きな変化になるというのを感じられる体になる", questionLabel: ""),
        Page(messageLabel: "自分をおもちゃにして実験しないとうまくいかない", questionLabel: ""),
        Page(messageLabel: "みんなの考えていることは僕にとっては世界、みんなの考えていることを知りたい", questionLabel: ""),
        Page(messageLabel: "その場で思いつくのが面白い", questionLabel: ""),
        Page(messageLabel: "編集はセルフブランディング、今は発信できる", questionLabel: ""),
        Page(messageLabel: "金になろうがなかろうが面白いと思ったことを言う", questionLabel: ""),
        Page(messageLabel: "僕の方が面白いことをご覧に入れましょう", questionLabel: ""),
        Page(messageLabel: "褒められた記憶があるから自分は生きていける", questionLabel: ""),
        Page(messageLabel: "お前天才だって言う人いないと成功しない", questionLabel: ""),
        Page(messageLabel: "あいつの方がうまくいっているとか嫉妬しない", questionLabel: ""),
        Page(messageLabel: "政治家はロクでもない人たちがしている、自分たちで面白くしよう", questionLabel: ""),
        Page(messageLabel: "自分が信頼できる人が微笑んでいられるように考える", questionLabel: ""),
        Page(messageLabel: "ちゃんとやればうまくいく", questionLabel: ""),
        Page(messageLabel: "受け入れられないって言う人はつまらない人", questionLabel: ""),
        Page(messageLabel: "自分をイメージすることが大事", questionLabel: ""),
        Page(messageLabel: "自分をおもちゃにする、失敗も大したことない、3が出るか6が出るか", questionLabel: ""),
        Page(messageLabel: "仕事は一つ一つクリアしないといけない", questionLabel: ""),
        Page(messageLabel: "次の仕事につながるプレゼンできる完成度になっていないといけない", questionLabel: ""),
        Page(messageLabel: "自分の代わりに説明してくれるもの、誰が作ったんだろうと思われるもの", questionLabel: ""),
        Page(messageLabel: "自分が作ったものに助けられて次につながる", questionLabel: ""),
        Page(messageLabel: "いい学校に行っていなくても仕上がりやみんなの感じることを代弁できればでジレクションできる", questionLabel: ""),
        Page(messageLabel: "期待されていない、バカにされているから、相手を喜ばせる", questionLabel: ""),
        Page(messageLabel: "期待されていない、バカにされているから、相手を喜ばせる", questionLabel: "")
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
