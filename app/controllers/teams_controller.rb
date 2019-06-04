class TeamsController < ApplicationController
    def index
    
    end
    def show
    
    end
    def new
        @team = Team.new
    end
       
    def create
        @team = Team.new(team_params)
        
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
        params.require(:team).permit(:team_name, :title, :text, {avatars: []})
    end
end
