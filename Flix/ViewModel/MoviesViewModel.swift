//
//  MoviesViewModel.swift
//  Flix
//
//  Created by Lillian Chen on 9/21/20.
//

import Foundation
import Combine

class MoviesViewModel: ObservableObject {
    
    let title: String = "Movies"
    
    @Published private(set) var movies: [Movie] = [Movie]()
    
    private var cancellable: AnyCancellable?
    
    init() {
        cancellable = MovieService().fetchMovies()
                        .sink(receiveCompletion: { _ in
                            
                        }, receiveValue: { [weak self] movieResults in
                            guard let self = self else { return }
                            self.movies = movieResults.results
                        })
    }
    
}
