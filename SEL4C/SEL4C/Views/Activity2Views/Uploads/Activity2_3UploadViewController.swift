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
    
    // MARK: Scrollable View
    private let myView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .link
        return view
    }()
    
    // MARK: Scrollable
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollableBorderView.addSubview(myView)
    }
}

extension Activity2_3UploadViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        let location = touch.location(in: scrollableBorderView)
        
        if myView.bounds.contains(location){
            print("Touched at: \(location.x), \(location.y)")
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        <#code#>
    }
}
