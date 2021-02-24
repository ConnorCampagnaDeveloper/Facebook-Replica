//
//  ContentView.swift
//  FacebookReplica
//
//  Created by Connor Campagna on 23/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    let facebookRGB = UIColor(red: 23/255.0, green: 120/255.0, blue: 242/255.0, alpha: 1)
    
    @Binding var text : String
    
    let stories = ["story1","story2","story3","story1","story2","story3"]
    
    var body: some View {
        VStack {
            HStack {
                Text("Facebook")
                    .font(.system(size: 48, weight: .bold, design: .default))
                    .foregroundColor(Color(facebookRGB))
                
                Spacer()
                
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
            }
            .padding()
            
            TextField("Search...", text: $text)
                .padding(7)
                .background(Color(.systemGray6))
                .cornerRadius(13)
                .padding(.horizontal, 15)
                
            ZStack {
                Color(.secondarySystemBackground)
                
                ScrollView(.vertical){
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 3) {
                               
                                ForEach(stories, id: \.self ){ name in
                                    Image(name)
                                        .resizable()
                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        .frame(width: 140, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .clipped()
                                        .cornerRadius(20)
                                    
                                }
                                
                            }
                            .padding()
                        }
                            
                       posts(name: "Mark Zuckerberg", Post: "Hey guys i made this cool website to see if im cool or not!", imagename:"person1")
                        Spacer()
                        posts(name: "Jeff Bezos", Post: "I am the leader of amazon!", imagename:"person2")
                         Spacer()
                        posts(name: "Bill Gates", Post: "Im better i made microsoft!", imagename:"person3")
                         Spacer()
                    }
                }
            }
            
            Spacer()
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(text: .constant(""))
    }
}


struct posts : View {
    
    @State var isLiked : Bool = false
    
    let name : String
    let Post : String
    let imagename : String
    
    
    var body: some View {
        VStack {
            HStack {
                Image(imagename)
                    .resizable()
                    .frame(width:50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .cornerRadius(25)
                
                VStack {
                    HStack {
                        Text(name)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 18, weight: .semibold, design: .default))
                        Spacer()
                    }
                    HStack {
                        Text("12 Minutes Ago")
                            .foregroundColor(Color(.secondaryLabel))
                        Spacer()
                    }
                  
                }
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Text(Post)
                    .font(.system(size: 24, weight: .regular, design: .default))
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Button(action: {
                    isLiked.toggle()
                }, label: {
                    Text(isLiked ? "Liked" : "Like")
                })
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("Comment")
                })
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("Share")
                })
            }
            .padding()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(7)
    }
    
}



