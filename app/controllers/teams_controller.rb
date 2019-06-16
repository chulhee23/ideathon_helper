class TeamsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :show, :destroy, :edit]
    def index
        @teams = Team.all
    end
    
    def show
        @team = Team.find(params[:id])
        @comments_num = @team.comments.count
    end
    def new
        if current_user.captain or (current_user.team !=nil)
            redirect_to team_path(current_user.team)
        else
            @team = Team.new
        end
    end
       
    def create
        if current_user.captain or (current_user.team !=nil)
            redirect_to team_path(current_user.team)
        else
            @team = Team.new(team_params)
            @team.writer=current_user.name
            @team.recruitment = true
            if @team.save
                current_user.team = @team
                current_user.captain = true
                current_user.belonging = true
                current_user.save
                redirect_to @team
            else
                render 'new'
            end
        end
    end
    
    def edit
        @team = Team.find(params[:id])

    end
    def update
        @team = Team.find(params[:id])
 
        if @team.update(team_params)
            redirect_to @team
        else
            render 'edit'
        end
    
    end
    def destroy
        @team = Team.find(params[:id])
        @team.users.each do |u|
            u.belonging = false
            u.team = nil
            u.save
        end
        @team.destroy
        current_user.captain=false
        current_user.save
        redirect_to teams_path
    end
    
    def apply
        if current_user.captain
            @message = "이미 소속된 팀이 있습니다."
        else
            if current_user.belonging !=true
                current_user.team = Team.find(params[:id])
                current_user.save
                redirect_to team_path(current_user.team)    
            else
                @message = "이미 소속된 팀이 있습니다."
                redirect_to team_path(current_user.team)    
            end

        end
        
    end
    
    def cancel
        current_user.team = nil
        current_user.save
        redirect_to '/'
    end


    def accept
        temp_user = User.find(params[:id])

        if temp_user.belonging != true
            temp_user.belonging = true
            temp_user.save
            redirect_to team_path(current_user.team)
        else
            redirect_to team_path(current_user.team)
        end
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
    def my_page

        @my_vote = current_user.liked_teams
    end

    def csv_files
        @results=[]
        User.all.each do |u|
            tmp = Array.new
            tmp.push(u.name)
            @results.push(tmp)
            u.liked_teams.each do |t|
                tmp.push(t.team_name)
            end
        end
        
        respond_to do |format|
            format.html
            format.csv { send_data @results.to_csv }
        end
        
    end
    
    private
    def team_params
        params.require(:team).permit(:team_name, :title, :content, {avatars: []})
    end
end
