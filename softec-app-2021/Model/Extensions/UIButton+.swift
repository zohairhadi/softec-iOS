//
//  UIButton+.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//
import UIKit

//MARK:- BigButton Class
class BigCustomButton : UIButton {

    required init(titleString : String, size: CGFloat) {
        super.init(frame: .zero)
        let titleColor = #colorLiteral(red: 0.5581660867, green: 0.4481821656, blue: 1, alpha: 1)
        let textColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 27
        backgroundColor = titleColor
        setTitle(titleString, for: .normal)
        setTitleColor(.white, for: .normal)
        setTitleColor(textColor.withAlphaComponent(0.2), for: .highlighted)
        self.titleLabel!.font = UIFont.boldSystemFont(ofSize: size)
//        self.layer.borderColor = borderColor.cgColor
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK:- Add Button
class SmallCustomButton : UIButton {

    required init(titleString : String, size: CGFloat) {
        super.init(frame: .zero)
        let titleColor = #colorLiteral(red: 0.5581660867, green: 0.4481821656, blue: 1, alpha: 1)
        let textColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 15
        backgroundColor = titleColor
        setTitle(titleString, for: .normal)
        setTitleColor(.white, for: .normal)
        setTitleColor(textColor.withAlphaComponent(0.2), for: .highlighted)
        self.titleLabel!.font = UIFont.boldSystemFont(ofSize: size)
//        self.layer.borderColor = borderColor.cgColor
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK:- Button extension
extension UIButton {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.4
        pulse.fromValue = 0.98
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = .infinity
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
    }
    
    func flash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.3
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 2
        layer.add(flash, forKey: nil)
    }
    
    func animate(transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3,
                       options: [.curveEaseInOut],
                       animations: {
                        self.transform = transform
            }, completion: nil)
    }
}
