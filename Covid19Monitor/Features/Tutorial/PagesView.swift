//
//  PagesView.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 1/4/21.
//

import SwiftUI

struct PagesView<Page: View>: View {
    
    @State private var currentPage = 0
    @Binding var isTutorialRequired : Bool
    
    var viewControllers: [UIHostingController<Page>]
    
    init(_ views: [Page], isTutorialRequired: Binding<Bool>) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
        self._isTutorialRequired = isTutorialRequired
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
                .ignoresSafeArea()
            PageControl(pageCount: viewControllers.count, currentPage: $currentPage)
                .padding(.trailing)
        }
    }
}
