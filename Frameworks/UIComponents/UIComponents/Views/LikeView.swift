//
//  LikeView.swift
//  UIComponents
//
//  Created by Петр Тартынских  on 04.03.2022.
//

import UIKit

public final class LikeView: UIView {
    
    // MARK: - Private Properties
    
    private var heartView = HeartView()
    
    // MARK: - Init
    
    public init(size: CGFloat) {
        super.init(frame: .zero)
        setup(size: size)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIView
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseOut]) {
            self.update(isTouched: true)
        }
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        UIView.animate(withDuration: 0.3) {
            self.update(isTouched: false)
            self.heartView.toggle()
        }
    }

    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        UIView.animate(withDuration: 0.3) {
            self.update(isTouched: false)
        }
    }
    
    // MARK: - Private Methods
    
    private func setup(size: CGFloat) {
        layer.cornerRadius = 10
        backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        addSubview(heartView)
        
        translatesAutoresizingMaskIntoConstraints = false
        heartView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: size),
            widthAnchor.constraint(equalToConstant: size),
            heartView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            heartView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            heartView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            heartView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)
        ])
    }
    
    private func update(isTouched: Bool) {
        if isTouched {
            heartView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        } else {
            heartView.transform = .identity
        }
    }
}

// MARK: - Heart

private final class HeartView: UIView {
    
    // MARK: - Private Properties
    
    private let strokeColor: UIColor
    private let strokeWidth: CGFloat
    private var filled: Bool
    
    // MARK: - Init
    
    init(strokeColor: UIColor = .red,
         strokeWidth: CGFloat = 2.0,
         filled: Bool = true) {
        self.strokeColor = strokeColor
        self.strokeWidth = strokeWidth
        self.filled = filled
        super.init(frame: .zero)
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIView
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let bezierPath = UIBezierPath(heartIn: bounds)

        strokeColor.setStroke()

        bezierPath.lineWidth = strokeWidth
        bezierPath.stroke()
        
        if filled {
            strokeColor.setFill()
            bezierPath.fill()
        }
    }
    
    // MARK: - Public Methods
    
    public func toggle() {
        filled.toggle()
        setNeedsDisplay()
    }
}

private extension UIBezierPath {
    convenience init(heartIn rect: CGRect) {
        self.init()

        //Calculate Radius of Arcs using Pythagoras
        let sideOne = rect.width * 0.4
        let sideTwo = rect.height * 0.3
        let arcRadius = sqrt(sideOne*sideOne + sideTwo*sideTwo)/2

        //Left Hand Curve
        addArc(withCenter: CGPoint(x: rect.width * 0.3,
                                   y: rect.height * 0.35),
               radius: arcRadius,
               startAngle: 135.degreesToRadians,
               endAngle: 315.degreesToRadians,
               clockwise: true)

        //Top Centre Dip
        addLine(to: CGPoint(x: rect.width/2,
                            y: rect.height * 0.2))

        //Right Hand Curve
        addArc(withCenter: CGPoint(x: rect.width * 0.7,
                                   y: rect.height * 0.35),
               radius: arcRadius,
               startAngle: 225.degreesToRadians,
               endAngle: 45.degreesToRadians,
               clockwise: true)

        //Right Bottom Line
        addLine(to: CGPoint(x: rect.width * 0.5,
                            y: rect.height * 0.95))

        //Left Bottom Line
        self.close()
    }
}

private extension Int {
    var degreesToRadians: CGFloat { return CGFloat(self) * .pi / 180 }
}
