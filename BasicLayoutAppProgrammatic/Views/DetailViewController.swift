//
//  DetailViewController.swift
//  BasicLayoutAppProgrammatic
//
//  Created by Raul Barranco on 7/13/22.
//

import UIKit

class DetailViewController: UIViewController {

    lazy var progDetailImageView: UIImageView = {
        
        let detailImageView = UIImageView(frame: .zero)
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        detailImageView.contentMode = .scaleAspectFit
        detailImageView.backgroundColor = .systemCyan
        return detailImageView
        
    }()
    
    lazy var progLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    lazy var progButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tap Me", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(self.progButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(self.whatsGoodieButton(sender:)), for: .touchUpInside)
        return button
    }()

    let text: String
    
    init(text: String) {
        
        self.text = text
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemGreen
        self.setUpUI()
        self.progLabel.text = self.text
        self.progDetailImageView.image = UIImage(named: self.text)
        
    }
    
    private func setUpUI() {
        
        self.view.addSubview(self.progDetailImageView)
        self.view.addSubview(self.progLabel)
        self.view.addSubview(self.progButton)
        
        self.progDetailImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.progDetailImageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.progDetailImageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        self.progDetailImageView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        self.progDetailImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        //self.progDetailImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -44).isActive = true
        
        self.progLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.progLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.progLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        //self.progLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -44).isActive = true
        self.progLabel.topAnchor.constraint(equalTo: self.progDetailImageView.bottomAnchor, constant: 16).isActive = true

        self.progButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.progButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.progButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        //self.progButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 44).isActive = true
        self.progButton.topAnchor.constraint(equalTo: self.progLabel.bottomAnchor, constant: 16).isActive = true
        
    }
    
    @objc
    func progButtonPressed() {
        print("Button was Tapped!!!")
        print(self.text)
    }
    
    @objc fileprivate func whatsGoodieButton(sender: UIButton) {
        
        print("whats goodie guys & gals!")
        self.animateView(sender)
        
    }
    
    fileprivate func animateView(_ viewToAnimate: UIView) {
        
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
            
        }) { (_) in
            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
        
    }

}
