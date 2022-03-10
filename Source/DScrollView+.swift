//
//  DScrollView+.swift
//  DScrollView
//
//  Created by Apple on 3/10/22.
//
import UIKit

public enum DViewSafeArea {
    case top, leading, trailing, bottom, vertical, horizontal, all, none
}

extension UIView {
    
    @discardableResult
    public func edgeTo(_ view: UIView, safeArea: DViewSafeArea = .none) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        
        switch safeArea {
        case .top:
            if #available(iOS 11.0, *) {
                topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            } else {
                // Fallback on earlier versions
            }
            if #available(iOS 11.0, *) {
                topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            } else {
                // Fallback on earlier versions
            }
            if #available(iOS 11.0, *) {
                topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            } else {
                // Fallback on earlier versions
            }
            if #available(iOS 11.0, *) {
                topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            } else {
                // Fallback on earlier versions
            }
            leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        case .leading:
            topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            if #available(iOS 11.0, *) {
                leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            } else {
                // Fallback on earlier versions
            }
            trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        case .trailing:
            topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            if #available(iOS 11.0, *) {
                trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            } else {
                // Fallback on earlier versions
            }
            bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        case .bottom:
            topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            if #available(iOS 11.0, *) {
                bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            } else {
                // Fallback on earlier versions
            }
        case .vertical:
          
            if #available(iOS 11.0, *) {
                topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
                leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
                trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
                bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            } else {
                // Fallback on earlier versions
            }
        case .horizontal:
            
            if #available(iOS 11.0, *) {
                topAnchor.constraint(equalTo: view.topAnchor).isActive = true
                leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
                trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            } else {
                // Fallback on earlier versions
            }
            bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        case .all:
           
            if #available(iOS 11.0, *) {
                topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
                leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
                trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
                bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            } else {
                // Fallback on earlier versions
            }
        case .none:
            topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        return self
    }
    
    @discardableResult
    public func withBackground(color: UIColor) -> UIView {
        backgroundColor = color
        return self
    }
    
    @discardableResult
    public func withBackground(image: UIImage, contentMode: ContentMode = .scaleAspectFit) -> UIView {
        let imageView = UIImageView(image: image.withRenderingMode(.alwaysOriginal))
        imageView.contentMode = contentMode
        self.addSubview(imageView)
        imageView.edgeTo(self)
        return self
    }
    
    @discardableResult
    public func addStatusBarCover(backgroundColor: UIColor = .white) -> UIView {
        let cover = UIView().withBackground(color: backgroundColor)
        addSubview(cover)
        
        cover.translatesAutoresizingMaskIntoConstraints = false
        
        
        if #available(iOS 11.0, *) {
            cover.topAnchor.constraint(equalTo: topAnchor).isActive = true
            cover.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            cover.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            cover.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        } else {
            // Fallback on earlier versions
        }
        
        return self
    }
    
    @discardableResult
    public func addScrollView(_ scrollView: DScrollView, withSafeArea: DViewSafeArea = .none, hasStatusBarCover: Bool = false, statusBarBackgroundColor: UIColor = .white, container: DScrollViewContainer, elements: UIView...) -> UIView {
        addSubview(scrollView)
        scrollView.addSubview(container)
        
        if hasStatusBarCover {
            addStatusBarCover(backgroundColor: statusBarBackgroundColor)
        }
        
        scrollView.edgeTo(self, safeArea: withSafeArea)
        container.edgeTo(scrollView)
        
        elements.forEach { (element) in
            container.addArrangedSubview(element)
        }
        
        return self
    }
    
    @discardableResult
    open func withSize(_ size: CGSize) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return self
    }
    
    @discardableResult
    open func withHeight(_ height: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult
    open func withWidth(_ width: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
}
