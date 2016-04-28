class RepositoriesController < ApplicationController
  def index
    github = GithubService.new(access_hash)
    @repos_array = github.get_repos
  end

  def create
    github = GithubService.new(access_hash)
    github.create_repo(params[:name])
    
    redirect_to '/'
  end

private
  def access_hash
    {"access_token" => session[:token]}
  end
  
end
