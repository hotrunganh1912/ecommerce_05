module ProductsHelper
  def select_category
    Category.all.map{|p| [p.name, p.id]}
  end
end
