//
//  PostDetailsViewController.swift
//  KhaznaTask
//
//  Created by Mark Shafik on 26/08/2024.
//

import UIKit

class PostDetailsViewController: UIViewController, PostDetailsViewProtocol {
    
    var presenter: PostDetailsPresenterProtocol?
    
    // Define UI components
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bodyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 40, weight: .bold, scale: .large)
        let heartImage = UIImage(systemName: "heart", withConfiguration: largeConfig)
        button.setImage(heartImage, for: .normal)
        button.tintColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var isLiked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.viewDidLoad()
        view.backgroundColor = .white
        setupLikeButtonAnimation()
    }
    
    func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(bodyLabel)
        view.addSubview(likeButton)
        
        // Layout constraints for titleLabel
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Layout constraints for bodyLabel
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            bodyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bodyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Layout constraints for likeButton
            likeButton.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 40),
            likeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            likeButton.widthAnchor.constraint(equalToConstant: 80),
            likeButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    // Setup the Like button animation
    func setupLikeButtonAnimation() {
        likeButton.addTarget(self, action: #selector(handleLikeButton), for: .touchUpInside)
    }
    
    @objc func handleLikeButton() {
        isLiked.toggle()
        animateLikeButton(isLiked: isLiked)
    }
    
    func animateLikeButton(isLiked: Bool) {
        // Animate the button color and image
        UIView.animate(withDuration: 0.3) {
            if isLiked {
                let largeConfig = UIImage.SymbolConfiguration(pointSize: 40, weight: .bold, scale: .large)
                self.likeButton.setImage(UIImage(systemName: "heart.fill", withConfiguration: largeConfig), for: .normal)
                self.likeButton.tintColor = .systemRed
            } else {
                let largeConfig = UIImage.SymbolConfiguration(pointSize: 40, weight: .bold, scale: .large)
                self.likeButton.setImage(UIImage(systemName: "heart", withConfiguration: largeConfig), for: .normal)
                self.likeButton.tintColor = .lightGray
            }
            
            // Scale animation for the button (bounce effect)
            self.likeButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        } completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.likeButton.transform = .identity
            }
        }
    }
    
    func showPostDetails(title: String, body: String) {
        titleLabel.text = title
        bodyLabel.text = body
    }
    
    func showLikeAnimation() {
        // Add your custom like animation here
        UIView.animate(withDuration: 0.3, animations: {
            self.likeButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                self.likeButton.transform = CGAffineTransform.identity
            }
        }
    }
}


