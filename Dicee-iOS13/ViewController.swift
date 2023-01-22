

import UIKit

class ViewController: UIViewController {
    
    let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
        
    //MARK: - MAIN STACK
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        //stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        return stackView
    }()
    
    //MARK: - TOP VIEW
    private let topView: UIView = {
        let view = UIView()
        view.contentMode = .scaleToFill
        //view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let diceLogoImageView: UIImageView = {
        let logoView = UIImageView()
        logoView.image = UIImage(imageLiteralResourceName: "DiceeLogo")
        //logoView.translatesAutoresizingMaskIntoConstraints = false
        return logoView
    }()
    
    //MARK: - MIDDLE VIEW
    private let middleView: UIView = {
        let view = UIView()
        view.contentMode = .scaleToFill
        //view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let diceStackView: UIStackView = {
        let stackView = UIStackView()
        //stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 50
        return stackView
    }()
    
    private var dice1: UIImageView = {
        let diceImage = UIImageView()
        diceImage.image = UIImage(imageLiteralResourceName: "DiceOne")
        //diceImage.translatesAutoresizingMaskIntoConstraints = false
        return diceImage
    }()
    
    private var dice2: UIImageView = {
        let diceImage = UIImageView()
        diceImage.image = UIImage(imageLiteralResourceName: "DiceTwo")
        //diceImage.translatesAutoresizingMaskIntoConstraints = false
        return diceImage
    }()
    
    //MARK: - BOTTOM VIEW
    private let bottomView: UIView = {
        let view = UIView()
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var rollButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Roll", for: .normal)
        button.titleLabel?.font = UIFont(name: "Impact", size: 40)
        button.backgroundColor = #colorLiteral(red: 0.6062273979, green: 0.108488299, blue: 0.1197911575, alpha: 1)
        button.tintColor = .white
        button.addTarget(self, action: #selector(randomizeDices), for: .touchUpInside)
        //button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func randomizeDices() {
        dice1.image = diceArray.randomElement()
        dice2.image = diceArray.randomElement()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupStackViews()
        setConstraints()   
    }
    
    private func setupStackViews() {
        //вертикальный стэк
        stackView.addArrangedSubview(topView)
        stackView.addArrangedSubview(middleView)
        stackView.addArrangedSubview(bottomView)
        //горигонтальный стэк
        diceStackView.addArrangedSubview(dice1)
        diceStackView.addArrangedSubview(dice2)
    }
    
    private func setupView() {
        view.layer.contents = UIImage(imageLiteralResourceName: "GreenBackground").cgImage
        // порядок элементов важен
        view.setupView(stackView)
        view.setupView(diceLogoImageView)
        view.setupView(diceStackView)
        view.setupView(rollButton)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])

        NSLayoutConstraint.activate([
            diceLogoImageView.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            diceLogoImageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            diceStackView.centerXAnchor.constraint(equalTo: middleView.centerXAnchor),
            diceStackView.centerYAnchor.constraint(equalTo: middleView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            rollButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            rollButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            rollButton.heightAnchor.constraint(equalToConstant: 50),
            rollButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 100)
        ])
    }
}





