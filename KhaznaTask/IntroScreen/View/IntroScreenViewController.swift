//
//  IntroScreenViewController.swift
//  KhaznaTask
//
//  Created by Mark Shafik on 26/08/2024.
//

import Foundation
import UIKit

class IntroScreenViewController: UIViewController {
    
    var presenter: IntroScreenPresenterProtocol?
    
    // Define UI components
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white // Set background color
        
        setupViews()
        animateLogo()
        cornerImageView()
    }
    
    func setupViews() {
        view.addSubview(logoImageView)
        
        // Layout constraints for logoImageView
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 180), // Adjust size as needed
            logoImageView.heightAnchor.constraint(equalToConstant: 180) // Adjust size as needed
        ])
    }
    
    func cornerImageView() {
        // Corner the image view by rounding the corners
        logoImageView.layer.cornerRadius = 20  // Adjust the radius to your preference
        logoImageView.layer.masksToBounds = true  // This ensures the corners are clipped
    }
    
    func animateLogo() {
        // Initial opacity
        logoImageView.alpha = 0
        
        // Animate logo image view
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseIn], animations: {
            self.logoImageView.alpha = 1
            self.logoImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
                self.logoImageView.transform = .identity
            }) { _ in
                // Navigate to the next screen after animation
                self.presenter?.navigateToPostsList()
            }
        }
    }
}
