
import UIKit

class ViewController: UIViewController {
    private var rateFilled: Bool = false
    private var isStar: Bool = false
    var red = UIColor(red: 0.933, green: 0.294, blue: 0.168, alpha: 1.0)
    var gray = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
    var enableGreen = UIColor(red: 0.366, green: 0.692, blue: 0.457, alpha: 1)
    var disableGreen = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    let dataPicker = UIDatePicker()
    lazy var myStars = [Star1, Star2, Star3, Star4, Star5]
    lazy var myGrades = [0: "Ваша Оценка",
                         1: "Ужасно",
                         2: "Плохо",
                         3: "Нормально",
                         4: "Хорошо",
                         5: "AMAZING!"]
    

    private lazy var containerStars: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - buttons
    private lazy var Star1: UIButton = {
        let button = UIButton(type: .custom)
        button.tag = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Star"), for: .normal)
        button.addTarget(self, action: #selector(didTapStar), for: .touchUpInside)
        return button
    }()
    
    private lazy var Star2: UIButton = {
        let button = UIButton()
        button.tag = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "Star")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(didTapStar), for: .touchUpInside)
        return button
    }()
    
    private lazy var Star3: UIButton = {
        let button = UIButton()
        button.tag = 3
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "Star")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(didTapStar), for: .touchUpInside)
        return button
    }()
    
    private lazy var Star4: UIButton = {
        let button = UIButton()
        button.tag = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "Star")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(didTapStar), for: .touchUpInside)
        return button
    }()
    
    private lazy var Star5: UIButton = {
        let button = UIButton()
        button.tag = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "Star")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(didTapStar), for: .touchUpInside)
        return button
    }()
    
    private lazy var Save: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cохранить", for: .normal)
        button.setTitleColor( .white, for: .normal)
        button.backgroundColor = disableGreen
        button.layer.cornerRadius = 24
        button.isEnabled = true
        button.addTarget(self, action: #selector(resetSave), for: .touchUpInside)
        return button
    }()
    
    // MARK: - edit1
    private lazy var RandomFill: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Случайные данные", for: .normal)
        button.setTitleColor( .white, for: .normal)
        button.backgroundColor = enableGreen
        button.layer.cornerRadius = 12
        button.isEnabled = true
        button.addTarget(self, action: #selector(AutoFill), for: .touchUpInside)
        return button
    }()
    
    //MARK: - TextFields + Labels
    private lazy var Film: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.text = "Фильм"
        return label
    }()
    
    private lazy var Name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Название"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var FName: UITextField = {
        let tField = UITextField()
        
        tField.translatesAutoresizingMaskIntoConstraints = false
        tField.textAlignment = .left
        tField.borderStyle = .roundedRect
        tField.layer.borderWidth = 1
        tField.layer.cornerRadius = 5
        tField.layer.borderColor = gray.cgColor
        tField.addTarget(self, action: #selector(FNameDidChange), for: .editingChanged)
        tField.backgroundColor = gray
        tField.placeholder = "Название фильма"
        return tField
    }()
    
    private lazy var Director: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Режисёр"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var FDirector: UITextField = {
        let tField = UITextField()
        tField.translatesAutoresizingMaskIntoConstraints = false
        tField.textAlignment = .left
        tField.borderStyle = .roundedRect
        tField.layer.borderWidth = 1
        tField.layer.cornerRadius = 5
        tField.layer.borderColor = gray.cgColor
        tField.addTarget(self, action: #selector(FDirectorDidChange), for: .editingChanged)
        tField.backgroundColor = gray
        tField.placeholder = "Режисёр фильма"
        return tField
    }()
    
    private lazy var Year: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Год"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var FYear: UITextField  = {
        let tField = UITextField()
        tField.placeholder = "Год выпуска"
        tField.textAlignment = .left
        tField.borderStyle = .roundedRect
        tField.layer.borderWidth = 1
        tField.layer.cornerRadius = 5
        tField.layer.borderColor = gray.cgColor
        tField.backgroundColor = gray
        tField.translatesAutoresizingMaskIntoConstraints = false
        return tField
    }()
    
    private lazy var Grade: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Ваша оценка"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    // MARK: - Enable Save button
    private func checkIfAllFieldsAreFilled() -> Bool {
            let name = FName.text ?? ""
            let producer = FDirector.text ?? ""
            let year = FYear.text ?? ""
            let borderColor = FName.layer.borderColor == gray.cgColor && FDirector.layer.borderColor == gray.cgColor
            return !name.isEmpty && !producer.isEmpty && borderColor && !year.isEmpty && rateFilled ? true : false
        }
    
    // MARK: - Validation
    @objc func FNameDidChange(_ sender: Any)
    {
          if let name = FName.text
        {
            if let color = NameValid(name)
            {
                FName.layer.borderColor = color.cgColor
            }
        }
    }
    @objc func FDirectorDidChange(_ sender: Any)
    {
        if let director = FDirector.text
        {
            if let color = DirectorValid(director)
            {
                FDirector.layer.borderColor = color.cgColor
            }
        }
    }

    func DirectorValid(_ value: String) -> UIColor?
    {
      
        let regularExpression = #"^[а-яa-zА-ЯA-Z- ]+$"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        if !predicate.evaluate(with: value) || value.count <= 2 || value.count > 300
        {
            Save.isEnabled = false
            Save.backgroundColor = disableGreen
            return red
        }
        else
        {
            Save.backgroundColor = checkIfAllFieldsAreFilled() ? enableGreen : disableGreen
            Save.isEnabled = Save.backgroundColor == enableGreen ? true : false
            return gray
        }
    }
    
    func NameValid(_ value: String) -> UIColor?
    {
        if value.count <= 1 || value.count > 300
        {
            Save.isEnabled = false
            Save.backgroundColor = disableGreen
            return red
        }
        else
        {
            Save.backgroundColor = checkIfAllFieldsAreFilled() ? enableGreen : disableGreen
            Save.isEnabled = Save.backgroundColor == enableGreen ? true : false
            return gray
        }
    }
    
    func createDatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        FYear.inputAccessoryView = toolbar
        FYear.inputView = dataPicker
        dataPicker.datePickerMode = .date
        dataPicker.preferredDatePickerStyle = .wheels
    }
