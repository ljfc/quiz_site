<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  load_and_authorize_resource

  def new
    respond_with @<%= singular_table_name %>
  end
  def create
    flash[:notice] = I18n.t([:<%= plural_table_name %>, :create, :notice]) if @<%= orm_instance.save %>
    respond_with @<%= singular_table_name %>
  end


  def index
    respond_with @<%= plural_table_name %>
  end

  def show
    respond_with @<%= singular_table_name %>
  end

  def edit
    respond_with @<%= singular_table_name %>
  end
  def update
    flash[:notice] = I18n.t([:<%= plural_table_name %>, :update, :notice]) if @<%= orm_instance.update_attributes("params[:#{singular_table_name}]") %>
    respond_with @<%= singular_table_name %>
  end

  def destroy
    flash[:notice] = I18n.t([:<%= plural_table_name %>, :destroy, :notice]) if @<%= orm_instance.destroy %>
    respond_with @<%= singular_table_name %>
  end
end
<% end -%>
