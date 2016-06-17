class HomeController < ApplicationController
  def index
    # cookies.signed[:abc] = "Hello World"
    # cookies.signed[:hey] = "Hello World"
    # session[:abd] = "Hello World"
    # session[:sun] = "Hello"

  end

  def greet
    #we can use symbols or strings to access params
    @name = params[:name]


  end
#methods defined in controllers are called 'actions'
  def about
    # render text: "About us"
    # this tells Rails to look for a file: /app/views/home/about.html.erb
    #it wil rneder the file and send it as a response.
    # layout: :application tells Rails to use:
    #
    #render :about, layout: "application"

  end



end
