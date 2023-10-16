class UserInput
  def self_get
    gets.chomp.to_i
  end

  def user_permission
    gets.chomp.downcase == 'y'
  end
end
