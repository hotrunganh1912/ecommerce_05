module UsersHelper
  def selete_sex
    User.sexes.keys.map{|sex| [sex.titleize, sex]}
  end
end
