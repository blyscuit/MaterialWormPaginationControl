//
//  MaterialWormPaginationControl.swift
//  SBITO
//
//  Created by Pisit W on 18/6/2563 BE.
//  Copyright © 2563 23Perspective. All rights reserved.
//

import UIKit

class MaterialWormPaginationControl: UIControl {
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 8
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        shareInitialization()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        shareInitialization()
    }
    
    func shareInitialization() {
        addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    
     public var currentPage: Int = 0 {
        didSet {
            refreshImagesOfDots()
        }
    }
    
     public var numberOfPages: Int = 0 {
        didSet {
            for (pageIndex, dotView) in stackView.arrangedSubviews.enumerated() {
                dotView.removeFromSuperview()
            }
            for n in 0..<numberOfPages {
                let view = DotView(frame: .init(x: 0, y: 0, width: 10, height: 10))
                view.widthConstraint = view.widthAnchor.constraint(equalToConstant: 10)
                view.widthConstraint?.isActive = true
                stackView.addArrangedSubview(view)
            }
            refreshImagesOfDots()
        }
    }
    
     var pageIndicatorTintColor: UIColor? {
        didSet {
            refreshImagesOfDots()
        }
    }
    
     var currentPageIndicatorTintColor: UIColor? {
        didSet {
            refreshImagesOfDots()
        }
    }
    
    func refreshImagesOfDots() {
        customPageControl(dotFillColor: currentPageIndicatorTintColor ?? .white, notDotColor: pageIndicatorTintColor ?? .gray, dotBorderWidth: 1)
    }
    
    func customPageControl(dotFillColor:UIColor, notDotColor:UIColor, dotBorderWidth:CGFloat) {
        //        for (pageIndex, dotView) in self.subviews.enumerated() {
        //            if self.currentPage == pageIndex {
        ////                dotView.backgroundColor = self.currentPageIndicatorTintColor
        //                dotView.transform = CGAffineTransform(scaleX: 3, y: 1)
        //                dotView.layer.cornerRadius = dotView.frame.size.height / 2
        //            }else{
        ////                dotView.backgroundColor = self.pageIndicatorTintColor
        //                dotView.transform = .identity
        //                dotView.layer.cornerRadius = dotView.frame.size.height / 2
        //            }
        //        }
        
        //        let stackView = UIStackView()
        //        self.addSubview(stackView)
        
        layoutIfNeeded()
        UIView.animate(withDuration: 0.3) {
            for (pageIndex, dotView) in self.stackView.arrangedSubviews.enumerated() {
                if self.currentPage == pageIndex {
                    dotView.backgroundColor = dotFillColor
                    dotView.widthConstaint?.constant = 32
                    dotView.layer.cornerRadius = dotView.frame.size.height / 2
                }else{
                    dotView.backgroundColor = notDotColor
                    dotView.widthConstaint?.constant = 10
                    dotView.layer.cornerRadius = dotView.frame.size.height / 2
                }
            }
            //            self.bounds = self.stackView.bounds
            self.layoutIfNeeded()
        }
    }
}

class DotView: UIView {
    var widthConstraint: NSLayoutConstraint?
}
