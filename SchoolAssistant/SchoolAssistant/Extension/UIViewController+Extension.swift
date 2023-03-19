//
//  UIViewController+Extension.swift
//  SchoolAssistant
//
//  Created by Александра on 17.03.23.
//

import UIKit

extension UIViewController {
    func addFullScreen(childViewController child: UIViewController) {
        guard child.parent == nil else {
            return
        }
        
        addChild(child)
        view.addSubview(child.view)
        
        view.backgroundColor = .white
        view.tintColor = .white
        
        child.view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            view.leadingAnchor.constraint(equalTo: child.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: child.view.trailingAnchor),
            view.topAnchor.constraint(equalTo: child.view.topAnchor),
            view.bottomAnchor.constraint(equalTo: child.view.bottomAnchor)
        ]
        constraints.forEach { $0.isActive = true }
        view.addConstraints(constraints)
        
        child.didMove(toParent: self)
    }
    
    func remove(childViewController child: UIViewController?) {
        
        guard let child = child, child.parent != nil else { return }
        
        let transition: CATransition = CATransition()
        transition.duration = 0.25
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transition.type = .push
        transition.subtype = .fromLeft
        child.parent!.view.layer.add(transition, forKey: nil)
        
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
}
