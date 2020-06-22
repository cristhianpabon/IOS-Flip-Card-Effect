//
//  ViewController.swift
//  IOS-Swift-Flip-Card-Effect
//
//  Created by c.pabon.cuellar on 27/04/2020.
//  Copyright © 2020 cristhia.pabon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFrontCard: Bool = true
    
    //MARK: UI Components
    private lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cardStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    private lazy var frontCard: UIImageView = {
        let image = UIImage(named: "frontcard")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        imageView.isHidden = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var backCard: UIImageView = {
        let image = UIImage(named: "backcard")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var rotateButton: UIButton = {
        let button = UIButton()
        button.setTitle("ROTATE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.79, green: 0.13, blue: 0.38, alpha: 1.00)
        button.addTarget(self, action: #selector(didPressRotateButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpView()
    }
    
    //MARK: Events
    @objc func didPressRotateButton(){
        changeCardState()
    }
    
    //MARK: Methods
    func changeCardState(){
        if isFrontCard {
            cardView.flipFromLeft(withDuration: 1)
            frontCard.isHidden = true
            backCard.isHidden = false
            isFrontCard = false
        } else {
            rotateButton.isEnabled = false
            cardView.flipFromLeft(withDuration: 1)
            frontCard.isHidden = false
            backCard.isHidden = true
            isFrontCard = true
            rotateButton.isEnabled = true
        }
    }
}

extension  ViewController{
    
    //MARK: Programmatically
    func setUpView(){
        buildViewHierarchy()
        setUpConstraints()
        setUpAdditionalConfigs()
    }
    
    
    func buildViewHierarchy() {
        view.addSubview(cardView)
        cardView.addSubview(cardStack)
        cardStack.addArrangedSubview(frontCard)
        cardStack.addArrangedSubview(backCard)
        view.addSubview(rotateButton)
    }

    func setUpConstraints() {
        setUpCardView()
        setUpCardStack()
        setUpRotateButton()
    }

    func setUpAdditionalConfigs() {
        setUpViewBackground()
        setUpNavigationController()
    }
    
    //MARK: Constraints Methods
    func setUpCardView(){
        cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 400).isActive = true
    }
    
    func setUpCardStack(){
        cardStack.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 0).isActive = true
        cardStack.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 0).isActive = true
        cardStack.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 0).isActive = true
        cardStack.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 0).isActive = true
    }
    
    func setUpFrontCard(){
        frontCard.topAnchor.constraint(equalTo: cardStack.topAnchor, constant: 0).isActive = true
        frontCard.bottomAnchor.constraint(equalTo: cardStack.bottomAnchor, constant: 0).isActive = true
        frontCard.leadingAnchor.constraint(equalTo: cardStack.leadingAnchor, constant: 0).isActive = true
        frontCard.trailingAnchor.constraint(equalTo: cardStack.trailingAnchor, constant: 0).isActive = true
    }
    
    func setUpBackCard(){
        backCard.topAnchor.constraint(equalTo: cardStack.topAnchor, constant: 0).isActive = true
        backCard.bottomAnchor.constraint(equalTo: cardStack.bottomAnchor, constant: 0).isActive = true
        backCard.leadingAnchor.constraint(equalTo: cardStack.leadingAnchor, constant: 0).isActive = true
        backCard.trailingAnchor.constraint(equalTo: cardStack.trailingAnchor, constant: 0).isActive = true
    }
    
    func setUpRotateButton(){
        rotateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        rotateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rotateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        rotateButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    //MARK: Additional Method Configs
    func setUpViewBackground(){
        let colorTop =  UIColor(red: 0.94, green: 0.21, blue: 0.49, alpha: 1.00).cgColor
        let colorBottom = UIColor(red: 0.50, green: 0.09, blue: 0.25, alpha: 1.00).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.frame = self.view.bounds
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func setUpNavigationController(){
        navigationItem.title = "IOS-Swift-Flip-Card-Effect"
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.50, green: 0.09, blue: 0.25, alpha: 1.00)
    }
}
