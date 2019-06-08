class TeamsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :destroy, :edit]
    def index
        @teams = Team.all
    end
    def show
        @team = Team.find(params[:id])
        @comments_num = @team.comments.count
    end
    def new
        @team = Team.new
    end
       
    def create
        @team = Team.new(team_params)
        @team.writer=current_user.name
        @team.recruitment = true
        if @team.save
            redirect_to @team
        else
            render 'new'
        end
    end
    
    def edit
    
    end
    def update
    
    end
    def destroy
        @team = Team.find(params[:id])
        @team.destroy
        
        redirect_to teams_path
    end
       
    private
    def team_params
        params.require(:team).permit(:team_name, :title, :content, {avatars: []})
    end
end
