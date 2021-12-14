//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
    setupLayout()
      
    let purpleBox = UIView()
      purpleBox.backgroundColor = .purple
      purpleBox.translatesAutoresizingMaskIntoConstraints = false
      mainView.addSubview(purpleBox)
      
    let redBox = UIView()
        redBox.translatesAutoresizingMaskIntoConstraints = false
        redBox.backgroundColor = .red
        mainView.addSubview(redBox)
      
    let innerOrangeBox1 = UIView()
        innerOrangeBox1.translatesAutoresizingMaskIntoConstraints = false
        innerOrangeBox1.backgroundColor = .orange
        redBox.addSubview(innerOrangeBox1)

    let innerOrangeBox2 = UIView()
        innerOrangeBox2.translatesAutoresizingMaskIntoConstraints = false
        innerOrangeBox2.backgroundColor = .orange
        redBox.addSubview(innerOrangeBox2)
      
    let blueBox1 = UIView()
        blueBox1.translatesAutoresizingMaskIntoConstraints = false
        blueBox1.backgroundColor = .blue

    let blueBox2 = UIView()
        blueBox2.translatesAutoresizingMaskIntoConstraints = false
        blueBox2.backgroundColor = .blue

    let blueBox3 = UIView()
        blueBox3.translatesAutoresizingMaskIntoConstraints = false
        blueBox3.backgroundColor = .blue

    var boxArray = [UIView]()
        boxArray = [blueBox1,blueBox2,blueBox3]
      
    let verticalStackView = UIStackView(arrangedSubviews: boxArray)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .equalSpacing
        mainView.addSubview(verticalStackView)



    NSLayoutConstraint.activate([
        purpleBox.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20),
        purpleBox.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20),
        purpleBox.heightAnchor.constraint(equalToConstant: 50),
        purpleBox.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.7),
        
        redBox.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
        redBox.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20),
        redBox.widthAnchor.constraint(equalToConstant: 150),
        redBox.heightAnchor.constraint(equalToConstant: 50),
        
        innerOrangeBox1.leftAnchor.constraint(equalTo: redBox.leftAnchor, constant: 10),
        innerOrangeBox1.topAnchor.constraint(equalTo: redBox.topAnchor, constant: 10),
        innerOrangeBox1.widthAnchor.constraint(equalTo: redBox.widthAnchor, multiplier: 0.5),
        innerOrangeBox1.heightAnchor.constraint(equalToConstant: 30),
    
        innerOrangeBox2.rightAnchor.constraint(equalTo: redBox.rightAnchor, constant: -10),
        innerOrangeBox2.topAnchor.constraint(equalTo: redBox.topAnchor, constant: 10),
        innerOrangeBox2.widthAnchor.constraint(equalTo: redBox.widthAnchor, multiplier: 0.3),
        innerOrangeBox2.heightAnchor.constraint(equalToConstant: 30),
        
        verticalStackView.widthAnchor.constraint(equalToConstant: 50),
        verticalStackView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.75),
        verticalStackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
        verticalStackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
        
        blueBox1.widthAnchor.constraint(equalToConstant: 50),
        blueBox1.heightAnchor.constraint(equalToConstant: 50),
        
        blueBox2.widthAnchor.constraint(equalToConstant: 50),
        blueBox2.heightAnchor.constraint(equalToConstant: 50),
        
        blueBox3.widthAnchor.constraint(equalToConstant: 50),
        blueBox3.heightAnchor.constraint(equalToConstant: 50),
    ])
  }

  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}

