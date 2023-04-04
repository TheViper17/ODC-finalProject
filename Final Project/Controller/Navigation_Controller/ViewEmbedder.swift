//
//  ViewEmbedder.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 31/03/2023.
//

import UIKit

class ViewEmbeder{
    
    private class func builder(
        parent:UIViewController,
        child:UIViewController,
        container:UIView){
            
            child.willMove(toParent: parent)
            parent.addChild(child)
            container.addSubview(child.view)
            child.beginAppearanceTransition(true, animated: true)
            child.didMove(toParent: parent)
            let w = container.frame.size.width
            let h = container.frame.size.height
            child.view.frame = CGRect(x: 0, y: 0, width: w, height: h)
    }
    
    
    class func embed(_ ID:String, storyboard:String = "Main", parent:UIViewController, container:UIView){
        
        let storyBoard = UIStoryboard(name: storyboard, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: ID)
        
        builder(parent: parent, child: vc, container: container)
    }
}
