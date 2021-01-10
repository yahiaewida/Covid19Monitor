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
    var isLastPage : Bool = false
}

struct PageViewContent : View {
    
    var model: PageViewContentModel
    @Binding var isTutorialRequired : Bool
    
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
                
                HStack(alignment: .bottom) {
                    Spacer()
                    if model.isLastPage {
                        Button(action: {
                            isTutorialRequired = false
                        }, label: {
                            Text("Getting Started")
                                .font(Font.system(size: 16))
                                .foregroundColor(Color.white)                                
                        })
                        .padding([.trailing],10)
                        
                    }
                }.padding([.top], 30)
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
                description: Text(verbatim: "Content")), isTutorialRequired: .constant(true))
    }
}
