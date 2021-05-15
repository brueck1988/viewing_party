class WelcomeController < ApplicationController
  skip_before_action :authorize

  def index
    #render users#index
  end
end
