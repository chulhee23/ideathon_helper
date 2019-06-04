class TeamsController < ApplicationController
    def index
    
    end
    def show
        @team = Team.find(params[:id])
    end
    def new
        @team = Team.new
    end
       
    def create
        @team = Team.new(team_params)
<<<<<<< HEAD
 
=======
        
>>>>>>> 1e1fa2290e50acd8399f9651b250cd8a592fe6e1
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
<<<<<<< HEAD
    private
    def team_params
        params.require(:team).permit(:team_name, :title, :writer, :content, :recruitment, :avatar)
=======
       
    private
    def team_params
        params.require(:team).permit(:team_name, :title, :text, {avatars: []})
>>>>>>> 1e1fa2290e50acd8399f9651b250cd8a592fe6e1
    end
end
