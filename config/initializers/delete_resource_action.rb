# Extend resourceful routing to include a delete path.
# This is used to handle graceful degradation of delete links without Javascript.

module DeleteResourceRoute
  def resources(*args, &block)
    super(*args) do
      yield if block_given?
      member do
        get :delete # This will be called when Javascript is not used.
        delete :delete, action: :destroy # This will be called a) if Javascript is used or b) if it is triggered from the delete.html.erb template form.
      end
    end
  end
end

ActionDispatch::Routing::Mapper.send(:include, DeleteResourceRoute)
