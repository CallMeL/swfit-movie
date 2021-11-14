//
//  moviePage.swift
//  myMovie
//
//  Created by 陈汐 on 2021/9/13.
//
//TODO: 1. 喜欢标记 2. 演员  3. 电影可变
import SwiftUI

struct movieDetailPage: View {
    @EnvironmentObject var modelData: ModelData
    @State var showmoreActors:Bool = false
    @State var lineActor:Int = 2
    @State var showmoreIntro:Bool = false
    @State var lineIntro:Int = 5
    @State var hasOriginal = false
    var movie:Movie
    
    
    var movieIndex:Int{
        modelData.movies.firstIndex(where: {$0.id==movie.id})!
    }
    
    @State private var title:String = ""
    //
    @State var offset:CGFloat = 0
    @State var lastOffset:CGFloat = 0
    @GestureState var gestureOffSet: CGFloat = 0
    var body: some View {
        
        VStack{
            VStack {
                imageView
                Spacer()
            }.ignoresSafeArea()
                       
                ScrollView{

                        ZStack {
                                Rectangle()
                                    .frame(height: 700)
                                    .cornerRadius(30)
                                    .foregroundColor(.white)
                                    .opacity(0.7)
                                    .brightness(-0.1)
                                VStack {
                                    headerView
                                    let gernArry = movie.geners.components(separatedBy: "/")
                                    HStack {
                                        ForEach(gernArry,id:\.self){text in
                                            gernText(text: text)
                                        }
                                        
                                    }
                                    Text("")
                                    Text("导演:\(movie.director)")
                                        .font(.body)
                                    //vote fav button
                                    HStack(spacing: 150){
                                        VStack {
                                            voteButton(isSet: $modelData.movies[movieIndex].isVoted, voteNume: $modelData.movies[movieIndex].vote)
                                            //Text(movie.vote)
                                            Text("投票")
                                                .font(.subheadline)
                                            
                                        }
                                        VStack {
                                            FavoriteButton(isSet: $modelData.movies[movieIndex].isFavorite)
                                            Text("收藏")
                                                .font(.subheadline)
                                        }
                                    }
                                    //intro
                                    VStack(alignment:.center){
                                        movieIntro(lineActor: lineActor, lineIntro: lineIntro, showmoreActors: $showmoreActors, showmoreIntro: $showmoreIntro, movie: modelData.movies[movieIndex])
                                    }
                                    
                                    .padding(.horizontal,30)
                                    //bookrow
                                   
                                    if movie.hasOriginal{
                                        let book = modelData.books.first(where: {movie.name.contains($0.name)})
                                        originRow(book: book ?? modelData.books[0])
                                    }else{
                                        let book = modelData.books.first(where: {movie.name.contains($0.name)})
                                        originRow(book: book ?? modelData.books[0]).hidden()
                                    }
                                    
                                }
                                .ignoresSafeArea()
                        }

                    //.offset(y:height-600
                }
                .frame(height: 500)
                .offset(y: -90)
        }

        
        .onAppear(){
            hasOriginal = movie.slug=="名著改编"
            title = String(movie.name.prefix(while: { (character) -> Bool in
                return character != " "
            }))
        }
        .onChange(of: showmoreIntro, perform: { value in
            
            lineIntro = showmoreIntro ? 10 : 5
        })
        .onChange(of: showmoreActors, perform: { value in
            lineActor = showmoreActors ? 10 : 2
            
        })
        .onDisappear{
            modelData.movies.quickSort()
        }
    }
    private var imageView:some View{
        Image(uiImage:(movie.cover.loadImage()))
            .resizable()
            .frame(width: .infinity, height: 600)
            //.cornerRadius(30)
            .shadow(radius: /*@START_MENU_TOKEN@*/30/*@END_MENU_TOKEN@*/)
            .ignoresSafeArea()
        
    }
    private var headerView: some View{
        
        VStack(alignment: .center) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
     
        }
        
    }

    mutating func setHasBook(){
        self.movie.hasOriginal = movie.slug=="名著改编"
    }
}

struct movieDetailPage_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        movieDetailPage(movie:modelData.movies[54]) .environmentObject(modelData)
    }
}

struct movieIntro: View {
    var lineActor:Int
    var lineIntro:Int
    @Binding var showmoreActors:Bool
    @Binding var showmoreIntro:Bool
    @State var textActor:String = "更多"
    @State var textIntro:String = "更多"
    var movie:Movie
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Text("上映时间:\(movie.releaseData)")
                    .font(.body)
                    .padding(.bottom)
                Spacer()
                Text("国家:\(movie.region)")
                    .font(.body)
                    .padding(.bottom)
            }
            Text("演员：\(movie.actors )")
                .font(.body)
                .lineLimit(lineActor)
            HStack {
                Spacer()
                Button(action: {
                    showmoreActors.toggle()
                    textActor = showmoreActors ? "收起" : " 更多"
                }, label: {
                    
                    Text(textActor) .font(.footnote)
                })
                .padding(.bottom)
                
            }
            
            Text("简介： \(movie.storyline )")
                .font(.body)
                .lineLimit(lineIntro)
            HStack {
                Spacer()
                Button(action: {
                    showmoreIntro.toggle()
                    textIntro = showmoreIntro ? "收起" : " 更多"
                }, label: {
                    Text(textIntro)
                        .font(.footnote)
                })
                .padding(.bottom)
                
            }
            .padding(.bottom)
            
            
        }
        
        .padding(.top)
    }
}

struct gernText: View {
    var text:String
    var body: some View {
        Text(text)
            .background(Color.black)
            .foregroundColor(.white)
            .font(.headline)
            .shadow(radius:2)
    }
}

struct originRow: View {
    var book:Book
    var body: some View {
        NavigationLink(
            destination: bookDetaileView(book: book),
            label: {
                VStack{
                    Text("原著作品")
                    bookRow(book: book)
                        .padding(.horizontal)
                }
            })
    }

}
