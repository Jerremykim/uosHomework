class PosterController < ApplicationController
    @@api_url='http://www.omdbapi.com/?t='

    def index
        @movie_list = List.all
    end
    
    def new_movie
        require('json')
        require('open-uri')
        
        poster_info = []
        title = params[:title]
        temp_url = @@api_url + title
        info_page = open(temp_url)
        data = info_page.read
        poster_info = JSON.parse(data)
        
        new = List.new
        new.title = title
        new.director = poster_info["Director"]
        new.genre = poster_info["Genre"]
        new.poster = poster_info["Poster"]
        new.save
        
        redirect_to '/'
        
    end
    
    def delete
        delete_list = List.find(params[:id])
        delete_list.destroy
        
        redirect_to '/'
        
    end
    
    def edit
        
        genre = params[:genre]
        edit_list = List.find(params[:id])
        edit_list.genre = genre
        director = params[:director]
        edit_list.director = director
        edit_list.save
        redirect_to '/'
    end
    
end