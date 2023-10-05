//
//  Activity2_3UploadViewController.swift
//  SEL4C
//
//  Created by Esther Ramírez on 28/09/23.
//

import UIKit

class Activity2_3UploadViewController: UIViewController {
    // MARK: Scroll inside View
    @IBOutlet weak var scrollableBorderView: UIView!
    
    // MARK: Last position
    
    // MARK: Scrollable View
    private let myView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .link
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private var isDragging: Bool = false
    
    // MARK: Scrollable
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(myView)
    }
}

extension Activity2_3UploadViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        let location = touch.location(in: view)
        
        if myView.bounds.contains(location){
            isDragging = true
            print("Touched at: \(location.x), \(location.y)")
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isDragging, let touch = touches.first else {
            return
        }
        
        let location = touch.location(in: view)
        myView.frame.origin.x = location.x - myView.frame.width / 2
        myView.frame.origin.y = location.y - myView.frame.height / 2
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDragging = false
    }
}
