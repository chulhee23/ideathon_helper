class TeamsController < ApplicationController
    def index
        @teams = Team.all
    end
    def show
        @team = Team.find(params[:id])
    end
    def new
        @team = Team.new
    end
       
    def create
        @team = Team.new(team_params)
        @team.writer="user name"
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
    
    end
       
    private
    def team_params
        params.require(:team).permit(:team_name, :title, :content, {avatars: []})
    end
end
