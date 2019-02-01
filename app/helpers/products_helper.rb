module ProductsHelper
  def current_order
    load_order_id
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  private
  def load_order_id
    session.delete(:order_id) if Order.find_by(id: session[:order_id]).nil?
  end
end
