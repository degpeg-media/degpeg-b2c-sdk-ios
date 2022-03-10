//
//  DScrollViewContainer.swift
//  DScrollView
//
//  Created by Apple on 3/10/22.
//
import UIKit
public class DScrollViewElement: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init(size: CGSize, backgroundColor: UIColor = .white) {
        self.init()
        withWidth(size.width)
        withHeight(size.height)
        self.backgroundColor = backgroundColor
    }
    
    public convenience init(width: CGFloat, height: CGFloat, backgroundColor: UIColor = .white) {
        self.init()
        withWidth(width)
        withHeight(height)
        self.backgroundColor = backgroundColor
    }
    
    public convenience init(width: CGFloat, backgroundColor: UIColor = .white) {
        self.init()
        withWidth(width)
        self.backgroundColor = backgroundColor
    }
    
    public convenience init(height: CGFloat, backgroundColor: UIColor = .white) {
        self.init()
        withHeight(height)
        self.backgroundColor = backgroundColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


