//
//  Arrow.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 22/02/21.
//

import UIKit

class Arrow: UIView {
    //MARK: - Properties
    var isActive: Bool = false
    
    //MARK: - Initializers
    convenience init(isRight: Bool, isActive: Bool) {
        self.init(frame: .zero)
        self.isActive = isActive
        
        if isRight {
            rotate(angle: 180)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .init(white: 1, alpha: 0)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Actions
    override func draw(_ rect: CGRect) {
        guard let currentContext = UIGraphicsGetCurrentContext() else { print("Could not get the Context"); return}
        drawRectangle(currentContext, isFilled: true)
       
    }
    
    private func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: radians)
        self.transform = rotation
    }
    
    private func drawRectangle(_ context: CGContext, isFilled: Bool) {
        let strokeDistance = CGFloat(bounds.size.height / 4)
        let centerPoint  = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        
        let lowerLeftCorner = CGPoint(x: centerPoint.x  - strokeDistance, y: centerPoint.y + strokeDistance * 1.5)
        let lowerRightCorner = CGPoint(x: centerPoint.x + strokeDistance, y: centerPoint.y - strokeDistance / 5)
        let upperLeftCorner = CGPoint(x: centerPoint.x - strokeDistance, y: centerPoint.y - strokeDistance * 1.5)
        
        context.move(to: lowerLeftCorner)
        context.addLine(to: lowerLeftCorner)
        context.addLine(to: lowerRightCorner)
        context.addLine(to: upperLeftCorner)
        context.addLine(to: lowerLeftCorner)
        
        context.setLineCap(.square)
        context.setLineWidth(2.0)
        
        if isFilled {
            let color = isActive ? UIColor.red.cgColor : UIColor.lightGray.cgColor
            context.setFillColor(color)
            context.fillPath()
        } else {
            context.setStrokeColor(UIColor.red.cgColor)
            context.strokePath()
        }
    }
    
    func active() {
        isActive = true
    }
    
    func desactive() {
        isActive = false
    }
}
