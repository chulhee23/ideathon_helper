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
        current_user.team = @team
        current_user.save
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
    
    def apply
        current_user.team = Team.find(params[:id])
        current_user.save
        redirect_to team_path(current_user.team)
    end
    
    def recruit
        team = Team.find(params[:id])
        if team.recruitment
            team.recruitment = false
        else
            team.recruitment = true
        end
        team.save
        redirect_to team_path(team)

    end

    private
    def team_params
        params.require(:team).permit(:team_name, :title, :content, {avatars: []})
    end
end
