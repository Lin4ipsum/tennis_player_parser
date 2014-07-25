class Player

  attr_reader :last_name, :first_name, :gender, :date_of_birth, :favorite_color

  def initialize(last_name, first_name, gender, date_of_birth, favorite_color)
    @last_name       = last_name
    @first_name      = first_name
    @gender          = gender
    @date_of_birth   = date_of_birth
    @favorite_color  = favorite_color
  end
end
