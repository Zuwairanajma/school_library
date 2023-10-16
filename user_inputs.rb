class UserInput
  def self.self_get(prompt = '')
    print prompt unless prompt.empty?
    gets.chomp.to_i
  end

  def self.get_input(prompt = '')
    print prompt unless prompt.empty?
    gets.chomp
  end

  def self.user_permission(prompt = '')
    print prompt unless prompt.empty?
    gets.chomp.downcase == 'y'
  end
end
