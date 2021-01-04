//
//  PagesViewContent.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 1/4/21.
//

import SwiftUI

struct PageViewContentModel {
    var image: Image
    var title: Text
    var description: Text
}

struct PageViewContent : View {
    
    var model: PageViewContentModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.lightPurple)
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 15) {
                model.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(Color.white)
                    .cornerRadius(30)
                    .padding()
                    
                
                model.title
                    .font(Font.system(size: 32, design: .rounded))
                    .foregroundColor(Color.white)
                
                model.description
                    .font(.body)
                    .foregroundColor(Color.white)
                    .lineLimit(nil)
                    .padding()
            }
            .padding()
        }
    }
}

struct OnboardingView_Previews : PreviewProvider {
    static var previews: some View {
        PageViewContent(
            model: PageViewContentModel(
                image: Image("News1"),
                title: Text(verbatim: "Preview"),
                description: Text(verbatim: "Content")))
    }
}
