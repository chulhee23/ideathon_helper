class Comment < ApplicationRecord
  belongs_to :team
  
  # def show_secret
  #   if self.secret ==true
  #     if current_user.name == self.commenter
  #       return self.body      
  #     elsif current_user.name == team.writer

  #       return self.body
  #     else
  #       return '비밀댓글입니다.'
  #     end

  #   end
  #    return self.body
  # end

end
