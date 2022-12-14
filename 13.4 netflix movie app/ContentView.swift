import SwiftUI

struct ContentView: View {
   
    @ObservedObject var store1:MovieStore
    let columns:[GridItem] = Array(repeating: .init(.flexible()), count: 3)
    var body: some View {
        NavigationView(content: {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(store1.movies  ?? [Movie](), id:\.imdbID){ eachMovie in
                        
                        NavigationLink {
                            MovieDetails(movieTitle: eachMovie.Title, movieId: eachMovie.imdbID, moviePoster: eachMovie.Poster)
                        } label: {
                            VStack(spacing:30){
                                URLImage(url:eachMovie.Poster)
                                    .frame(width: 100,height: 150)
                                Text("\(eachMovie.Title)")
                                    .frame(maxHeight:.infinity,alignment:.top)
                            }
                        }
                        
                        
                    }
                    
                }
            }
            .navigationTitle("Movies Api ")
        })
        .onAppear{
            store1.getAll()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store1: MovieStore())
    }
}
