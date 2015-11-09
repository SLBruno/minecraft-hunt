class Video < ActiveRecord::Base
    acts_as_votable
    belongs_to :user
<<<<<<< 500198eef32f1224f8b3dce9ad663d1b6f5eda97
=======
    has_many :comments
>>>>>>> v0.3 - comentários adicionados
    
    YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i

  validates :link, presence: true, format: YT_LINK_FORMAT
end
