import UIKit

class AboutMeViewController: UIViewController {
    private var titleLabel: UILabel!
    private var buttonStackView: UIStackView!
    private var cmKgButton: UIButton!
    private var inLbsButton: UIButton!
    private var saveButton: UIButton!
    private var imageStackView: UIStackView!
    
    // Массив изображений
    private let imageNames = ["genderImg", "heightImg", "weightImg", "ageImg"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Установка фонового изображения
        let backgroundImage = UIImageView(image: UIImage(named: "bg"))
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.frame = UIScreen.main.bounds
        self.view.insertSubview(backgroundImage, at: 0)
        self.view.backgroundColor = .white

        // Настройка Label "About me"
        titleLabel = UILabel()
        titleLabel.text = "About me"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)

        // Настройка кнопок "Cm, Kg" и "In, Lbs"
        cmKgButton = createButton(title: "Cm, Kg")
        inLbsButton = createButton(title: "In, Lbs")

        // Настройка горизонтального стека для кнопок
        buttonStackView = UIStackView(arrangedSubviews: [cmKgButton, inLbsButton])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 20
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonStackView)

        // Настройка вертикального стека для изображений
        imageStackView = UIStackView()
        imageStackView.axis = .vertical
        imageStackView.spacing = 9
        imageStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageStackView)

        // Добавление изображений в вертикальный стек
        for imageName in imageNames {
            let imageView = createImageView(imageName: imageName)
            imageStackView.addArrangedSubview(imageView)
        }

        // Настройка кнопки "Save"
        saveButton = UIButton(type: .system)
        saveButton.setTitle("Save", for: .normal)
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        saveButton.layer.cornerRadius = 30
        saveButton.backgroundColor = #colorLiteral(red: 0.4392156863, green: 0.4, blue: 0.9764705882, alpha: 1)
        saveButton.setTitleColor(UIColor.white, for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        view.addSubview(saveButton)

        // Расстановка элементов на экране
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.leftAnchor, constant: 70),

            buttonStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            imageStackView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 18),
            imageStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            imageStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),

            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            saveButton.widthAnchor.constraint(equalToConstant: 300),
            saveButton.heightAnchor.constraint(equalToConstant: 68)
        ])
    }

    func createButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        // Устанавливаем закругление в половину высоты кнопок
        button.layer.cornerRadius = button.frame.height / 2 // Половина высоты кнопок
        button.clipsToBounds = true
        return button
    }

    func createImageView(imageName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 340).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return imageView
    }

    @objc func buttonTapped(sender: UIButton) {
        // Обработка нажатия кнопок "Cm, Kg" и "In, Lbs"
        if sender == cmKgButton {
            cmKgButton.backgroundColor = UIColor(red: 102/255, green: 118/255, blue: 250/255, alpha: 1.0)
            inLbsButton.backgroundColor = .clear
        } else if sender == inLbsButton {
            cmKgButton.backgroundColor = .clear
            inLbsButton.backgroundColor = UIColor(red: 102/255, green: 118/255, blue: 250/255, alpha: 1.0)
        }
    }

    @objc func saveButtonTapped() {
        dismiss(animated: true)
        print("Save button tapped")
    }
}