//    func DirectorUppercase
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        FYear.inputView = dataPicker
//        dataPicker.datePickerMode = .date
        //dataPicker.preferredDatePickerStyle = .wheels
        view.backgroundColor = .systemBackground
        createDatePicker()
        setupViews()
        setConstraints()
        //dataPicker.addTarget(self, action: #selector(getDataFromPicker), for: .valueChanged)
    }
    
    // MARK: - Private
    private func setupViews(){
        [Film, Name, FName, Director, FDirector, Year, FYear, containerStars, Grade, RandomFill, Save].forEach{view.addSubview($0)}
        [Star1, Star2, Star3, Star4, Star5].forEach{containerStars.addSubview($0)}
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            Film.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            Film.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 138),
            Film.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -135),
            
            Name.topAnchor.constraint(equalTo: Film.bottomAnchor, constant: 40),
            Name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            Name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -302),
            
            FName.topAnchor.constraint(equalTo: Name.bottomAnchor, constant: 8),
            FName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            FName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            FName.heightAnchor.constraint(equalToConstant: 50),
            
            Director.topAnchor.constraint(equalTo: FName.bottomAnchor, constant: 16),
            Director.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            Director.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -306),
            
            FDirector.topAnchor.constraint(equalTo: Director.bottomAnchor, constant: 8),
            FDirector.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            FDirector.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            FDirector.heightAnchor.constraint(equalToConstant: 50),
            
            Year.topAnchor.constraint(equalTo: FDirector.bottomAnchor, constant: 16),
            Year.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            Year.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -338),
            
            FYear.topAnchor.constraint(equalTo: Year.bottomAnchor, constant: 8),
            FYear.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            FYear.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            FYear.heightAnchor.constraint(equalToConstant: 50),
            
            containerStars.topAnchor.constraint(equalTo: FYear.bottomAnchor, constant: 48),
            containerStars.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            containerStars.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 58),
            containerStars.heightAnchor.constraint(equalToConstant: 50),
            
            Star1.topAnchor.constraint(equalTo: containerStars.topAnchor),
            Star1.leadingAnchor.constraint(equalTo: containerStars.leadingAnchor),
            Star1.trailingAnchor.constraint(equalTo: Star2.leadingAnchor, constant: -11.3),
            
            Star2.topAnchor.constraint(equalTo: containerStars.topAnchor),
            Star2.leadingAnchor.constraint(equalTo: Star1.trailingAnchor, constant: 11.3),
            Star2.trailingAnchor.constraint(equalTo: Star3.leadingAnchor, constant: -11.3),

            Star3.topAnchor.constraint(equalTo: containerStars.topAnchor),
            Star3.leadingAnchor.constraint(equalTo: Star2.trailingAnchor, constant: 11.3),
            Star3.trailingAnchor.constraint(equalTo: Star4.leadingAnchor, constant: -11.3),

            Star4.topAnchor.constraint(equalTo: containerStars.topAnchor),
            Star4.leadingAnchor.constraint(equalTo: Star3.trailingAnchor, constant: 11.3),
            Star4.trailingAnchor.constraint(equalTo: Star5.leadingAnchor, constant: -11.3),

            Star5.topAnchor.constraint(equalTo: containerStars.topAnchor),
            Star5.leadingAnchor.constraint(equalTo: Star4.trailingAnchor, constant: 11.3),
            
            Grade.topAnchor.constraint(equalTo: Star1.bottomAnchor, constant: 20),
            Grade.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 136),
            Grade.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -136),
        
            RandomFill.topAnchor.constraint(equalTo: Grade.bottomAnchor, constant: 158),
            RandomFill.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            RandomFill.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            RandomFill.heightAnchor.constraint(equalToConstant: 30),
            
            Save.topAnchor.constraint(equalTo: RandomFill.bottomAnchor, constant: 11.3),
            Save.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            Save.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            Save.heightAnchor.constraint(equalToConstant: 51)
            
             ])
    }
    
    @objc func donePressed() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        FYear.text = formatter.string(from: dataPicker.date)
        self.view.endEditing(true)
    }
