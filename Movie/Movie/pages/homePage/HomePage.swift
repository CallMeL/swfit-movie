//
//  HomePage.swift
//  Movie
//
//  Created by 陈汐 on 2021/9/23.
//

import SwiftUI
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}
struct HomePage: View {
    init(){
        let newSwiftColor = UIColor(red: 128, green: 139, blue: 247)
        UISegmentedControl.appearance().selectedSegmentTintColor = newSwiftColor
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor:UIColor.white], for: .selected)
    }
    @EnvironmentObject var modelData: ModelData
    @State private var showSheets:Bool = false
    @State private var country:Country = .cn
    var body: some View {
        
            NavigationView{
                ScrollView{
                VStack {
                    // homeTitle(title: "各国经典")
                    Picker("各国热映",selection:$country){
                        ForEach(Country.allCases,id:\.self){
                            Text($0.rawValue)
                        }
                        
                    }.pickerStyle(SegmentedPickerStyle())
                    .shadow(radius:5)
                    var featureMovie = Array(modelData.countries[country.rawValue]!.prefix(5))
                    ScrollViewWithScale(items: featureMovie)
                        .padding(.top)
                    homeTitle(title: "猜你喜欢")
                        .padding(.top)
                        movieItem(item: modelData.movies[20])
                            .padding([.top, .leading, .trailing])
                            .foregroundColor(.black)
                        movieItem(item: modelData.movies[40])
                            .padding([.top, .leading, .trailing])
                            .foregroundColor(.black)
                        movieItem(item: modelData.movies[33])
                            .padding([.top, .leading, .trailing])
                            .foregroundColor(.black)
                        movieItem(item: modelData.movies[0])
                            .padding([.top, .leading, .trailing])
                            .foregroundColor(.black)
                    }
                   
                    
                     Spacer()
                    //
                    .navigationBarTitle("电影精选")
                    .navigationBarItems(trailing: Button(action: {
                        showSheets.toggle()
                    }, label: {
                        Image(systemName: "hands.sparkles.fill")
                            .scaleEffect(CGSize(width: 1.3, height: 1.3))
                            
                            .foregroundColor(.red)
                    }))
                    .sheet(isPresented: $showSheets, content: {
                        randomTryPage(isPresented: $showSheets)
                    })
                     
                
            }

            
          
        }
        
            .onAppear{
                modelData.movies.quickSort()
            }
    }
}
struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage() .environmentObject(ModelData())
    }
}

struct ScrollViewWithScale: View {
    var items: [Movie]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing:26){
                ForEach(items){movie in
                    NavigationLink(
                        destination: movieDetailPage(movie: movie),
                        label: {
                            VStack {
                                Image(uiImage:(movie.cover.loadImage()))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 190, height: 300.0)
                                    .clipped()
                                    
                                    .cornerRadius(8)
                                    .shadow(radius: 3)
                                let title = String(movie.name.prefix(while: { (character) -> Bool in
                                    return character != " "
                                }))
                                HStack {
                                    Text(title)
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            
                        })
                }
                
                
            }
            
        }
        
    }
}

struct homeTitle: View {
    var title:String
    var body: some View {
        HStack {
            Text(title)
            Spacer()
        }.padding(.leading)
    }
}

