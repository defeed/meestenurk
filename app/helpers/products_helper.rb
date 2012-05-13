module ProductsHelper
  def number_to_euro(number)
    number_to_currency(number, :unit => "&euro;", :separator => ",", :delimiter => "", :format => "%n %u")
  end
end
