//
//  Extensions.swift
//  employD Application
//
//  Created by Grant Levy on 11/29/19.
//  Copyright © 2019 Grant Levy. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let appCyan = UIColor.rgb(red: 68, green: 215, blue: 182)
    
    static let appGray = UIColor.rgb(red: 104, green: 104, blue: 105)
}

var imageCache = [String: UIImage]()

extension UIImageView {
    
    func loadImage(with urlString: String) {
        
        // Check if image exists in cache
        if let cachedImage = imageCache[urlString] {
            self.image = cachedImage
            return
        }
        
        // If image does not exist in cache
        // URL for image location
        guard let url = URL(string: urlString) else { return }
        
        // Fetch contents of URL
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // Handle error
            if let error = error {
                print("Failed to load image with error ", error.localizedDescription)
            }
            
            // Receive image data
            guard let imageData = data else { return }
            
            // Create image using data
            let photoImage = UIImage(data: imageData)
            
            // Set key and value for image cache
            imageCache[url.absoluteString] = photoImage
            
            // Set image
            DispatchQueue.main.async {
                self.image = photoImage
            }
        }.resume()
    }
    
}
