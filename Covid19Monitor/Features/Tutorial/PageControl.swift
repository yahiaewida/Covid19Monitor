//
//  PageControl.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 1/4/21.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    
    var pageCount: Int
    
    class PageCoordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
    
    @Binding var currentPage: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = pageCount
        pageControl.addTarget(context.coordinator, action: #selector(PageCoordinator.updateCurrentPage(sender:)), for: .valueChanged)
        
        return pageControl
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    func makeCoordinator() -> PageCoordinator {
        PageCoordinator(self)
    }
}
