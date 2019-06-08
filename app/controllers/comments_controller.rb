class CommentsController < ApplicationController
    def create
        @team = Team.find(params[:team_id])
        @comment = @team.comments.create(team_params)
        @comment.commenter=current_user.name
        @comment.save
        redirect_to team_path(@team)
    end

    private
    def team_params
      params.require(:comment).permit(:body, :secret)
    end
end
