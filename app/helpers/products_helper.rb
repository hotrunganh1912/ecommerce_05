module ProductsHelper
  def current_order
    load_order_id
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      @current_user = current_user
      unless @current_user == nil
        Order.new(users_id: @current_user.id)
      else
       Order.new()
     end
   end
 end

 private
 def load_order_id
  session.delete(:order_id) if Order.find_by(id: session[:order_id]).nil?
end
end