//    @objc
//    func getDataFromPicker(){
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd.MM.yyyy"
//        FYear.text = formatter.string(from: dataPicker.date)
//    }
    
    @objc
    private func didTapStar( sender: UIButton!){
        let button: UIButton = sender
        if button.tag != 5{
            for j in button.tag...4{
                myStars[j].setImage(UIImage(named: "Star"), for: .normal)
            }
        }
        for j in 0...button.tag-1{
            myStars[j].setImage(UIImage(named: "Star-1"), for: .normal)
            Grade.text = myGrades[j+1]
        }
        rateFilled = true
        Save.backgroundColor = checkIfAllFieldsAreFilled() ? enableGreen : disableGreen
        Save.isEnabled = Save.backgroundColor == enableGreen ? true : false
   }
    //MARK: edit2
    @objc private func AutoFill() {
        let randomStarTag = Int.random(in: 0..<5)
        if randomStarTag != 5{
            for j in randomStarTag...4{
                myStars[j].setImage(UIImage(named: "Star"), for: .normal)
            }
        }
        for j in 0...randomStarTag{
            myStars[j].setImage(UIImage(named: "Star-1"), for: .normal)
            Grade.text = myGrades[j+1]
        }
            FName.text = randomString()
        var dd = Int.random(in: 10..<30), mm = Int.random(in: 01..<12), yyyy = Int.random(in: 1930..<2022)
            if (mm < 10)
            {
                FYear.text = String(dd) + "." + "0" + String(mm) + "." + String(yyyy)
            }
            else
            {
                FYear.text = String(dd) + "." + String(mm) + "." + String(yyyy)
            }
            FDirector.text = randomString()
            Save.backgroundColor = enableGreen
        }
    @objc func randomString() -> String {
        let lettersUpper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let letters = "abcdefghijklmnopqrstuvwxyz"
        return String(lettersUpper.randomElement()!) + String((0..<10).map{ _ in letters.randomElement()! })
      }
    
    @objc private func resetSave() {
            rateFilled = isStar ? true : false
            FName.text = ""
            FYear.text = ""
            FDirector.text = ""
            Save.backgroundColor = disableGreen
            didTapStar(sender: Star1)
            Star1.setImage(UIImage(named: "Star"), for: .normal)
            Grade.text = "Ваша оценка"
        }
}
