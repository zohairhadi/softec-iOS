//
//  PageVC.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//

import UIKit

class PageVC: UIViewController {
    
    var page: Pages
    var descriptionLabel: UILabel = {
        var l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = NSLocalizedString("Find more people with ease now", comment: "Find more people with ease now")
        if #available(iOS 13.0, *) {
            l.textColor = .label
        }
        l.font = l.font.withSize(19)
        l.numberOfLines = 2
        l.textAlignment = .center
        l.lineBreakMode = .byWordWrapping
        return l
    }()

    var titleImage: UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.contentMode = .scaleAspectFit
        i.image = UIImage(named: "Carousel-Flower-1")
        return i
    }()
    
    init(with page: Pages) {
        self.page = page
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        
        self.view.addSubview(titleImage)
        titleImage.image = page.titleImage
        titleImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        titleImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        titleImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120).isActive = true
        titleImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120).isActive = true
        
        self.view.addSubview(descriptionLabel)
        descriptionLabel.text = page.descriptionLabel
        descriptionLabel.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90).isActive = true
        
    }
}
