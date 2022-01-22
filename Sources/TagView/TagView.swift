//
//  TagView.swift
//  TagView
//
//  Created by Daniil Alferov on 22.01.2022.
//

import UIKit

open class TagView: UIView {
    
    private var label: UILabel = UILabel(frame: .zero)
    private var leadingConstraint: NSLayoutConstraint!
    private var topConstraint: NSLayoutConstraint!
    private var trailingConstraint: NSLayoutConstraint!
    private var bottomConstraint: NSLayoutConstraint!
    private var widthConstraint: NSLayoutConstraint!

    open var insets: UIEdgeInsets = UIEdgeInsets.zero {
        didSet {
            self.leadingConstraint.constant = insets.left
            self.topConstraint.constant = insets.top
            self.trailingConstraint.constant = insets.right
            self.bottomConstraint.constant = insets.bottom
            setNeedsUpdateConstraints()
        }
    }

    open var text: String = "" {
        didSet {
            self.label.text = text
            self.updateSize()
        }
    }
    
    open var textColor: UIColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) {
        didSet {
            self.label.textColor = self.textColor
        }
    }
    
    open var font: UIFont = UIFont.systemFont(ofSize: 15.0, weight: .medium) {
        didSet {
            self.label.font = self.font
            self.updateSize()
        }
    }
    
    open var tagColor: UIColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0) {
        didSet {
            self.backgroundColor = self.tagColor
        }
    }
    
    open var cornerRadius: CGFloat = 6.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupDefaultConstaints()
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupDefaultConstaints()
        setup()
    }
    
    private func updateSize() {
        self.widthConstraint.constant = text.width(withConstrainedHeight: self.label.frame.height, font: self.font)
        setNeedsUpdateConstraints()
    }
    
    private func setupDefaultConstaints() {
        self.topConstraint = self.label.topAnchor.constraint(equalTo: self.topAnchor, constant: self.insets.top)
        self.bottomConstraint = self.bottomAnchor.constraint(equalTo: self.label.bottomAnchor, constant: self.insets.bottom)
        self.leadingConstraint = self.label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.insets.left)
        self.trailingConstraint = self.trailingAnchor.constraint(equalTo: self.label.trailingAnchor, constant: self.insets.right)
        self.widthConstraint = self.label.widthAnchor.constraint(equalToConstant: 0.0)
    }
    
    func setup() {
        self.layer.cornerRadius = self.cornerRadius
        self.backgroundColor = self.tagColor
        
        self.label.textColor = self.textColor
        self.label.font = self.font
        self.label.backgroundColor = .clear
        self.label.lineBreakMode = .byTruncatingMiddle
        self.label.numberOfLines = 1
        self.label.textAlignment = .center
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.label)
        self.setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            self.topConstraint,
            self.trailingConstraint,
            self.bottomConstraint,
            self.leadingConstraint,
            self.widthConstraint,
         ])
    }
    
    open override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
}
