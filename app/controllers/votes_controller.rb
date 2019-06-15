class VotesController < ApplicationController
    def create
        # 이미 투표한 팀에 대해선 투표가 이뤄지면 안됨.
        vote = Vote.new(vote_params)
        if (current_user.liked_teams.include? vote.team) 
            redirect_to my_page_path
        
        elsif (current_user.vote_count<3)
            vote.save
            current_user.vote_count += 1
            current_user.save
            redirect_to team_path(vote.team)
        else
            redirect_to my_page_path
        end
            
    end
    
    def destroy
        team = Team.find(params[:team_id])
        current_user.vote_count -= 1
        current_user.liked_teams.delete(team)
        current_user.save
        redirect_to my_page_path
    end

    private
    def vote_params
        params.permit(:user_id, :team_id)
    end

end

