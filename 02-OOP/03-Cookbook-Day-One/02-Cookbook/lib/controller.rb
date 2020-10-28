require_relative 'view'
require_relative 'cookbook'


class Controller
  def initilaize
    @cookbook = Cookbook.new
  end

  def list
    recipes = @cookbook.all
    @view.display(recipes)
  end
end
#   def create

#   end

#   def destroy
#     @destroy
#   end
# end
