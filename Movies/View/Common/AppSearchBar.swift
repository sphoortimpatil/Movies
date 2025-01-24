//
//  SearchBar.swift
//  Movies
//
//  Created by Sphoorti Patil on 06/12/24.
//

import UIKit

protocol AppSearchBarDelegate: AnyObject {
    func didTapClose()
}

class AppSearchBar: UIView {
    weak var delegate: AppSearchBarDelegate?
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()
    
    private let searchBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.secondaryBackgroundColor
        view.layer.borderColor = UIColor(red: 174/255, green: 174/255, blue: 178/255, alpha: 0.5).cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 8
        
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 6.0 
        view.layer.shadowOpacity = 1.0
        view.layer.masksToBounds = false
        return view
    }()
    
    private let searchIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Search")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Search"
        textField.backgroundColor = .clear
        textField.borderStyle = .none
        textField.tintColor = CustomColor.customPurple
        textField.font = .systemFont(ofSize: 16)
        
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.spellCheckingType = .no
        textField.smartQuotesType = .no
        return textField
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "CloseSquare"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()

    private let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(CustomColor.customPurple, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.isUserInteractionEnabled = true
        button.backgroundColor = .clear
        button.isHidden = true
        button.isUserInteractionEnabled = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.isUserInteractionEnabled = true
        configureStackView()
        configureSearchBar()
        configureSearchIcon()
        configureTextField()
        setUpDelegates()
        configureCloseIcon()
        configureCancelButton()
    }

    override func willMove(toWindow window: UIWindow?) {
        if window == nil {
            textField.resignFirstResponder()
        } else {
            textField.text = ""
            DispatchQueue.main.async {
                self.textField.becomeFirstResponder()
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleCancel() {
        print("Cancel tapped - new method")
        textField.text = ""
        cancelButton.isHidden = true
        textField.resignFirstResponder()
    }
    
    
    private func configureStackView() {
        self.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func configureSearchBar() {
        stackView.addArrangedSubview(searchBarView)
        
        searchBarView.centerYAnchor.constraint(equalTo: stackView.centerYAnchor).isActive = true
        searchBarView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        searchBarView.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    }
    
    private func configureSearchIcon() {
        searchBarView.addSubview(searchIcon)
        
        searchIcon.centerYAnchor.constraint(equalTo: searchBarView.centerYAnchor).isActive = true
        searchIcon.leadingAnchor.constraint(equalTo: searchBarView.leadingAnchor, constant: 10).isActive = true
        searchIcon.widthAnchor.constraint(equalToConstant: 24).isActive = true
        searchIcon.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    private func configureTextField() {
        searchBarView.addSubview(textField)

        textField.topAnchor.constraint(equalTo: searchBarView.topAnchor, constant: 10).isActive = true
        textField.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 10).isActive = true
        textField.trailingAnchor.constraint(equalTo: searchBarView.trailingAnchor, constant: -10).isActive = true
        textField.bottomAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: -10).isActive = true
    }
    
    private func setUpDelegates() {
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textField.delegate = self
    }
    
    private func configureCloseIcon() {
        stackView.addArrangedSubview(closeButton)
        
        closeButton.centerYAnchor.constraint(equalTo: stackView.centerYAnchor).isActive = true
//        closeButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10).isActive = true
//        closeButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10).isActive = true

        closeButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        
        closeButton.addTarget(self, action: #selector(closeIconTapped), for: .touchUpInside)
    }
    
    private func configureCancelButton() {
        stackView.addArrangedSubview(cancelButton)
        
        cancelButton.setContentHuggingPriority(.required, for: .horizontal)
        cancelButton.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        cancelButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }

    @objc func cancelButtonTapped() {
        print("Cancelled")
        textField.text = ""
        cancelButton.isHidden = true
        closeButton.isHidden = false
    }
    
    @objc func closeIconTapped() {
        delegate?.didTapClose()
    }
}

extension AppSearchBar: UITextFieldDelegate {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text?.isEmpty == false {
            cancelButton.isHidden = false
            closeButton.isHidden = true
        } else {
            cancelButton.isHidden = true
            closeButton.isHidden = false
        }
        
        self.layoutIfNeeded()
    }
}
